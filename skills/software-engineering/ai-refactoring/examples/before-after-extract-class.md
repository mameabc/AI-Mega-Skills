# Before and After: Extract Class

## Before

```text
class InvoiceService {
  calculateTax(invoice, region) { ... }
  formatTaxLine(invoice, region) { ... }
  submit(invoice) { ... }
}
```

Tax rules and formatting change independently from submission, but the service owns both responsibilities and is difficult to test.

## After

```text
class TaxCalculator {
  calculate(invoice, region) { ... }
  formatLine(invoice, region) { ... }
}

class InvoiceService {
  constructor(taxCalculator) {
    this.taxCalculator = taxCalculator;
  }

  submit(invoice) {
    const taxLine = this.taxCalculator.formatLine(invoice, invoice.region);
    // Preserve the existing submission transaction and error contract.
    ...
  }
}
```

## Verification

Characterization tests first capture tax rounding, region handling, formatted output, submission ordering, and errors. Then tests verify the new collaborator independently and confirm invoice submission has unchanged results and side effects. The original service facade remains stable while callers migrate.
