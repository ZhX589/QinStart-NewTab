# 轻启标签页 (QinStart-NewTab)

一个简洁优雅的 Firefox 新标签页插件，提供实时时钟、必应搜索框和"一言"语录，支持亮色/暗色模式与自定义背景图片。

## 功能

- ⏰ 实时数字时钟与日期显示
- 🔍 必应 (Bing) 搜索引擎快捷入口
- 📝 一言 (Hitokoto) 随机语录展示
- ☀️ / 🌙 亮色与暗色双主题模式
- 🖼️ 可为亮色和暗色主题分别设置自定义背景图片
- ⚙️ 设置自动保存至浏览器本地存储

## 安装 (开发模式)

1. 下载或克隆本仓库
2. 打开 Firefox，地址栏输入 `about:debugging`，回车
3. 点击左侧 **"此 Firefox"**
4. 点击 **"临时载入附加组件…"**
5. 选择本目录下的 `manifest.json` 文件
6. 完成！新标签页和主页将自动被替换

## 项目结构

\`\`\`
QinStart-NewTab/
├── manifest.json           # 插件配置
├── QinStartNewTaab.html    # 新标签页主页面
├── icons/
│   ├── icon-48.png
│   ├── icon-96.png
│   └── icon-svg.svg        # 图标源文件
└── README.md
\`\`\`

## 自定义图标

`icons/` 文件夹中必须包含 `icon-48.png` 和 `icon-96.png`。

你可以：
- 使用提供的 `icon-svg.svg` 导出 PNG
- 或使用任意 48×48 与 96×96 的 PNG 图片作为图标

## 技术说明

- 基于 Manifest V3 标准
- 使用 CSS 自定义属性实现主题切换
- 一言数据来自 [hitokoto.cn](https://v1.hitokoto.cn) 开放 API
- 图标字体来自 [Font Awesome 6.5.1](https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css)
- 搜索目标为 [必应 (Bing)](https://www.bing.com)

## 许可

MIT License
