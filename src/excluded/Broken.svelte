<script lang="ts">
	// This file has intentional TypeScript errors
	// It should be excluded from type checking via tsconfig.json "exclude"

	const x: string = 123; // Type error
	const y: number = "hello"; // Type error
</script>

<div>{x} {y}</div>
