import React, { useMemo } from "react";
import css from "./runtime.less";
import type { Data } from "./type";

export default function ({
  env,
  data,
  inputs,
  outputs,
}: RuntimeProps<Data>) {
  useMemo(() => {
    /** 注册「修改按钮文本」输入 */
    inputs["buttonText"]((val: string) => {
      data.text = val;
    });
  }, []);

  return (
    <button
      className={`${css.button} mybricks-button`}
      onClick={() => {
        /** 调用「单击」输出 */
        if (env.runtime) {
          outputs["onClick"](data.text);
        }
      }}
    >
      <span className={css.text}>{data.text}</span>
    </button>
  );
}
