#!/bin/bash
# Test script to compare svelte-check vs svelte-check-rs behavior
set -o pipefail

FAIL=0

echo "=== svelte-check-rs bug repro ==="
echo ""
echo "tsconfig.json exclude: src/excluded/**"
echo "svelte-ignore pragma on line 10 of src/routes/+page.svelte"
echo ""

echo "========================================"
echo "=== svelte-check (official) output ==="
echo "========================================"
echo "(machine format - no JSON available)"
echo ""
SC_OUT=$(bunx svelte-check --tsconfig ./tsconfig.json --output machine 2>&1)
echo "$SC_OUT"
echo ""

echo "========================================"
echo "=== svelte-check-rs output ==="
echo "========================================"
echo "(JSON format)"
echo ""
RS_OUT=$(bunx svelte-check-rs --tsconfig ./tsconfig.json --output json 2>&1)
echo "$RS_OUT" | head -80
echo ""

echo "========================================"
echo "=== Analysis ==="
echo "========================================"

# Issue 1: tsconfig exclude
SC_EXCLUDED=$(echo "$SC_OUT" | grep -c "src/excluded" || true)
RS_EXCLUDED=$(echo "$RS_OUT" | grep -c '"filename": "src/excluded' || true)

echo ""
echo "Issue 1: tsconfig exclude for Svelte diagnostics"
echo "  svelte-check:    src/excluded/ warnings = $SC_EXCLUDED"
echo "  svelte-check-rs: src/excluded/ warnings = $RS_EXCLUDED"

if [ "$SC_EXCLUDED" -eq 0 ] && [ "$RS_EXCLUDED" -gt 0 ]; then
  echo "  ❌ FAIL: svelte-check-rs does not respect tsconfig exclude"
  FAIL=1
elif [ "$SC_EXCLUDED" -eq 0 ] && [ "$RS_EXCLUDED" -eq 0 ]; then
  echo "  ✓ PASS: both respect tsconfig exclude"
else
  echo "  ? UNEXPECTED: svelte-check=$SC_EXCLUDED, svelte-check-rs=$RS_EXCLUDED"
fi

# Issue 2: svelte-ignore pragma
SC_LINE10=$(echo "$SC_OUT" | grep -c "+page.svelte.*10:" || true)
RS_LINE10=$(echo "$RS_OUT" | grep -B1 '"line": 10' | grep -c '"start"' || true)

echo ""
echo "Issue 2: svelte-ignore pragma"
echo "  svelte-check:    line 10 warnings = $SC_LINE10"
echo "  svelte-check-rs: line 10 warnings = $RS_LINE10"

if [ "$SC_LINE10" -eq 0 ] && [ "$RS_LINE10" -gt 0 ]; then
  echo "  ❌ FAIL: svelte-check-rs does not respect svelte-ignore pragma"
  FAIL=1
elif [ "$SC_LINE10" -eq 0 ] && [ "$RS_LINE10" -eq 0 ]; then
  echo "  ✓ PASS: both respect svelte-ignore pragma"
else
  echo "  ? UNEXPECTED: svelte-check=$SC_LINE10, svelte-check-rs=$RS_LINE10"
fi

echo ""
echo "========================================"
if [ "$FAIL" -eq 1 ]; then
  echo "=== RESULT: FAIL (behavior differs) ==="
  exit 1
else
  echo "=== RESULT: PASS (behavior matches) ==="
  exit 0
fi
