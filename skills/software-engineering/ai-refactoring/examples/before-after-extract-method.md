# Before and After: Extract Method

## Before

```text
function canShip(order) {
  if (!order.address || order.address.country != "US") return false;
  if (order.total <= 0 || order.items.length == 0) return false;
  if (order.status != "paid" || order.hasHold) return false;
  return true;
}
```

The method mixes address, value, and fulfillment policy checks. The refactor should preserve order, short-circuit behavior, and the exact result.

## After

```text
function canShip(order) {
  return hasDeliverableAddress(order)
    && hasBillableItems(order)
    && isReadyForFulfillment(order);
}

function hasDeliverableAddress(order) {
  return order.address && order.address.country == "US";
}

function hasBillableItems(order) {
  return order.total > 0 && order.items.length > 0;
}

function isReadyForFulfillment(order) {
  return order.status == "paid" && !order.hasHold;
}
```

## Verification

Run existing cases for missing address, non-US address, empty items, zero total, unpaid orders, holds, and valid orders. If getters or predicates have side effects, preserve their evaluation order or redesign with explicit characterization tests first.
