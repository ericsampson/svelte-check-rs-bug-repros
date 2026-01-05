# svelte-check-rs bug repros

Minimal reproductions for `svelte-check-rs` issues compared to the original `svelte-check` implementation.

## Issues

1. **tsconfig exclude not respected** - `src/excluded/` is in tsconfig exclude but still checked
2. **svelte-ignore pragma not respected** - `<!-- svelte-ignore a11y_* -->` comments are ignored
3. **Missing Svelte checks** - `block_empty`, `css_unused_selector` not implemented (only a11y checks exist)

## Run

```bash
bun install
bun run repro
```

## Current Output

```
=== svelte-check (official) ===
WARNING "src/routes/no-pragma-test.svelte" 1:1 ...
COMPLETED 738 FILES 0 ERRORS 1 WARNINGS 1 FILES_WITH_PROBLEMS

=== svelte-check-rs ===
WARNING src/excluded/Test.svelte:1:1:1:69 ...
WARNING src/routes/no-pragma-test.svelte:1:1:1:48 ...
WARNING src/routes/pragma-test.svelte:2:1:2:53 ...
svelte-check-rs found 0 errors and 3 warnings in 7 files

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

RESULT: FAIL
```
