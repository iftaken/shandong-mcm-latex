% ============================================================
% 山东省大学生数学建模竞赛 LaTeX 文档类模板
% ============================================================
% 基于 CUMCMThesis 适配，支持 chapters/ 目录管理结构
% ============================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{main}[2026/03/26 v1.0 山东省大学生数学建模竞赛模板]

%% ------------------------------------------------------------
%% 选项处理
%% ------------------------------------------------------------
\newif\if@mcm@bwprint\@mcm@bwprintfalse
\newif\if@mcm@preface\@mcm@prefacetrue

\DeclareOption{colorprint}{\@mcm@bwprintfalse}
\DeclareOption{bwprint}{\@mcm@bwprinttrue}
\DeclareOption{withoutpreface}{\@mcm@prefacefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{colorprint}
\ProcessOptions\relax

%% ------------------------------------------------------------
%% 加载基础文档类
%% ------------------------------------------------------------
\LoadClass[a4paper,12pt]{article}

%% ------------------------------------------------------------
%% 基础宏包
%% ------------------------------------------------------------
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{main}{必须使用 xelatex 编译}{}
\fi

% 中文支持
\RequirePackage{ctex}
\RequirePackage{xeCJK}

% 页面布局
\RequirePackage{geometry}
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}

% 数学宏包
\RequirePackage{amsmath,amsfonts,amssymb,bm}

% 图表
\RequirePackage{graphicx,float}
\RequirePackage{array,longtable,booktabs,tabularx,multirow,bigstrut,bigdelim}

% 颜色
\RequirePackage{xcolor}

% 代码环境
\RequirePackage{listings}

% 链接
\RequirePackage{url}

% 子图与标题
\RequirePackage{subcaption}
\RequirePackage[titles]{tocloft}
\renewcommand{\cftsecdotsep}{4.5}
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftsecfont}{\bfseries\zihao{-4}\heiti}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}

% 首行缩进
\RequirePackage{indentfirst}

% 图表标题
\RequirePackage{caption}

% 列表
\RequirePackage{enumitem}

% 下划线
\RequirePackage{ulem}

% 计算
\RequirePackage{calc}

% 行距设置
\RequirePackage{setspace}

% 附录
\RequirePackage[titletoc,title]{appendix}

% 工具
\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
    \phantomsection
    \addcontentsline{toc}{section}{\refname}
    }

% 超链接（必须最后加载）
\RequirePackage{hyperref}
\RequirePackage{cleveref}

%% ------------------------------------------------------------
%% 超链接设置
%% ------------------------------------------------------------
\hypersetup{%
    pdfstartview=FitH,
    CJKbookmarks=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    colorlinks,
    pdfborder=001,
    allcolors=black,
    breaklinks=true
}

%% ------------------------------------------------------------
%% 字体设置
%% ------------------------------------------------------------
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setCJKfamilyfont{kai}[AutoFakeBold,Path=./font/]{simkai.ttf}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold,Path=./font/]{simsun.ttc}
\newcommand*{\song}{\CJKfamily{song}}

%% ------------------------------------------------------------
%% 行距设置
%% ------------------------------------------------------------
\renewcommand*{\baselinestretch}{1.38}

%% ------------------------------------------------------------
%% 修改 tabular 环境行距
%% ------------------------------------------------------------
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
    {\bgroup%
    \renewcommand{\arraystretch}{1.38}%
    \mcm@oldtabular}%
    {\mcm@endoldtabular\egroup}

%% ------------------------------------------------------------
%% 代码样式设置
%% ------------------------------------------------------------
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}

%% ------------------------------------------------------------
%% tcode环境（用于展示LaTeX代码）
%% ------------------------------------------------------------
\lstnewenvironment{tcode}
  {
    \lstset{basicstyle = \small\ttfamily,
        language=TeX,
        tabsize = 4,
        frame = single,
        escapechar = `,
        breaklines = true,
        breakatwhitespace = true,
        frameround = tttt,
    }
  }
  {}

%% ------------------------------------------------------------
%% 数学定理环境
%% ------------------------------------------------------------
\newtheorem{definition}{定义}
\newtheorem{theorem}{定理}
\newtheorem{lemma}{引理}
\newtheorem{corollary}{推论}
\newtheorem{assumption}{假设}
\newtheorem{conjecture}{猜想}
\newtheorem{axiom}{公理}
\newtheorem{principle}{定律}
\newtheorem{problem}{问题}
\newtheorem{example}{例}
\newtheorem{proof}{证明}
\newtheorem{solution}{解}

%% ------------------------------------------------------------
%% cleveref格式设置
%% ------------------------------------------------------------
\crefformat{figure}{#2图~#1#3}
\crefrangeformat{figure}{图~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{equation}{#2~(#1#3)}
\crefrangeformat{equation}{~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{equation}{~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

%% ------------------------------------------------------------
%% 浮动体设置
%% ------------------------------------------------------------
\renewcommand*{\textfraction}{0.05}
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
\renewcommand*{\floatpagefraction}{0.85}

\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
\graphicspath{{figture/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}

\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
    format=hang,
    labelsep=quad,
    font={song,minusfour,bf},
    position=bottom
}
\captionsetup[table]{%
    format=hang,
    labelsep=quad,
    font={song,minusfour,bf},
    position=top
}

%% ------------------------------------------------------------
%% 列表设置
%% ------------------------------------------------------------
\setlist{%
    topsep=0.3em,
    partopsep=0pt,
    itemsep=0ex plus 0.1ex,
    parsep=0pt,
    leftmargin=1.5em,
    rightmargin=0em,
    labelsep=0.5em,
    labelwidth=2em
}

%% ------------------------------------------------------------
%% 段落设置
%% ------------------------------------------------------------
\setlength\parindent{2em}
\renewcommand\normalsize{%
    \@setfontsize\normalsize{12.05}{14.45}%
    \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}

%% ------------------------------------------------------------
%% 章节标题格式（CUMCM 样式）
%% ------------------------------------------------------------
\setcounter{secnumdepth}{3}
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}

\renewcommand\section{\@startsection{section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\centering\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
    {3.25ex \@plus1ex \@minus.2ex}%
    {-1em}%
    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
     {3.25ex \@plus1ex \@minus .2ex}%
     {-1em}%
     {\normalfont\normalsize\bfseries}}

%% ------------------------------------------------------------
%% 中文标题名称
%% ------------------------------------------------------------
\renewcommand\contentsname{目录}
\renewcommand\listfigurename{插图清单}
\renewcommand\listtablename{附表清单}
\renewcommand\refname{参考文献}
\renewcommand\indexname{索引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\renewcommand\abstractname{摘要}

%% ------------------------------------------------------------
%% 摘要和关键词
%% ------------------------------------------------------------
\newcommand\mcm@tokens@keywords{}

\renewenvironment{abstract}{%
    \phantomsection
    \addcontentsline{toc}{section}{\abstractname}%
    \if@twocolumn
        \section*{\abstractname}%
    \else
        \begin{center}%
        {\zihao{4}\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
    \fi}
    {\if@twocolumn\else\endquotation\newpage\null\fi}

\renewenvironment{quotation}
    {\list{}{\listparindent 2em%
        \itemindent \listparindent
        \rightmargin\z@
        \leftmargin\z@
        \parsep \z@ \@plus\p@}%
    \item\relax}
    {\endlist}

\newcommand\keywords[1]{%
    \renewcommand{\mcm@tokens@keywords}{#1}
    \par
    \vskip1ex
    {\noindent\zihao{-4}\heiti 关键字：}~{\mcm@tokens@keywords}
}

%% ------------------------------------------------------------
%% 团队信息命令
%% ------------------------------------------------------------
\newcommand*\mcm@tokens@tihao{}
\newcommand*\mcm@tokens@baominghao{}
\newcommand*\mcm@tokens@schoolname{}
\newcommand*\mcm@tokens@membera{}
\newcommand*\mcm@tokens@memberb{}
\newcommand*\mcm@tokens@memberc{}
\newcommand*\mcm@tokens@supervisor{}
\newcommand*\mcm@tokens@yearinput{}
\newcommand*\mcm@tokens@monthinput{}
\newcommand*\mcm@tokens@dayinput{}

\newcommand*\tihao[1]{\renewcommand{\mcm@tokens@tihao}{#1}}
\newcommand*\baominghao[1]{\renewcommand{\mcm@tokens@baominghao}{#1}}
\newcommand*\schoolname[1]{\renewcommand{\mcm@tokens@schoolname}{#1}}
\newcommand*\membera[1]{\renewcommand{\mcm@tokens@membera}{#1}}
\newcommand*\memberb[1]{\renewcommand{\mcm@tokens@memberb}{#1}}
\newcommand*\memberc[1]{\renewcommand{\mcm@tokens@memberc}{#1}}
\newcommand*\supervisor[1]{\renewcommand{\mcm@tokens@supervisor}{#1}}
\newcommand*\yearinput[1]{\renewcommand{\mcm@tokens@yearinput}{#1}}
\newcommand*\monthinput[1]{\renewcommand{\mcm@tokens@monthinput}{#1}}
\newcommand*\dayinput[1]{\renewcommand{\mcm@tokens@dayinput}{#1}}

%% ------------------------------------------------------------
%% 承诺书常量
%% ------------------------------------------------------------
\newcommand*\mcm@commit@string@headname{赛区评阅编号（由赛区组委会填写）：}
\newcommand*\mcm@commit@string@titlea{\the\year 山东省大学生数学建模竞赛}
\newcommand*\mcm@commit@string@titleb{承\hspace{1em}诺\hspace{1em}书}
\newcommand\mcm@commit@string@contents{\quotation
我们仔细阅读了《山东省大学生数学建模竞赛章程》和《山东省大学生数学建模竞赛参赛规则》（以下简称"竞赛章程和参赛规则"）。

我们完全清楚，在竞赛开始后参赛队员不能以任何方式，包括电话、电子邮件、"贴吧"、QQ群、微信群等，与队外的任何人（包括指导教师）交流、讨论与赛题有关的问题；无论主动参与讨论还是被动接收讨论信息都是严重违反竞赛纪律的行为。

{\bfseries\song 我们以中国大学生名誉和诚信郑重承诺，严格遵守竞赛章程和参赛规则，以保证竞赛的公正、公平性。如有违反竞赛章程和参赛规则的行为，我们将受到严肃处理。}

我们授权山东省大学生数学建模竞赛组委会，可将我们的论文以任何形式进行公开展示（包括进行网上公示，在书籍、期刊和其他媒体进行正式或非正式发表等）。
\endquotation
}
\newcommand*\mcm@commit@string@problemnum{我们参赛选择的题号（从A/B/C/D/E中选择一项填写）：}
\newcommand*\mcm@commit@string@signupnum{我们的报名参赛队号（12位数字全国统一编号）：}
\newcommand*\mcm@commit@string@schoolname{参赛学校（完整的学校全称，不含院系名）：}
\newcommand*\mcm@commit@string@membername{参赛队员 (打印并签名) ：}
\newcommand*\mcm@commit@string@supervisorname{指导教师或指导教师组负责人  (打印并签名)：}
\newcommand\mcm@commit@string@inform{\quotation
\noindent{（\bfseries\kai 请勿改动此页内容和格式。此承诺书打印签名后作为纸质论文的封面，注意电子版论文中不得出现此页。%
以上内容请仔细核对，如填写错误，论文可能被取消评奖资格。）}
\endquotation
}
\newcommand*\mcm@commit@string@date{日期:}
\newcommand*\mcm@commit@string@year{年}
\newcommand*\mcm@commit@string@month{月}
\newcommand*\mcm@commit@string@day{日}
\newcommand*\mcm@commit@string@appraisenum{赛区评阅编号（由赛区组委会评阅前进行编号）：}

%% ------------------------------------------------------------
%% 编号专用页常量
%% ------------------------------------------------------------
\newcommand*\mcm@numberpage@string@headname{赛区评阅编号：}
\newcommand*\mcm@numberpage@string@headnameb{（由赛区填写）}
\newcommand*\mcm@numberpage@string@allcountrynum{省评阅编号：}
\newcommand*\mcm@numberpage@string@allcountrynumb{（省组委会填写）}
\newcommand*\mcm@numberpage@string@titlea{\the\year 山东省大学生数学建模竞赛}
\newcommand*\mcm@numberpage@string@titleb{编\hspace{.5em}号\hspace{.5em}专\hspace{.5em}用\hspace{.5em}页}
\newcommand*\mcm@numberpage@string@appraiselog{赛区评阅记录（可供赛区评阅时使用）：}
\newcommand\mcm@numberpage@string@reviewer{\shortstack{评\\ 阅\\ 人}}
\newcommand\mcm@numberpage@string@remarks{\shortstack{备\\ 注}}
\newcommand*\mcm@numberpage@string@countrynum{送省评阅统一编号:\\ \hspace*{2em}（赛区组委会填写）}
\newcommand\mcm@numberpage@string@inform{\quotation
\noindent（{\bfseries\kai 请勿改动此页内容和格式。此编号专用页仅供赛区评阅使用，参赛队打印后装订到纸质论文的第二页上。
注意电子版论文中不得出现此页。}）
\endquotation
}

%% ------------------------------------------------------------
%% 封面生成
%% ------------------------------------------------------------
\renewcommand{\maketitle}{\par
    \begingroup
        \newpage
        \global\@topnum\z@
        \@maketitle
    \endgroup
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}

\def\@maketitle{%
    \newpage
    \if@mcm@preface
    \null
    \vskip2ex
    \thispagestyle{empty}
    {\zihao{4}\noindent\mcm@commit@string@headname\\[-8pt]
    \noindent\rule[5pt]{\textwidth-1.34em}{.5pt}\par}
    \begin{center}%
        {\zihao{-3}\bfseries\heiti \mcm@commit@string@titlea \par}%
        {\vskip1ex\zihao{3}\bfseries\songti \mcm@commit@string@titleb \par}
    \end{center}
    {\zihao{-4} \mcm@commit@string@contents \par}
    {\vskip1ex\zihao{-4}
    \renewcommand{\ULthickness}{0.4pt}\setlength{\ULdepth}{2pt}
    \begin{spacing}{1.6}
    \mcm@commit@string@problemnum\uline{\mbox{\kern1em}\mcm@tokens@tihao\hfill}\makebox[0.66em]{}\par
    \mcm@commit@string@signupnum\uline{\mbox{\kern1em}\mcm@tokens@baominghao\hfill}\makebox[0.66em]{}\par
    \mcm@commit@string@schoolname\uline{\hfill\mcm@tokens@schoolname\hfill}\makebox[0.66em]{}\par
    \end{spacing}
    \newlength{\mcm@lenB}
    \settowidth{\mcm@lenB}{\mcm@commit@string@membername\mbox{\hspace{1em}}1.}
    \setlength{\mcm@lenB}{\textwidth-\mcm@lenB}
    \vskip2em%
    \hspace*{2em}\mcm@commit@string@membername
    \begin{minipage}[t]{\mcm@lenB}
        1.\uline{\mbox{\kern1em}\mcm@tokens@membera\hfill} \makebox[0.46em]{}\par\vspace*{.37cm}
        2.\uline{\mbox{\kern1em}\mcm@tokens@memberb\hfill} \makebox[0.46em]{}\par\vspace*{.37cm}
        3.\uline{\mbox{\kern1em}\mcm@tokens@memberc\hfill} \makebox[0.46em]{}\par
    \end{minipage}\par\vskip2em
    \mcm@commit@string@supervisorname\uline{\mbox{\hspace{1em}}\mcm@tokens@supervisor\hfill}\makebox[0.66em]{}\par
    \hspace{0.1cm} （{\kaishu 指导教师签名意味着对参赛队的行为和论文的真实性负责}）
    \vskip2ex
    \newlength{\mcm@lenA}
    \settowidth{\mcm@lenA}{请仔细核对，提交后将不再允许做任何修改。如}
    \hspace*{\mcm@lenA}\mcm@commit@string@date\hspace{0.5em}\uline{\hfill\mbox{\kern1em}\mcm@tokens@yearinput\mbox{\kern1em}\hfill}%
    \mcm@commit@string@year\uline{\hfill\mcm@tokens@monthinput\hfill}\mcm@commit@string@month%
    \uline{\hfill\mcm@tokens@dayinput\hfill}\mcm@commit@string@day\makebox[1em]{}\par}
    \vskip1ex
    {\kaishu\bfseries\mcm@commit@string@inform\par}
    \vfill
    \null
    \else
    \fi
    \makeothertitle
}

%% ------------------------------------------------------------
%% 编号专用页
%% ------------------------------------------------------------
\def\makeothertitle{%
    \if@mcm@preface
    \par
    \newpage
    \null
    \thispagestyle{empty}
    {\zihao{4}\noindent\begin{tabularx}{\textwidth}{cXcX@{}}
    \mcm@numberpage@string@headname & & \mcm@numberpage@string@allcountrynum&\\[-5pt]
    \mcm@numberpage@string@headnameb & &\mcm@numberpage@string@allcountrynumb&\\
    \cline{2-2}\cline{4-4}
    \end{tabularx}

    \vspace*{1.2em}

    \noindent\rule{\textwidth}{1pt}\par}
    \begin{center}
    {\zihao{4}\bfseries\heiti \mcm@numberpage@string@titlea\par}
    {\vskip1ex\zihao{3}\songti \bfseries\mcm@numberpage@string@titleb\par}
    \end{center}\par
    {%
    \zihao{4}
    \vskip3em
    \hspace*{2em}\mcm@numberpage@string@appraiselog
    \par
    \newlength{\mcm@lenC}
    \setlength{\mcm@lenC}{\textwidth-8.72em}
    \setlength{\mcm@lenC}{\mcm@lenC/6}
    \newlength{\mcm@lenD}
    \settoheight{\mcm@lenD}{\mcm@numberpage@string@reviewer}
    \setlength{\mcm@lenD}{\mcm@lenD+2em}
    \newlength{\mcm@lenF}
    \settoheight{\mcm@lenF}{\mcm@numberpage@string@remarks}
    \setlength{\mcm@lenF}{\mcm@lenF+2em}
    \newcolumntype{P}{@{}p{\mcm@lenC}@{}}
    \hspace*{1.5em}\begin{tabular}{|!{\hspace{4pt}}c!{\hspace{4pt}}|*{6}{P|}}
        \hline
        \rule{0pt}{\mcm@lenD}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@reviewer} & & & & & &  \\cline{1-7}
        \rule{0pt}{\mcm@lenF}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@remarks} & & & & & &  \\
        \hline
    \end{tabular}\par
    \vskip5em
    \hspace*{2em}\mcm@numberpage@string@countrynum}

    \vfill
    {\zihao{-4}\kaishu\bfseries\mcm@numberpage@string@inform\par}

    \null
    \newpage
    \null
    \setcounter{page}{1}
    {\centering \zihao{3}\bfseries \@title\par}
    \vskip1ex
    \else
    \setcounter{page}{1}
    {\centering \zihao{3}\bfseries \@title\par}
    \vskip1ex
    \fi
}

%% ------------------------------------------------------------
%% 参考文献环境重定义
%% ------------------------------------------------------------
\renewenvironment{thebibliography}[1]
    {\section{\refname}%
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
        \list{\@biblabel{\@arabic\c@enumiv}}%
            {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000%
        \sfcode`\.\@m}
    {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
        \endlist}

%% ------------------------------------------------------------
%% 上标引用
%% ------------------------------------------------------------
\newcommand{\upcite}[1]{$^{\mbox{\scriptsize \cite{#1}}}$}
\newcommand{\supercite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}

%% ------------------------------------------------------------
%% 文档类结束
%% ------------------------------------------------------------
\endinput
