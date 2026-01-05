<script lang="ts">
	import 'virtual:something';

	let { children } = $props();
</script>

<svelte:head>
	<meta name="theme-color" content="#667eea" />
</svelte:head>

{@render children()}

<style>
	:global(body) {
		margin: 0;
	}
</style>
