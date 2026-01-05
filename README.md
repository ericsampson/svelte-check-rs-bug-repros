# svelte-check-rs bug repros

Minimal reproductions for `svelte-check-rs` issues compared to the original `svelte-check` implementation.

## Issues

1. **tsconfig exclude not respected** - `src/excluded/` is in tsconfig exclude but still checked
2. **svelte-ignore pragma not respected** - `<!-- svelte-ignore a11y_* -->` comments are ignored
3. **Missing Svelte checks** - only a11y checks exist; missing `block_empty`, `css_unused_selector`, `export_let_unused`

## Run

```bash
bun install
bun run repro
```

## Current Output

```
=== svelte-check (official) ===
WARNING "src/routes/missing-checks-test.svelte" 5:11 "Empty block..."
WARNING "src/routes/missing-checks-test.svelte" 2:13 "Component has unused export property..."
WARNING "src/routes/missing-checks-test.svelte" 9:2 "Unused CSS selector..."
WARNING "src/routes/no-pragma-test.svelte" 1:1 "noninteractive element cannot have..."
COMPLETED 321 FILES 0 ERRORS 4 WARNINGS

=== svelte-check-rs ===
WARNING src/excluded/Test.svelte:1:1 A11y: Non-interactive elements...
WARNING src/routes/no-pragma-test.svelte:1:1 A11y: Non-interactive elements...
WARNING src/routes/pragma-test.svelte:2:1 A11y: Non-interactive elements...
svelte-check-rs found 0 errors and 3 warnings in 8 files

=== Analysis ===

src/excluded/Test.svelte (should NOT warn - tsconfig exclude):
  svelte-check:    0
  svelte-check-rs: 1
  ❌ FAIL

src/routes/pragma-test.svelte (should NOT warn - has svelte-ignore):
  svelte-check:    0
  svelte-check-rs: 1
  ❌ FAIL

src/routes/no-pragma-test.svelte (SHOULD warn - no pragma):
  svelte-check:    1
  svelte-check-rs: 1
  ✓ PASS

src/routes/missing-checks-test.svelte (SHOULD warn - block_empty, css_unused_selector, export_let_unused):
  svelte-check:    3
  svelte-check-rs: 0
  ❌ FAIL (missing checks not implemented)

RESULT: FAIL
```
