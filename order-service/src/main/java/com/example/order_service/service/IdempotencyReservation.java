package com.example.order_service.service;

import com.example.order_service.entity.IdempotencyKey;

// newlyReserved=true  -> is request ne key li hai, isse business logic execute karni hai.
// newlyReserved=false -> key pehle se kisi aur request ne li hui hai (PROCESSING ya COMPLETED).
public record IdempotencyReservation(boolean newlyReserved, IdempotencyKey keyRecord) {
}
