<script lang="ts">
	let items: string[] = [];
</script>

<h1>Svelte Ignore Pragma Tests</h1>

<h2>A11y Warnings</h2>

<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
<div tabindex="0">a11y test (should be suppressed)</div>

<!-- No pragma - should warn -->
<div tabindex="0">a11y test (should warn)</div>

<h2>Non-A11y Warnings</h2>

<!-- Test: empty block warning (correct name: block_empty) -->
<!-- svelte-ignore block_empty -->
{#if true}
{/if}

<!-- No pragma - should warn about empty block -->
{#if true}
{/if}

<!-- Test: unused CSS selector -->
<style>
	/* svelte-ignore css_unused_selector */
	.unused-class {
		color: red;
	}

	/* No pragma - should warn */
	.another-unused {
		color: blue;
	}
</style>
