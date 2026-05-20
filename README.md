# 全国大学生数学建模竞赛（CUMCM）LaTeX 模板

> 🎯 **官方推荐模板 · 专注于论文内容，而非格式调整**

[![License](https://img.shields.io/badge/license-LaTeX%20Project%20Public%20License-blue.svg)](https://www.latex-project.org/lppl/)

这是专为**全国大学生数学建模竞赛（CUMCM）**设计的 LaTeX 论文模板，符合竞赛官方论文格式规范。使用本模板，您可以将精力集中在模型构建与论文写作上，无需担心格式问题。

---

## 📋 模板特点

- ✅ **符合规范**：严格按照全国大学生数学建模竞赛（CUMCM）论文格式要求设计
- ✅ **开箱即用**：提供完整的文档类文件和示例结构
- ✅ **中文优化**：完美支持中文排版，内置宋体、楷体等中文字体
- ✅ **丰富的数学环境**：定理、引理、证明、假设等环境一应俱全
- ✅ **自动编号**：公式、图表、定理等自动编号，支持交叉引用
- ✅ **电子版/打印版**：支持一键切换电子版（无封面）和打印版

---

## 📁 文件结构

```
cumcm-latex-template/
├── main.cls              # 文档类文件（模板核心，必需）
├── main.tex              # 主文件（填写团队信息，必需）
├── example.tex           # 完整示例文件（参考用）
├── references.bib        # 参考文献数据库
├── main.pdf              # 编译后的PDF（模板效果预览）
├── example.pdf           # 示例PDF
├── README.md             # 本文件
├── .latexmkrc            # latexmk 编译配置
├── init.sh               # 字体初始化脚本
├── simsun.ttc            # 宋体字体文件
├── simkai.ttf            # 楷体字体文件
├── chapters/             # 论文章节文件夹
│   ├── abstract.tex      # 摘要
│   ├── chapter1.tex      # 问题重述与假设
│   ├── chapter2.tex      # 符号说明与模型建立
│   ├── solution.tex      # 模型求解
│   ├── conclusion.tex    # 结论
│   ├── references.tex    # 参考文献
│   └── appendix.tex      # 附录
└── figture/              # 图片文件夹
    ├── f1.png
    └── gongzhonghao2.jpg
```

### 必需文件

| 文件 | 说明 |
|------|------|
| `main.cls` | 模板核心文件，**必须保留**，定义了论文所有格式 |
| `main.tex` | 论文主文件，**必须保留**，填写团队信息 |
| `simsun.ttc` / `simkai.ttf` | 中文字体文件 |

---

## 🚀 快速开始

### 1. 安装 Tectonic 编译器

本项目推荐使用 [Tectonic](https://tectonic-typesetting.github.io/) 进行编译（基于 XeLaTeX，完美支持中文）。

```bash
# macOS
brew install tectonic

# Windows (Scoop)
scoop install tectonic

# Linux / 使用 cargo
cargo install tectonic
```

### 2. 准备字体

模板需要以下中文字体：
- **SimSun (宋体)** - 正文
- **SimKai (楷体)** - 强调文字

字体文件已包含在项目根目录中（`simsun.ttc` 和 `simkai.ttf`），无需额外配置。

### 3. 编译文档

```bash
# 编译主文件
tectonic -X compile main.tex

# 或编译示例文件
tectonic -X compile example.tex
```

编译成功后，将生成 `main.pdf`。

---

## ✏️ 使用方法

### 1. 填写团队信息

在 `main.tex` 中填写参赛信息：

```latex
\title{你的论文题目}

% 团队信息（取消注释并填写）
\tihao{A}                      % 题号（A/B/C/D/E）
\baominghao{xxxxxxxxxxxx}      % 报名号（12位数字）
\schoolname{XX大学}            % 学校全称
\membera{成员A}                % 队员1
\memberb{成员B}                % 队员2
\memberc{成员C}                % 队员3
\supervisor{指导教师}          % 指导教师
\yearinput{2026}               % 年
\monthinput{04}                % 月
\dayinput{26}                  % 日
```

### 2. 编写各章节

在 `chapters/` 目录下编辑对应文件：

| 文件 | 内容 |
|------|------|
| `abstract.tex` | 摘要（中英文） |
| `chapter1.tex` | 问题重述与问题分析 |
| `chapter2.tex` | 模型假设与符号说明 |
| `solution.tex` | 模型建立与求解 |
| `conclusion.tex` | 模型评价与改进 |
| `references.tex` | 参考文献 |
| `appendix.tex` | 附录（代码、数据等） |

### 3. 文档类选项

```latex
% 默认模式（带封面，彩色链接）
\documentclass{main}

% 电子版提交模式（去掉封面与编号页）
\documentclass[withoutpreface]{main}

% 黑白打印模式
\documentclass[bwprint]{main}

% 电子版 + 黑白打印（推荐用于最终提交）
\documentclass[withoutpreface,bwprint]{main}
```

### 4. 插入图片

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figture/example}
    \caption{图片标题}
    \label{fig:example}
\end{figure}
```

**图片并排示例：**

```latex
\begin{figure}[htbp]
    \centering
    \begin{minipage}[c]{0.48\textwidth}
        \centering
        \includegraphics[width=0.95\textwidth]{figture/fig1}
        \subcaption{子图标题1}
        \label{fig:sub1}
    \end{minipage}
    \begin{minipage}[c]{0.48\textwidth}
        \centering
        \includegraphics[width=0.95\textwidth]{figture/fig2}
        \subcaption{子图标题2}
        \label{fig:sub2}
    \end{minipage}
    \caption{总标题}
    \label{fig:total}
\end{figure}
```

### 5. 插入表格

推荐使用三线表格式：

```latex
\begin{table}[htbp]
    \caption{表格标题}\label{tab:example}
    \centering
    \begin{tabular}{ccccc}
        \toprule[1.5pt]
        符号 & 含义 & 单位 & 取值范围 \\
        \midrule[1pt]
        $x$ & 变量 & m & $[0, 100]$ \\
        $y$ & 变量 & kg & $[0, 50]$ \\
        \bottomrule[1.5pt]
    \end{tabular}
\end{table}
```

### 6. 数学公式

**行内公式：** `$E=mc^2$`

**行间公式（无编号）：**
```latex
\[
E = mc^2
\]
```

**行间公式（带编号）：**
```latex
\begin{equation}
E = mc^2
\label{eq:energy}
\end{equation}
```

**多行对齐公式：**
```latex
\begin{align}
P &= UI \\
  &= I^2R
\end{align}
```

### 7. 定理类环境

模板预定义了以下定理环境：

```latex
\begin{definition}   % 定义
\begin{theorem}      % 定理
\begin{lemma}        % 引理
\begin{corollary}    % 推论
\begin{assumption}   % 假设
\begin{conjecture}   % 猜想
\begin{axiom}        % 公理
\begin{principle}    % 定律
\begin{problem}      % 问题
\begin{example}      % 例子
\begin{proof}        % 证明
\begin{solution}     % 解答
```

### 8. 参考文献

在 `references.bib` 中添加文献条目：

```bibtex
@book{liuhaiyang2013latex,
    author    = {刘海洋},
    title     = {\LaTeX {}入门},
    publisher = {电子工业出版社},
    year      = {2013},
    address   = {北京}
}
```

在正文中引用：
```latex
\cite{liuhaiyang2013latex}
```

---

## 📐 格式规范

| 项目 | 设置 |
|------|------|
| 纸张 | A4 (210mm × 297mm) |
| 页边距 | 上下 2.5cm，左右 3cm |
| 正文字体 | 宋体 小四 (12pt) |
| 行距 | 1.5倍 |
| 论文标题 | 黑体 三号 (16pt)，居中 |
| 章标题 | 黑体 四号 (14pt) |
| 节标题 | 黑体 小四 (12pt) |

---

## 🛠️ 常用命令

```bash
# 编译主文件
tectonic -X compile main.tex

# 编译示例文件
tectonic -X compile example.tex

# 使用 latexmk 自动编译
latexmk -xelatex main.tex

# 清理辅助文件
rm -f *.aux *.log *.out *.toc *.bbl *.blg *.synctex.gz
```

---

## ⚠️ 注意事项

1. **必须使用 XeLaTeX 编译**：本模板基于 `ctex` 宏包，需要使用 XeLaTeX 引擎才能正确支持中文。

2. **电子版提交**：提交电子版论文时，请使用 `withoutpreface` 选项去掉封面和编号页。

3. **图片格式**：推荐使用 `png`、`jpg` 或 `pdf` 格式，避免使用 `bmp` 或 `eps`。

4. **图片命名**：使用英文命名图片，避免中文和空格，例如 `fig1.png` 而不是 `图1.png`。

5. **交叉引用**：使用 `\label{}` 和 `\cref{}` 进行图表和公式的交叉引用。

6. **参考文献**：添加新文献后，可能需要多次编译才能正确显示引用。

7. **团队信息**：务必确保填写的团队信息准确无误，特别是报名号。

---

## 📚 依赖宏包

模板已自动加载以下常用宏包：

- `ctex` - 中文支持
- `geometry` - 页面设置
- `graphicx` - 图片插入
- `amsmath`, `amssymb` - 数学公式
- `booktabs` - 专业表格
- `hyperref` - 超链接
- `cleveref` - 智能引用
- `listings` - 代码 listings
- `caption`, `subcaption` - 图表标题
- `tikz` - 绘图
- `mdframed` - 边框环境

---

## 📖 参考资料

- 《LaTeX入门》刘海洋
- [CTeX 论坛](https://ctex.org)
- [LaTeX Project](https://www.latex-project.org)
- [全国大学生数学建模竞赛（CUMCM）官网](http://www.mcm.edu.cn/)

---

## 📄 许可证

本模板仅供学术交流使用，请根据全国大学生数学建模竞赛（CUMCM）的具体要求进行调整。

---

## 🙏 致谢

本模板参考了全国大学生数学建模竞赛（CUMCM）的 `cumcmthesis` 模板设计，感谢原作者的辛勤工作。

如有问题或建议，欢迎提交 Issue 或 Pull Request。
