<div align="center">
    <a href="https://mybricks.world/">
      <img src="https://user-images.githubusercontent.com/77093461/192469708-107ed96d-66d0-4eb2-861a-f97ac384ee15.png" height="160" width="160"/>
    </a>
</div>

<h1>MyBricks-鸿蒙组件库</h1>

## 📁 项目结构
鸿蒙组件库的结构主要分为 *designer* 组件设计态代码 和 *rt-arkts* 组件鸿蒙运行时代码 两个目录
```
packages/
├── designer/    # 所有组件的鸿蒙设计态代码
└── rt-arkts/    # 基于ArkTs的完整鸿蒙项目
    ├── comlib/  # 所有组件的鸿蒙运行时代码
    └── entry/   # 鸿蒙项目的入口文件
```

## 🚀 组件开发
组件开发基于vscode插件
- 使用 vscode 打开「packages/designer」目录
- 执行 ```npm install``` 安装依赖
- 在 vscode 插件市场搜索并安装 [MyBricks](https://marketplace.visualstudio.com/items?itemName=Mybricks.Mybricks) 插件
- 参照插件说明，启动调试
