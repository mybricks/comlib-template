import type { Data } from "./type";

export default {
  /** 初始化 */
  "@init"({ style }) {
    /** 设置初始宽高 */
    style.width = 120;
    style.height = 42;
  },
  /** 宽高编辑 */
  "@resize": {
    options: ["width", "height"],
  },
  ":root": {
    /** 双击编辑 */
    "@dblclick": {
      type: "text",
      value: {
        get({ data }: EditorParams<Data>) {
          return data.text;
        },
        set({ data }: EditorParams<Data>, val: string) {
          data.text = val;
        },
      },
    },
    /** 样式编辑 */
    style: [
      {
        items: [
          {
            title: "按钮",
            catelog: "默认",
            options: ["font", "border", "background"],
            target: ".mybricks-button",
            defaultOpen: true,
          },
        ],
      },
    ],
    items: [
      {
        title: "按钮文案",
        type: "text",
        value: {
          get({ data }: EditorParams<Data>) {
            return data.text;
          },
          set({ data }: EditorParams<Data>, value: string) {
            data.text = value;
          },
        },
      },
      {
        title: "事件",
        /** 创建单击事件 */
        items: [
          {
            title: "单击",
            type: "_event",
            options: {
              outputId: "onClick",
            },
          },
        ],
      },
    ],
  },
};
