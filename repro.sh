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
SC_NOPRAGMA=$(echo "$SC_OUT" | grep -c 'no-pragma-test' || true)
RS_NOPRAGMA=$(echo "$RS_OUT" | grep -c 'no-pragma-test' || true)
echo "  svelte-check:    $SC_NOPRAGMA"
echo "  svelte-check-rs: $RS_NOPRAGMA"
[ "$SC_NOPRAGMA" -eq "$RS_NOPRAGMA" ] && echo "  ✓ PASS"

echo ""
echo "src/routes/missing-checks-test.svelte (SHOULD warn - block_empty, css_unused_selector, export_let_unused):"
SC_MISSING=$(echo "$SC_OUT" | grep -c 'missing-checks-test' || true)
RS_MISSING=$(echo "$RS_OUT" | grep -c 'missing-checks-test' || true)
echo "  svelte-check:    $SC_MISSING"
echo "  svelte-check-rs: $RS_MISSING"
[ "$RS_MISSING" -lt "$SC_MISSING" ] && FAIL=1 && echo "  ❌ FAIL (missing checks not implemented)"

echo ""
echo "src/routes/colon-import-test.svelte (should NOT error - colon in import specifier):"
SC_COLON_ERRORS=$(echo "$SC_OUT" | grep 'colon-import-test' | grep -c 'ERROR' || true)
RS_COLON_ERRORS=$(echo "$RS_OUT" | grep 'colon-import-test' | grep -c 'ERROR' || true)
echo "  svelte-check:    $SC_COLON_ERRORS errors"
echo "  svelte-check-rs: $RS_COLON_ERRORS errors"
[ "$RS_COLON_ERRORS" -gt 0 ] && FAIL=1 && echo "  ❌ FAIL (parsing error with colon in import)"

echo ""
echo "=== Result ==="
echo ""
if [ "$FAIL" -eq 1 ]; then
  echo "❌ FAIL"
  exit 1
else
  echo "✓ PASS"
  exit 0
fi
