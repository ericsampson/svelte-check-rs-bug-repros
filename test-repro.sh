#!/bin/bash
# Test script to compare svelte-check vs svelte-check-rs behavior
set -o pipefail

FAIL=0

echo "=== svelte-check-rs bug repro ==="
echo ""

echo "========================================"
echo "=== svelte-check (official) ==="
echo "========================================"
SC_OUT=$(bunx svelte-check --tsconfig ./tsconfig.json --output machine 2>&1)
echo "$SC_OUT"
echo ""

echo "========================================"
echo "=== svelte-check-rs ==="
echo "========================================"
RS_OUT=$(bunx svelte-check-rs --tsconfig ./tsconfig.json --output json 2>&1)
echo "$RS_OUT"
echo ""

echo "========================================"
echo "=== Analysis ==="
echo "========================================"

# Issue 1: tsconfig exclude (src/excluded/** should be excluded)
SC_EXCLUDED=$(echo "$SC_OUT" | grep -c "src/excluded" || true)
RS_EXCLUDED=$(echo "$RS_OUT" | jq '[.[] | select(.filename | startswith("src/excluded"))] | length')

echo ""
echo "Issue 1: tsconfig exclude"
echo "  Files in src/excluded/ should not be checked"
echo "  svelte-check:    $SC_EXCLUDED warnings from src/excluded/"
echo "  svelte-check-rs: $RS_EXCLUDED warnings from src/excluded/"

if [ "$SC_EXCLUDED" -eq 0 ] && [ "$RS_EXCLUDED" -gt 0 ]; then
  echo "  ❌ FAIL: svelte-check-rs does not respect tsconfig exclude"
  FAIL=1
elif [ "$SC_EXCLUDED" -eq 0 ] && [ "$RS_EXCLUDED" -eq 0 ]; then
  echo "  ✓ PASS"
fi

# Issue 2: svelte-ignore pragma
# +page.svelte has 2 divs with tabindex: one with svelte-ignore, one without
# Expected: 1 warning (only the one without pragma)
SC_PAGE=$(echo "$SC_OUT" | grep -c "+page.svelte" || true)
RS_PAGE=$(echo "$RS_OUT" | jq '[.[] | select(.filename | endswith("+page.svelte"))] | length')

echo ""
echo "Issue 2: svelte-ignore pragma"
echo "  +page.svelte has 2 tabindex divs: one with pragma, one without"
echo "  Expected: 1 warning (pragma should suppress the other)"
echo "  svelte-check:    $SC_PAGE warnings"
echo "  svelte-check-rs: $RS_PAGE warnings"

if [ "$SC_PAGE" -eq 1 ] && [ "$RS_PAGE" -gt 1 ]; then
  echo "  ❌ FAIL: svelte-check-rs does not respect svelte-ignore pragma"
  FAIL=1
elif [ "$SC_PAGE" -eq 1 ] && [ "$RS_PAGE" -eq 1 ]; then
  echo "  ✓ PASS"
fi

echo ""
echo "========================================"
if [ "$FAIL" -eq 1 ]; then
  echo "RESULT: FAIL (behavior differs)"
  exit 1
else
  echo "RESULT: PASS (behavior matches)"
  exit 0
fi
