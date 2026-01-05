# svelte-check-rs bug repros

Minimal reproductions for `svelte-check-rs` issues compared to the original `svelte-check` implementation.

## Issues

1. **tsconfig exclude not respected** - `src/excluded/` is in tsconfig exclude but still checked
2. **svelte-ignore pragma not respected** - `<!-- svelte-ignore a11y_* -->` comments are ignored
3. **Missing Svelte checks** - only a11y checks exist; missing `block_empty`, `css_unused_selector` (note: `export_let_unused` is Svelte 4 only)
4. **Parsing error with colon in import** - imports like `import 'virtual:something'` cause parsing errors on `<svelte:head>` and `:global()` selectors

## Run

```bash
bun install
bun run repro
```

## Current Output

```
=== svelte-check (official) ===
WARNING "src/routes/missing-checks-test.svelte" 5:11 "Empty block..."
WARNING "src/routes/missing-checks-test.svelte" 9:2 "Unused CSS selector..."
WARNING "src/routes/no-pragma-test.svelte" 1:1 "noninteractive element cannot have..."
COMPLETED 306 FILES 0 ERRORS 3 WARNINGS

=== svelte-check-rs ===
WARNING src/excluded/Test.svelte:1:1 A11y: Non-interactive elements...
WARNING src/routes/no-pragma-test.svelte:1:1 A11y: Non-interactive elements...
WARNING src/routes/pragma-test.svelte:2:1 A11y: Non-interactive elements...
ERROR src/routes/colon-import-test.svelte:7:11 '>' expected. (ts(TS1005))
ERROR src/routes/colon-import-test.svelte:7:13 Unterminated string literal. (ts(TS1002))
ERROR src/routes/colon-import-test.svelte:8:18 ',' expected. (ts(TS1005))
ERROR src/routes/colon-import-test.svelte:8:19 Expression expected. (ts(TS1109))
svelte-check-rs found 4 errors and 3 warnings in 9 files

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

src/routes/missing-checks-test.svelte (SHOULD warn - block_empty, css_unused_selector):
  svelte-check:    2
  svelte-check-rs: 0
  ❌ FAIL (missing checks not implemented)

src/routes/colon-import-test.svelte (should NOT error - colon in import specifier):
  svelte-check:    0 errors
  svelte-check-rs: 4 errors
  ❌ FAIL (parsing error with colon in import)

=== Result ===

❌ FAIL
```
