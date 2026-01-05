#!/bin/bash
# Test script to compare svelte-check vs svelte-check-rs behavior

echo "=== svelte-check-rs bug repro ==="
echo ""

echo "--- Issue 1: tsconfig exclude ---"
echo "tsconfig.json excludes: src/excluded/**"
echo ""

SC_OUT=$(bunx svelte-check --tsconfig ./tsconfig.json --output machine 2>&1)
RS_OUT=$(bunx svelte-check-rs --tsconfig ./tsconfig.json --output machine 2>&1)

SC_EXCLUDED=$(echo "$SC_OUT" | grep -c "src/excluded" || true)
RS_EXCLUDED=$(echo "$RS_OUT" | grep -c "src/excluded" || true)

echo "svelte-check:    src/excluded/ warnings = $SC_EXCLUDED (expected: 0)"
echo "svelte-check-rs: src/excluded/ warnings = $RS_EXCLUDED (expected: 0)"

if [ "$SC_EXCLUDED" -eq 0 ] && [ "$RS_EXCLUDED" -gt 0 ]; then
  echo "❌ FAIL: svelte-check-rs ignores tsconfig exclude"
else
  echo "✓ PASS"
fi

echo ""
echo "--- Issue 2: svelte-ignore pragma ---"
echo "Line 10 has: <!-- svelte-ignore a11y_no_noninteractive_tabindex -->"
echo ""

SC_LINE10=$(echo "$SC_OUT" | grep -c "+page.svelte.*10:" || true)
RS_LINE10=$(echo "$RS_OUT" | grep -c "+page.svelte:10:" || true)

echo "svelte-check:    line 10 warnings = $SC_LINE10 (expected: 0)"
echo "svelte-check-rs: line 10 warnings = $RS_LINE10 (expected: 0)"

if [ "$SC_LINE10" -eq 0 ] && [ "$RS_LINE10" -gt 0 ]; then
  echo "❌ FAIL: svelte-check-rs ignores svelte-ignore pragma"
else
  echo "✓ PASS"
fi

echo ""
echo "--- Summary ---"
SC_FILES=$(echo "$SC_OUT" | grep "COMPLETED" | sed 's/.*COMPLETED \([0-9]*\) FILES.*/\1/')
RS_FILES=$(echo "$RS_OUT" | grep "in .* files" | sed 's/.*in \([0-9]*\) files/\1/')
echo "svelte-check:    $SC_FILES files checked"
echo "svelte-check-rs: $RS_FILES svelte files checked"
