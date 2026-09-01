# Microservices Demo — Project Notes & Review Log

Living document. Har session me jo naya scenario test hoga, ya jo naya gap milega, yahan update hota rahega.

## 1. Current Architecture

| Service       | Port | Responsibility | Datastore |
|---            |---   |---             |---        |
| eureka-server | 8761 | Service registry (standalone, no peer replication) | — |
| user-service  | 8081 | User CRUD | MySQL + Flyway |
| order-service | 8082 | Order CRUD, calls user-service | MySQL + Flyway |

- Inter-service call: `order-service` → `user-service` via **Feign client** (`UserClient`), resolved through Eureka + Spring Cloud LoadBalancer (no hardcoded URLs — good).
- No API Gateway yet — each service is called directly on its own port.
- No config server — each service carries its own `application.yaml`, secrets pulled from `.env` (not committed — good).

## 2. Active Test Scenario (2026-08-31)

Setup found in the working tree, not yet committed:

- `user-service`: new endpoint `GET /users/slow/{id}` — `Thread.sleep(5000)` before responding.
- `order-service`: `UserClient.getSlowUser()` now used inside `createOrder()` instead of the normal `getUserById()`.
- `order-service` Feign config for `user-service`: `connectTimeout: 2000`, `readTimeout: 2000`.
- New `FeignRetryConfig` bean: `Retryer.Default(period=100ms, maxPeriod=1000ms, maxAttempts=3)`.

**What this is testing:** Feign timeout + retry behavior when a downstream call is slow.

**What will actually happen, and why it matters:** user-service always sleeps 5s; the Feign timeout is 2s. Since the slowness is *constant*, not transient, every one of the 3 attempts will time out the same way — retry can't out-wait a deterministically slow dependency. Total blocking time before `createOrder` finally fails is roughly `3 × 2s` timeouts plus ~1.1s of backoff between attempts (~7s), during which the order-service request thread is held.

This is a good scenario for the real lesson: **retries help with flaky/transient failures, not with a consistently slow dependency.** For the latter you need a circuit breaker (fail fast after N failures instead of retrying blindly) + a fallback response, and ideally a timeout budget at the caller's own controller layer too. Worth doing as the next exercise once this one is verified.

## 3. Findings From This Scan

| # | Where | Issue | Impact |
|---|---|---|---|
| 1 | Both services | No `@ControllerAdvice`/`@ExceptionHandler` anywhere | `RuntimeException("User/Order not found")` leaks to the client as a generic 500 instead of a proper 404 with a clean body |
| 2 | order-service | No fallback/circuit breaker on the Feign client | When user-service is down or slow, order-service has no graceful degradation — just a raw exception after ~7s |
| 3 | Both DTOs | `spring-boot-starter-validation` is a dependency but no `@Valid`/`@NotNull`/`@Size` used anywhere | Bad payloads (blank name, negative quantity, null email) are accepted as-is |
| 4 | order-service | No request-level timeout budget for `order-service`'s own callers | A slow user-service call currently blocks the whole `createOrder` request for ~7s with nothing bounding it from the outside |
| 5 | user-service `UserDto` | `@RequiredArgsConstructor` + a redundant hand-written all-args constructor on the same class | Not a bug (different constructor signatures), just confusing — pick one style |
| 6 | Both services | Only the default `*ApplicationTests` (context-load smoke test) exists | No real unit/integration test coverage yet |
| 7 | eureka-server `application.yaml` | Stray leftover characters (`ßß`) at the end of a comment line | Harmless (inside a YAML comment) but worth cleaning up |
| 8 | Repo root | No top-level README or `.env.example` | A new contributor (or future-you) has to read `application.yaml` to figure out required env vars (`ORDER_DB_URL`, `USER_DB_URL`, etc.) |

Nothing above breaks the current build — these are gaps to close as the project matures, not blockers.

## 4. Production-Readiness Roadmap

Track this as the checklist for "basic learning → production ready":

- **Resilience**: circuit breaker (Resilience4j), fallback methods on Feign clients, bulkhead/thread isolation, sensible timeout budgets end-to-end (gateway → service → downstream)
- **Observability**: centralized logging with correlation/trace IDs, distributed tracing (Micrometer + Zipkin/Tempo), metrics dashboards (Actuator + Prometheus/Grafana)
- **API layer**: API Gateway (Spring Cloud Gateway) instead of calling services on raw ports, OpenAPI/Swagger docs per service
- **Security**: authentication/authorization (JWT/OAuth2), gateway-level rate limiting, no secrets in yaml (already okay — using `.env`)
- **Config management**: externalize config via Spring Cloud Config or similar once services multiply
- **Data**: transaction boundaries between services (saga/outbox pattern once more than one write is involved in a flow), proper error responses (404 vs 500) via `@ControllerAdvice`
- **Testing**: unit tests for services, integration tests (Testcontainers for MySQL), contract tests for Feign clients
- **Deployment**: Dockerfiles per service, docker-compose (or k8s manifests) for local multi-service spin-up, Eureka HA (peer replication) if this goes beyond a single instance
- **Docs**: root README with architecture diagram, how to run locally, required env vars

## 5. How We're Working

This microservices project is being built from scratch to learn it properly, with deliberate fake scenarios/bugs (like the slow-endpoint + timeout test above) introduced to understand failure modes. For each scenario: verify whether the implementation actually reproduces the intended issue, confirm whether the fix/mitigation is correct, and call out anything else spotted along the way. This file gets updated as new scenarios are tried and new gaps are found.
