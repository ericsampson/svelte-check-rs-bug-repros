# svelte-check-rs repro

Minimal reproduction for `svelte-check-rs` issues.

## Issue 1: tsconfig `exclude` not respected for Svelte diagnostics

The official `svelte-check` respects tsconfig `exclude` patterns for all diagnostics including Svelte-specific ones (a11y, CSS, etc.). `svelte-check-rs` does not.

### Setup

**tsconfig.json:**
```json
{
  "exclude": ["src/excluded/**"]
}
```

**src/excluded/Test.svelte:**
```svelte
<div tabindex="0">Should not warn - in excluded folder</div>
```

### Results

```bash
bun run check      # 1 file checked, no warning from src/excluded/
bun run check:rs   # 6 files checked, warns about src/excluded/Test.svelte
```

| Tool | Files checked | Respects tsconfig exclude |
|------|---------------|---------------------------|
| svelte-check | 1 | ✓ Yes |
| svelte-check-rs | 6 | ✗ No |

### Workaround

Use `--ignore` flag:
```bash
svelte-check-rs --ignore "src/excluded/**"
```

---

## Issue 2: svelte-ignore pragma not respected

Inline `<!-- svelte-ignore -->` comments that suppress warnings on specific elements are ignored.

### Reproduction

**src/routes/+page.svelte:**
```svelte
<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
<div tabindex="0">This warning should be suppressed</div>
```

### Results

```bash
bun run check      # pragma respected, no warning
bun run check:rs   # pragma ignored, warning shown
```

| Tool | svelte-ignore pragma |
|------|----------------------|
| svelte-check | ✓ respected |
| svelte-check-rs | ✗ ignored |

---

## Setup

```bash
bun install
bun run check      # official svelte-check
bun run check:rs   # svelte-check-rs
```
