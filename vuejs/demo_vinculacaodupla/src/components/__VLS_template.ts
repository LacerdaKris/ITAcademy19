import {
  __VLS_publicComponent,
  __VLS_internalComponent,
  __VLS_componentsOption,
  __VLS_name,
  tratadorDoInput,
} from "./MaoDuplaV1.vue";

function __VLS_template() {
  let __VLS_ctx!: InstanceType<
    __VLS_PickNotAny<typeof __VLS_publicComponent, new () => {}>
  > &
    InstanceType<
      __VLS_PickNotAny<typeof __VLS_internalComponent, new () => {}>
    > & {};
  /* Components */
  let __VLS_otherComponents!: NonNullable<
    typeof __VLS_internalComponent extends { components: infer C } ? C : {}
  > &
    typeof __VLS_componentsOption;
  let __VLS_own!: __VLS_SelfComponent<
    typeof __VLS_name,
    typeof __VLS_internalComponent &
      typeof __VLS_publicComponent &
      (new () => { $slots: typeof __VLS_slots })
  >;
  let __VLS_localComponents!: typeof __VLS_otherComponents &
    Omit<typeof __VLS_own, keyof typeof __VLS_otherComponents>;
  let __VLS_components!: typeof __VLS_localComponents &
    __VLS_GlobalComponents &
    typeof __VLS_ctx;
  /* Style Scoped */
  type __VLS_StyleScopedClasses = {};
  let __VLS_styleScopedClasses!:
    | __VLS_StyleScopedClasses
    | keyof __VLS_StyleScopedClasses
    | (keyof __VLS_StyleScopedClasses)[];
  /* CSS variable injection */
  /* CSS variable injection end */
  let __VLS_resolvedLocalAndGlobalComponents!: {};
  (({}) as __VLS_IntrinsicElements).div;
  (({}) as __VLS_IntrinsicElements).div;
  (({}) as __VLS_IntrinsicElements).input;
  (({}) as __VLS_IntrinsicElements).span;
  (({}) as __VLS_IntrinsicElements).span;
  {
    const __VLS_0 = ({} as __VLS_IntrinsicElements)["div"];
    const __VLS_1 = __VLS_asFunctionalComponent(__VLS_0, {});
    (({}) as __VLS_IntrinsicElements).div;
    (({}) as __VLS_IntrinsicElements).div;
    const __VLS_2 = __VLS_1(
      { ...{ ...{} } },
      ...__VLS_functionalComponentArgsRest(__VLS_1)
    );
    const __VLS_3 = __VLS_pickFunctionalComponentCtx(__VLS_0, __VLS_2)!;
    {
      const __VLS_4 = ({} as __VLS_IntrinsicElements)["input"];
      const __VLS_5 = __VLS_asFunctionalComponent(__VLS_4, {});
      (({}) as __VLS_IntrinsicElements).input;
      const __VLS_6 = __VLS_5(
        {
          ...{
            ...{ onInput: {} as any },
            type: "text",
            placeholder: "Digite seu nome",
          },
        },
        ...__VLS_functionalComponentArgsRest(__VLS_5)
      );
      const __VLS_7 = __VLS_pickFunctionalComponentCtx(__VLS_4, __VLS_6)!;
      let __VLS_8 = {
        input: __VLS_pickEvent(
          __VLS_7.emit!,
          "input" as const,
          __VLS_componentProps(__VLS_5, __VLS_6).onInput
        ),
      };
      __VLS_8 = {
        input: __VLS_ctx.tratadorDoInput,
      };
    }
    {
      const __VLS_9 = ({} as __VLS_IntrinsicElements)["span"];
      const __VLS_10 = __VLS_asFunctionalComponent(__VLS_9, {});
      (({}) as __VLS_IntrinsicElements).span;
      (({}) as __VLS_IntrinsicElements).span;
      const __VLS_11 = __VLS_10(
        { ...{ ...{} } },
        ...__VLS_functionalComponentArgsRest(__VLS_10)
      );
      const __VLS_12 = __VLS_pickFunctionalComponentCtx(__VLS_9, __VLS_11)!;
    }
    __VLS_3.slots!.default;
  }
  if (
    typeof __VLS_styleScopedClasses === "object" &&
    !Array.isArray(__VLS_styleScopedClasses)
  ) {
  }
  var __VLS_slots!: {};
  // @ts-ignore
  [tratadorDoInput];
  return __VLS_slots;
}
