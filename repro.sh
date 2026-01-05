#!/bin/bash
set -o pipefail

echo "=== svelte-check-rs bug repro ==="
echo ""

echo "=== svelte-check (official) ==="
SC_OUT=$(bunx svelte-check --tsconfig ./tsconfig.json --output machine 2>&1)
echo "$SC_OUT"
echo ""

echo "=== svelte-check-rs ==="
RS_OUT=$(bunx svelte-check-rs --tsconfig ./tsconfig.json --output machine 2>&1)
echo "$RS_OUT"
echo ""

echo "=== Analysis ==="
FAIL=0

# Test files:
# - src/excluded/Test.svelte    -> should NOT appear (tsconfig exclude)
# - src/routes/pragma-test.svelte -> should NOT appear (svelte-ignore pragma)
# - src/routes/no-pragma-test.svelte -> SHOULD appear (no pragma, expected warning)

echo ""
echo "src/excluded/Test.svelte (should NOT warn - tsconfig exclude):"
echo "  svelte-check:    $(echo "$SC_OUT" | grep -c 'excluded/Test' || true)"
echo "  svelte-check-rs: $(echo "$RS_OUT" | grep -c 'excluded/Test' || true)"
[ "$(echo "$RS_OUT" | grep -c 'excluded/Test' || true)" -gt 0 ] && FAIL=1 && echo "  ❌ FAIL"

echo ""
echo "src/routes/pragma-test.svelte (should NOT warn - has svelte-ignore):"
echo "  svelte-check:    $(echo "$SC_OUT" | grep -c 'routes/pragma-test' || true)"
echo "  svelte-check-rs: $(echo "$RS_OUT" | grep -c 'routes/pragma-test' || true)"
[ "$(echo "$RS_OUT" | grep -c 'routes/pragma-test' || true)" -gt 0 ] && FAIL=1 && echo "  ❌ FAIL"

echo ""
echo "src/routes/no-pragma-test.svelte (SHOULD warn - no pragma):"
echo "  svelte-check:    $(echo "$SC_OUT" | grep -c 'no-pragma-test' || true)"
echo "  svelte-check-rs: $(echo "$RS_OUT" | grep -c 'no-pragma-test' || true)"

echo ""
if [ "$FAIL" -eq 1 ]; then
  echo "RESULT: FAIL"
  exit 1
else
  echo "RESULT: PASS"
  exit 0
fi
