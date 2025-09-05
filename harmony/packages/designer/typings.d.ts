declare module "*.less" {
  const resource: { [key: string]: string };
  export = resource;
}

/** 环境注入 */
interface Env {
  runtime: boolean;
}

/** 组件的输入 */
type Outputs = Record<string, (value: any) => void>;

/** 组件的输出 */
type Inputs = Record<string, (value: any, outputs?: Outputs) => void>;

interface RuntimeProps<T> {
  env: Env;
  data: T;
  inputs: Inputs;
  outputs: Outputs;
}

interface EditorParams<T> {
  data: T;
}
