# svelte-check-rs bug repros

Minimal reproductions for `svelte-check-rs` issues.

## Issues

1. **tsconfig exclude not respected** - `src/excluded/` is in tsconfig exclude but still checked
2. **svelte-ignore pragma not respected** - `<!-- svelte-ignore -->` comments are ignored

## Run

```bash
bun install
bun run test:repro
```

Expected: `RESULT: PASS`
Actual: `RESULT: FAIL`
