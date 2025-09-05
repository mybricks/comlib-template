import {
  context,
  createData,
  createStyles,
  createModifier,
  CommonModifier,
  createInputsHandle,
  createEventsHandle,
  MyBricksComponentBuilderParams
} from '@mybricks/render-utils';

import { yourteam_harmony_button as BasicYourTeamHarmonyButton, yourteam_harmony_button_Data } from "./src/main/ets/Index";

@Builder
function YourTeamHarmonyButtonBuilder(params: MyBricksComponentBuilderParams) {
  BasicYourTeamHarmonyButton({
    uid: params.uid,
    data: createData(params, yourteam_harmony_button_Data),
    inputs: createInputsHandle(params),
    outputs: createEventsHandle(params),
    styles: createStyles(params),
    parentSlot: params.parentSlot,
    env: context.env,
    _env: context._env,
    modifier: createModifier(params, CommonModifier)
  })
}

@Builder
export function YourTeamHarmonyButton(params: MyBricksComponentBuilderParams) {
  if (params.parentSlot?.itemWrap) {
    params.parentSlot.itemWrap({
      id: params.uid,
      inputs: params.controller?._inputEvents
    }).wrap.builder(wrapBuilder(YourTeamHarmonyButtonBuilder), params, params.parentSlot.itemWrap({
      id: params.uid,
      inputs: params.controller?._inputEvents
    }).params)
  } else {
    YourTeamHarmonyButtonBuilder(params)
  }
}
