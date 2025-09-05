import { YourTeamHarmonyButton } from "comlib"
import { Controller } from "@mybricks/render-utils"

@Entry
@ComponentV2
struct Index {
  yourTeamHarmonyButtonController = Controller();

  build() {
    RelativeContainer() {
      YourTeamHarmonyButton({
        uid: "uid",
        data: {
          text: "HELLO"
        },
        controller: this.yourTeamHarmonyButtonController,
        styles: {
          root: {
            width: 120,
            height: 42
          }
        },
        events: {
          /** 输出测试 */
          onClick: () => {
            /** 输入测试 */
            this.yourTeamHarmonyButtonController.buttonText(String(Math.random()))
          }
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}