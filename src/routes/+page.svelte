<h1>svelte-check-rs bug repro</h1>

<!-- Test: svelte-ignore pragma should suppress this warning -->
<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
<div id="pragma-test" tabindex="0">pragma test</div>

<!-- Test: no pragma - should warn -->
<div id="no-pragma-test" tabindex="0">no pragma test</div>
