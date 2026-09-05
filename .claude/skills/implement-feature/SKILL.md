---
name: implement-feature
description: Use when implementing a new feature or fix in this microservices project (order-service / user-service / eureka-server) — a careful, incremental workflow that checks real file state before and after every change, confirms architectural judgment calls before coding, and verifies the result instead of assuming it worked.
---

# Implement Feature — careful, incremental workflow

This project is a learning-by-doing microservices setup. Files here get edited from multiple places in the same session — the IDE, manual saves, previous Claude edits — so **never trust conversation memory for what a file currently contains**. This skill exists because that assumption has already caused real bugs in this project (a `Order.java` / `IdempotencyKey.java` edit got silently reverted mid-session and would have shipped broken if it hadn't been re-read before the next change).

## 1. Before writing any code

- **Re-read every file you're about to touch, fresh, right before editing it** — even if you edited it earlier this session. Don't rely on what you remember writing.
- If a system note says a file "changed on disk since you last read it," treat that as real signal, not noise — read it and reconcile before proceeding, and say so if the change looks like a problem instead of silently overwriting it.
- List out the full set of files the feature touches **before starting** (entity → repository → service → controller → config/migration, in that dependency order), so nothing gets implemented half-wired.
- If there's a genuine architectural fork (shared library vs. per-service duplication, which service(s) are in scope, sync vs. async) — ask, don't assume. These are judgment calls that change the shape of the whole implementation, not style preferences.

## 2. While implementing

- Match the file's existing conventions — this codebase uses inline Hinglish comments explaining *why* (timeouts, retry counts, transaction propagation), Lombok `@Getter/@Setter` or `@Data`, and a flat `entity/dto/repository/service/service.impl/controller` package layout per service. Don't introduce a different style in new files.
- Check `pom.xml` before assuming a library is available (Jackson, Lombok, Resilience4j, etc. are already present — most things you'd reach for don't need a new dependency).
- After each `Edit`/`Write`, check the diagnostics feedback that comes back. Fix a compile error immediately — don't stack up three more files on top of a broken one.
- Keep scope to exactly what was asked. If a fix looks like it should also apply somewhere else (e.g. the same bug pattern in a sibling service), name it explicitly and ask instead of silently expanding the change.

## 3. After implementing

- Do a final read-back of every touched/created file together, not just the last one edited — confirm they're internally consistent with each other (interface signatures match impl signatures match controller call sites).
- Don't restart or kill a running dev process (`mvn spring-boot:run`, an IDE-launched JVM) without asking first. Command-line Maven builds in this project have hit Lombok annotation-processing failures that don't happen under the IDE's own run — restarting via a different mechanism than the user is using can break something that was working, and it's their process to control.
- Give the test steps explicitly (a `curl` command or Postman steps) rather than declaring the feature done on the strength of a clean compile — a clean compile only proves it builds, not that it behaves.

## 4. Reporting back

- Keep the summary short: what changed, in which files, and the one command/step to verify it. No re-explaining mechanisms that were already discussed earlier in the session.
- If something was found broken or reverted mid-task that wasn't part of the ask, say so plainly before moving on — don't fix it silently and don't bury it in the middle of an unrelated explanation.
