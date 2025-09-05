import {
  ApplyRootStyleModifier,
  ApplyStyleModifier,
  ApplyFontStyleModifier,
  CSSProperties
} from './utils/GetDesignStyle'
import { AnyType } from './types'
import { getStyleValueByPattern, parseLinearGradient } from './utils/StyleMatching'

export interface DataType {
  text: string
}

@ObservedV2
export class Data implements DataType {
  @Trace text: string

  constructor(config: DataType) {
    this.text = config.text
  }
}

interface _Env {
  currentScenes: _EnvCurrentScenes
}

interface Env {
  currentScenes: EnvCurrentScenes
}

interface _EnvCurrentScenes {
  close: () => void
}

interface EnvCurrentScenes {
  close: () => void
}

interface Inputs {
  buttonText: (fn: (text: string) => void) => void
}

interface Outputs {
  onClick: (value: string) => void
}

@ComponentV2
export default struct MyBricksButton {
  @Param data: Data = new Data({
    text: '按钮'
  });
  @Param styles: Record<string, CSSProperties> = {}
  @Param inputs?: Inputs = undefined;
  @Param outputs?: Outputs = undefined;
  @Param uid?: string = undefined;
  @Param parentSlot?: AnyType = undefined;
  @Param _env?: _Env = undefined
  @Param env?: Env = undefined
  @Param modifier?: AttributeModifier<CommonAttribute> = undefined;

  aboutToAppear(): void {
    /** 注册「修改按钮文本」输入 */
    this.inputs?.buttonText((text) => {
      this.data.text = String(text);
    })
  }

  build() {
    Button({ type: ButtonType.Normal }) {
      Text(this.data.text)
        .halfLeading(true)
        .attributeModifier(
          /** 配置样式处理 */
          new ApplyFontStyleModifier(this.styles['.mybricks-button'])
            .fontSize(14)
            .fontColor('#ffffff')
        )
    }
    .onClick(() => {
      /** 调用「单击」输出 */
      this.outputs?.onClick(this.data.text)
    })
    .align(Alignment.Center)
    /** 配置样式处理 */
    .attributeModifier(new ApplyStyleModifier(this.styles['.mybricks-button']).borderRadius('50%')
      .backgroundColor('#fa6400'))
    /** 根节点样式处理「宽高」 */
    .attributeModifier(
      new ApplyRootStyleModifier(this.styles['root'])
    )
    /** 渐变色需要通过链式调用单独配置 */
    .linearGradient(parseLinearGradient(getStyleValueByPattern(this.styles,
      ['.mybricks-button'], 'backgroundImage')))
    /** 外部显示隐藏控制 */
    .attributeModifier(this.modifier)
  }
}
