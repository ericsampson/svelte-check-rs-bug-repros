<script lang="ts">
	let { children } = $props();
</script>

<svelte:head>
	<link rel="manifest" href="/manifest.json" />
	<meta name="theme-color" content="#667eea" />
	<meta name="mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	<link rel="apple-touch-icon" href="/icon-192.svg" />
</svelte:head>

{@render children()}

<style>
	/*
	 * Global Styles
	 */

	:global(body) {
		margin: 0;
		padding: 0;
		font-family: sans-serif;
		background: linear-gradient(180deg, #f0f0f0 0%, #e0e0e0 100%);
		background-attachment: fixed;
		min-height: 100vh;
		overflow-y: scroll;
		color: #333;
	}

	/* Accessibility: Keyboard focus indicators */
	:global(button:focus-visible),
	:global(input:focus-visible),
	:global([tabindex]:focus-visible) {
		outline: 2px solid blue;
		outline-offset: 2px;
	}

	/* Main content area */
	:global(.content) {
		padding: 1rem;
		min-width: min-content;
	}

	/* Base button class - shared properties for all buttons */
	:global(.btn-base) {
		display: inline-flex;
		align-items: center;
		justify-content: center;
		height: 2.5rem;
		padding: 0 1rem;
		border-radius: 0.5rem;
		background: white;
		border: 1px solid #ccc;
		font-size: 1rem;
		font-weight: 500;
		color: #333;
		cursor: pointer;
		user-select: none;
		transition: all 0.2s;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		flex-shrink: 0;
	}

	:global(.btn-base:hover) {
		background: #f0f0f0;
		border-color: blue;
		box-shadow: 0 4px 8px rgba(0,0,0,0.15);
	}

	/* Navigation button variant */
	:global(.nav-btn) {
		padding: 0 1rem;
		border-radius: 0.5rem;
		text-decoration: none;
	}

	:global(.nav-btn:hover) {
		color: blue;
	}
</style>
