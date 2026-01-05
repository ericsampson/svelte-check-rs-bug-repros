
// this file is generated — do not edit it


/// <reference types="@sveltejs/kit" />

/**
 * Environment variables [loaded by Vite](https://vitejs.dev/guide/env-and-mode.html#env-files) from `.env` files and `process.env`. Like [`$env/dynamic/private`](https://svelte.dev/docs/kit/$env-dynamic-private), this module cannot be imported into client-side code. This module only includes variables that _do not_ begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) _and do_ start with [`config.kit.env.privatePrefix`](https://svelte.dev/docs/kit/configuration#env) (if configured).
 * 
 * _Unlike_ [`$env/dynamic/private`](https://svelte.dev/docs/kit/$env-dynamic-private), the values exported from this module are statically injected into your bundle at build time, enabling optimisations like dead code elimination.
 * 
 * ```ts
 * import { API_KEY } from '$env/static/private';
 * ```
 * 
 * Note that all environment variables referenced in your code should be declared (for example in an `.env` file), even if they don't have a value until the app is deployed:
 * 
 * ```
 * MY_FEATURE_FLAG=""
 * ```
 * 
 * You can override `.env` values from the command line like so:
 * 
 * ```sh
 * MY_FEATURE_FLAG="enabled" npm run dev
 * ```
 */
declare module '$env/static/private' {
	export const IS_SANDBOX: string;
	export const SHELL: string;
	export const LSCOLORS: string;
	export const COREPACK_ENABLE_AUTO_PIN: string;
	export const LESS: string;
	export const CONVEX_TMPDIR: string;
	export const DEVCONTAINER: string;
	export const CLAUDE_CODE_ENABLE_SDK_FILE_CHECKPOINTING: string;
	export const HOSTNAME: string;
	export const LANGUAGE: string;
	export const SSH_AUTH_SOCK: string;
	export const ELECTRON_RUN_AS_NODE: string;
	export const REMOTE_CONTAINERS_IPC: string;
	export const YARN_VERSION: string;
	export const CLAUDE_CODE_MAX_OUTPUT_TOKENS: string;
	export const EDITOR: string;
	export const PWD: string;
	export const LOGNAME: string;
	export const ANTHROPIC_CUSTOM_HEADERS: string;
	export const VSCODE_ESM_ENTRYPOINT: string;
	export const NoDefaultCurrentDirectoryInExePath: string;
	export const TZ: string;
	export const CLAUDECODE: string;
	export const HOME: string;
	export const CLAUDE_AGENT_SDK_VERSION: string;
	export const LANG: string;
	export const HISTFILE: string;
	export const LS_COLORS: string;
	export const REMOTE_CONTAINERS: string;
	export const BUN_RUNTIME_TRANSPILER_CACHE_PATH: string;
	export const PROMPT_COMMAND: string;
	export const VSCODE_L10N_BUNDLE_LOCATION: string;
	export const VSCODE_HANDLES_SIGPIPE: string;
	export const TERM: string;
	export const ZSH: string;
	export const REMOTE_CONTAINERS_SOCKETS: string;
	export const ANTHROPIC_DEFAULT_SONNET_MODEL: string;
	export const VISUAL: string;
	export const SHLVL: string;
	export const GIT_EDITOR: string;
	export const PAGER: string;
	export const _P9K_SSH_TTY: string;
	export const VSCODE_CWD: string;
	export const ANTHROPIC_MODEL: string;
	export const VSCODE_RECONNECTION_GRACE_TIME: string;
	export const OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE: string;
	export const BUN_INSTALL_BIN: string;
	export const FNM_RESOLVE_ENGINES: string;
	export const CLAUDE_CODE_ENTRYPOINT: string;
	export const P9K_SSH: string;
	export const LC_ALL: string;
	export const BROWSER: string;
	export const PATH: string;
	export const VSCODE_NLS_CONFIG: string;
	export const NODE_VERSION: string;
	export const VSCODE_HANDLES_UNCAUGHT_ERRORS: string;
	export const OLDPWD: string;
	export const VSCODE_IPC_HOOK_CLI: string;
	export const _: string;
	export const npm_config_local_prefix: string;
	export const npm_config_user_agent: string;
	export const npm_execpath: string;
	export const npm_package_name: string;
	export const npm_package_json: string;
	export const npm_package_version: string;
	export const NODE: string;
	export const npm_node_execpath: string;
	export const npm_command: string;
	export const npm_lifecycle_event: string;
	export const npm_lifecycle_script: string;
	export const NODE_ENV: string;
}

/**
 * Similar to [`$env/static/private`](https://svelte.dev/docs/kit/$env-static-private), except that it only includes environment variables that begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) (which defaults to `PUBLIC_`), and can therefore safely be exposed to client-side code.
 * 
 * Values are replaced statically at build time.
 * 
 * ```ts
 * import { PUBLIC_BASE_URL } from '$env/static/public';
 * ```
 */
declare module '$env/static/public' {
	
}

/**
 * This module provides access to runtime environment variables, as defined by the platform you're running on. For example if you're using [`adapter-node`](https://github.com/sveltejs/kit/tree/main/packages/adapter-node) (or running [`vite preview`](https://svelte.dev/docs/kit/cli)), this is equivalent to `process.env`. This module only includes variables that _do not_ begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) _and do_ start with [`config.kit.env.privatePrefix`](https://svelte.dev/docs/kit/configuration#env) (if configured).
 * 
 * This module cannot be imported into client-side code.
 * 
 * ```ts
 * import { env } from '$env/dynamic/private';
 * console.log(env.DEPLOYMENT_SPECIFIC_VARIABLE);
 * ```
 * 
 * > [!NOTE] In `dev`, `$env/dynamic` always includes environment variables from `.env`. In `prod`, this behavior will depend on your adapter.
 */
declare module '$env/dynamic/private' {
	export const env: {
		IS_SANDBOX: string;
		SHELL: string;
		LSCOLORS: string;
		COREPACK_ENABLE_AUTO_PIN: string;
		LESS: string;
		CONVEX_TMPDIR: string;
		DEVCONTAINER: string;
		CLAUDE_CODE_ENABLE_SDK_FILE_CHECKPOINTING: string;
		HOSTNAME: string;
		LANGUAGE: string;
		SSH_AUTH_SOCK: string;
		ELECTRON_RUN_AS_NODE: string;
		REMOTE_CONTAINERS_IPC: string;
		YARN_VERSION: string;
		CLAUDE_CODE_MAX_OUTPUT_TOKENS: string;
		EDITOR: string;
		PWD: string;
		LOGNAME: string;
		ANTHROPIC_CUSTOM_HEADERS: string;
		VSCODE_ESM_ENTRYPOINT: string;
		NoDefaultCurrentDirectoryInExePath: string;
		TZ: string;
		CLAUDECODE: string;
		HOME: string;
		CLAUDE_AGENT_SDK_VERSION: string;
		LANG: string;
		HISTFILE: string;
		LS_COLORS: string;
		REMOTE_CONTAINERS: string;
		BUN_RUNTIME_TRANSPILER_CACHE_PATH: string;
		PROMPT_COMMAND: string;
		VSCODE_L10N_BUNDLE_LOCATION: string;
		VSCODE_HANDLES_SIGPIPE: string;
		TERM: string;
		ZSH: string;
		REMOTE_CONTAINERS_SOCKETS: string;
		ANTHROPIC_DEFAULT_SONNET_MODEL: string;
		VISUAL: string;
		SHLVL: string;
		GIT_EDITOR: string;
		PAGER: string;
		_P9K_SSH_TTY: string;
		VSCODE_CWD: string;
		ANTHROPIC_MODEL: string;
		VSCODE_RECONNECTION_GRACE_TIME: string;
		OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE: string;
		BUN_INSTALL_BIN: string;
		FNM_RESOLVE_ENGINES: string;
		CLAUDE_CODE_ENTRYPOINT: string;
		P9K_SSH: string;
		LC_ALL: string;
		BROWSER: string;
		PATH: string;
		VSCODE_NLS_CONFIG: string;
		NODE_VERSION: string;
		VSCODE_HANDLES_UNCAUGHT_ERRORS: string;
		OLDPWD: string;
		VSCODE_IPC_HOOK_CLI: string;
		_: string;
		npm_config_local_prefix: string;
		npm_config_user_agent: string;
		npm_execpath: string;
		npm_package_name: string;
		npm_package_json: string;
		npm_package_version: string;
		NODE: string;
		npm_node_execpath: string;
		npm_command: string;
		npm_lifecycle_event: string;
		npm_lifecycle_script: string;
		NODE_ENV: string;
		[key: `PUBLIC_${string}`]: undefined;
		[key: `${string}`]: string | undefined;
	}
}

/**
 * Similar to [`$env/dynamic/private`](https://svelte.dev/docs/kit/$env-dynamic-private), but only includes variables that begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) (which defaults to `PUBLIC_`), and can therefore safely be exposed to client-side code.
 * 
 * Note that public dynamic environment variables must all be sent from the server to the client, causing larger network requests — when possible, use `$env/static/public` instead.
 * 
 * ```ts
 * import { env } from '$env/dynamic/public';
 * console.log(env.PUBLIC_DEPLOYMENT_SPECIFIC_VARIABLE);
 * ```
 */
declare module '$env/dynamic/public' {
	export const env: {
		[key: `PUBLIC_${string}`]: string | undefined;
	}
}
