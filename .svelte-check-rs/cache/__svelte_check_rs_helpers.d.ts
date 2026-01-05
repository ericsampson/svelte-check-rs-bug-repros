import type { ComponentInternals as SvelteComponentInternals, Snippet as SvelteSnippet } from "svelte";
import type { SvelteHTMLElements as SvelteHTMLElements, HTMLAttributes as SvelteHTMLAttributes } from "svelte/elements";

export {};

declare global {
  type __SvelteComponent<
    Props extends Record<string, any> = {},
    Exports extends Record<string, any> = {}
  > = {
    (this: void, internals: SvelteComponentInternals, props: Props): {
      $on?(type: string, callback: (e: any) => void): () => void;
      $set?(props: Partial<Props>): void;
    } & Exports;
    element?: typeof HTMLElement;
    z_$$bindings?: string;
  };

  type __SvelteSnippet<T extends any[] = any[]> = SvelteSnippet<T>;

  type __SvelteEachItem<T> =
    T extends ArrayLike<infer U> ? U :
    T extends Iterable<infer U> ? U :
    never;

  declare function __svelte_each_indexed<
    T extends ArrayLike<unknown> | Iterable<unknown> | null | undefined
  >(arr: T): [number, __SvelteEachItem<T>][];
  declare function __svelte_is_empty<T extends ArrayLike<unknown> | Iterable<unknown> | null | undefined>(arr: T): boolean;

  declare function __svelte_store_get<T>(store: { subscribe(fn: (value: T) => void): any }): T;

  declare function __svelte_effect(fn: () => void | (() => void)): void;
  declare function __svelte_effect_pre(fn: () => void | (() => void)): void;
  declare function __svelte_effect_root(fn: (...args: any[]) => any): void;

  type __StoreValue<S> = S extends { subscribe(fn: (value: infer T) => void): any } ? T : never;

  type __SvelteOptionalProps<T, K extends keyof T> = Omit<T, K> & Partial<Pick<T, K>>;

  type __SvelteLoosen<T> =
    T extends (...args: any) => any ? T :
    T extends readonly any[] ? T :
    T extends object ? T & Record<string, any> : T;

  type __SveltePropsAccessor<T> = { [K in keyof T]: () => T[K] } & Record<string, () => any>;

  declare const __svelte_snippet_return: ReturnType<SvelteSnippet<[]>>;

  type __SvelteEvent<Target extends EventTarget, E extends Event> = E & {
    currentTarget: Target;
    target: Target;
  };

  // Backwards-compatibility namespace for libraries augmenting `svelteHTML`.
  namespace svelteHTML {
    interface HTMLAttributes<T extends EventTarget = any> {}
  }

  type __SvelteIntrinsicElements = SvelteHTMLElements;
  type __SvelteHTMLAttributesCompat<T extends EventTarget> =
    SvelteHTMLAttributes<T> & svelteHTML.HTMLAttributes<T>;
  type __SvelteEventProps<T> =
    T & { [K in keyof T as K extends `on:${infer E}` ? `on${E}` : never]?: T[K] };
  type __SvelteElementAttributes<K extends string> =
    __SvelteEventProps<
      K extends keyof __SvelteIntrinsicElements
        ? __SvelteIntrinsicElements[K] & svelteHTML.HTMLAttributes<any>
        : __SvelteHTMLAttributesCompat<any>
    >;
  type __SvelteEventHandler<K extends string, E extends string, A = {}> =
    A extends { [key in `on:${E}`]?: infer H }
      ? H | undefined
      : A extends { [key in `on${E}`]?: infer H }
        ? H | undefined
        : __SvelteElementAttributes<K> extends { [key in `on:${E}`]?: infer H }
          ? H | undefined
          : __SvelteElementAttributes<K> extends { [key in `on${E}`]?: infer H }
            ? H | undefined
            : ((e: Event) => void) | null | undefined;

  type __SvelteActionReturnType = {
    update?: (parameter: any) => void;
    destroy?: () => void;
    $$_attributes?: Record<string, any>;
  } | void;
  declare function __svelte_ensure_action<T extends __SvelteActionReturnType>(
    actionCall: T
  ): T extends { $$_attributes?: any } ? T["$$_attributes"] : {};

  type __SvelteUnionToIntersection<U> =
    (U extends any ? (k: U) => void : never) extends (k: infer I) => void ? I : never;
  declare function __svelte_union<T extends any[]>(...args: T): __SvelteUnionToIntersection<T[number]>;

  declare function __svelte_create_element<K extends string, T>(
    tag: K | undefined | null,
    actionAttrs: T,
    attrs: __SvelteElementAttributes<K> & T
  ): void;

  declare const __svelte_any: any;

  declare function __svelte_catch_error<T>(value: T): unknown;
}
