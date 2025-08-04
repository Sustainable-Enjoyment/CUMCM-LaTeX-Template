\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{cumcmthesis}[2025/08/04 v4.0 Integrated Title Style Template for CUMCM]

%% 初始代码
\newif\if@mcm@bwprint\@mcm@bwprintfalse
\newif\if@mcm@preface\@mcm@prefacetrue
\newif\if@mcm@toc \@mcm@toctrue
\newcommand*\mcm@tokens@keywords{} \newcommand*\mcm@tokens@tihao{} \newcommand*\mcm@tokens@baominghao{} \newcommand*\mcm@tokens@schoolname{} \newcommand*\mcm@tokens@membera{} \newcommand*\mcm@tokens@memberb{} \newcommand*\mcm@tokens@memberc{} \newcommand*\mcm@tokens@supervisor{} \newcommand*\mcm@tokens@yearinput{\the\year} \newcommand*\mcm@tokens@monthinput{\the\month} \newcommand*\mcm@tokens@dayinput{\the\day}
%% 选项声明
\DeclareOption{colorprint}{\@mcm@bwprintfalse} \DeclareOption{bwprint}{\@mcm@bwprinttrue} \DeclareOption{withoutpreface}{\@mcm@prefacefalse}
\DeclareOption{notoc}{\@mcm@tocfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%% 执行选项
\ExecuteOptions{colorprint} \ProcessOptions\relax
%% 加载基础类
\LoadClass[a4paper,12pt]{article}
%% 必要的宏包加载
\RequirePackage{ifxetex} \RequireXeTeX \ifxetex\else \ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{Just choose `xelatex', no `pdflatex' or `latex' and so on.}\fi
\RequirePackage{ctex} \RequirePackage[top=25mm,bottom=25mm,left=25mm,right=25mm]{geometry} \RequirePackage{amsmath,amsfonts,amssymb,bm} \RequirePackage[dvipsnames]{xcolor} \RequirePackage{graphicx,float,subcaption} \RequirePackage{array,longtable,booktabs,tabularx,multirow,bigstrut,bigdelim} \RequirePackage{listings} \RequirePackage{url} \RequirePackage{hyperref} \RequirePackage{cleveref} \RequirePackage{etoolbox} \RequirePackage{indentfirst} \RequirePackage{caption} \RequirePackage{enumitem} \RequirePackage{ulem} \RequirePackage[titletoc,title]{appendix} \RequirePackage{cprotect} \RequirePackage{titlesec}
\if@mcm@toc \RequirePackage{titletoc}\fi

%% 字体设置
\RequirePackage{fontspec}
\setmainfont{Times New Roman} \setsansfont{Arial} \setmonofont{Courier New}
\setCJKmainfont[AutoFakeBold = {2.2}]{SimSun}
\setCJKsansfont[AutoFakeBold = {2.2}]{SimHei}
\setCJKfamilyfont{kai}{simkai.ttf}[AutoFakeBold = {2.0}]
\setCJKfamilyfont{yahei}{Microsoft YaHei}[AutoFakeBold = {2.0}]

%% 页面与排版布局
\renewcommand*{\baselinestretch}{1.38} \setlength\parindent{2em} \let\mcm@oldtabular\tabular \let\mcm@endoldtabular\endtabular \renewenvironment{tabular}{\bgroup\renewcommand{\arraystretch}{1.38}\mcm@oldtabular}{\mcm@endoldtabular\egroup} \renewcommand\normalsize{\@setfontsize\normalsize{12pt}{14.5pt} \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@ \abovedisplayshortskip \z@ \@plus3\p@ \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@ \let\@listi\@listI} \normalsize
%% 定理类环境定义
\newtheorem{definition}{定义} \newtheorem{theorem}{定理} \newtheorem{lemma}{引理} \newtheorem{corollary}{推论} \newtheorem{assumption}{假设} \newtheorem{conjecture}{猜想} \newtheorem{axiom}{公理} \newtheorem{principle}{定律} \newtheorem{problem}{问题} \newtheorem{example}{例} \newtheorem{proof}{证明} \newtheorem{solution}{解}
%% 浮动体参数设置
\renewcommand*{\textfraction}{0.05} \renewcommand*{\topfraction}{0.9} \renewcommand*{\bottomfraction}{0.8} \renewcommand*{\floatpagefraction}{0.85}
%% 图形设置
\graphicspath{{figures/},{figure/},{pictures/},{picture/},{pic/},{pics/},{image/},{images/}} \DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.jpeg}
%% 图表标题样式
\captionsetup[figure]{format=hang, labelsep=quad, font={small, bf}, position=bottom} \captionsetup[table]{format=hang, labelsep=quad, font={small, bf}, position=top}
%% 列表环境全局设置
\setlist{topsep=0.3em, partopsep=0pt, itemsep=0ex plus 0.1ex, parsep=0pt, leftmargin=2em, labelsep=0.5em}
%% 代码列表 (listings) 样式
\definecolor{codegreen}{rgb}{0,0.6,0} \definecolor{codegray}{rgb}{0.5,0.5,0.5} \definecolor{codepurple}{rgb}{0.58,0,0.82} \definecolor{backcolour}{rgb}{0.95,0.95,0.92} \lstdefinestyle{mystyle}{backgroundcolor=\color{backcolour}, commentstyle=\color{codegreen}, keywordstyle=\color{NavyBlue}, numberstyle=\tiny\color{codegray}, stringstyle=\color{codepurple}, basicstyle=\ttfamily\small, breakatwhitespace=false, breaklines=true, captionpos=b, keepspaces=true, numbers=left, numbersep=5pt, showspaces=false, showstringspaces=false, showtabs=false, tabsize=2, frame=single, rulesepcolor=\color{red!20!green!20!blue!20}} \lstset{style=mystyle}
%% 超链接与交叉引用设置
\hypersetup{pdfstartview=FitH, CJKbookmarks=true, bookmarksnumbered=true, bookmarksopen=true, colorlinks, allcolors=black, breaklinks=true} \if@mcm@bwprint\hypersetup{hidelinks}\fi \pdfstringdefDisableCommands{\def\cftdotfill{ }}
\crefname{figure}{图}{图} \crefname{table}{表}{表} \crefname{equation}{公式}{公式} \crefname{section}{第}{节} \crefname{subsection}{第}{节} \crefname{subsubsection}{第}{节} \crefname{appendix}{附录}{附录}
\crefformat{figure}{#2图~#1#3} \crefformat{table}{#2表~#1#3} \crefformat{equation}{#2公式~(#1)#3}

%% 目录样式
\if@mcm@toc
\contentsmargin{2.55em} \renewcommand{\contentsname}{目\hspace{2em}录}
\titlecontents{section}[1.5em]{\songti\zihao{-4}\bfseries}{\thecontentslabel\hspace{1em}}{}{\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[3.5em]{\songti\zihao{-4}}{\thecontentslabel\hspace{1em}}{}{\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsubsection}[5.5em]{\songti\zihao{-4}}{\thecontentslabel\hspace{1em}}{}{\titlerule*[4pt]{$\cdot$}\contentspage}
\AtBeginEnvironment{thebibliography}{\phantomsection\addcontentsline{toc}{section}{\refname}}
\let\oldappendix\appendix \renewcommand{\appendix}{\oldappendix\phantomsection\addcontentsline{toc}{section}{\appendixname}}
\fi

%% 标题与章节格式
\renewcommand\thesection{\chinese{section}、} \renewcommand\thesubsection{\arabic{section}.\arabic{subsection}} \renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\titleformat{\section}{\centering\Large\bfseries}{\thesection}{1em}{} \titleformat{\subsection}{\large\bfseries}{\thesubsection}{1em}{} \titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex} \titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex} \titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%% =================================================================
%%                        封面与承诺书 (v4.0 修正)
%% =================================================================
\renewcommand{\maketitle}{%
	\if@mcm@preface
	\begingroup
	\mcm@make@commitment
	\mcm@make@numberpage
	\endgroup
	\fi
	% 设置正文第一页的页码和样式
	\setcounter{page}{1}%
	\thispagestyle{empty}%
	% 在页面顶部输出居中的标题，然后留出一些空间，不分页
	\begin{center}
		{\zihao{3}\bfseries \@title\par}
		\vskip 1.5em
	\end{center}
	\global\let\maketitle\relax
}

% 承诺书和编号页的定义保持不变
\def\mcm@make@commitment{\thispagestyle{empty}\null\vskip2ex {\zihao{4}\noindent\mcm@commit@string@headname\\[-8pt] \noindent\rule[5pt]{\textwidth-1.34em}{.5pt}\par} \begin{center}{\zihao{-3}\bfseries\heiti \mcm@commit@string@titlea \par}{\vskip1ex\zihao{3}\bfseries\songti \mcm@commit@string@titleb \par} \end{center} {\zihao{-4} \mcm@commit@string@contents \par} \vskip1ex {\zihao{-4} \renewcommand{\ULthickness}{0.4pt}\setlength{\ULdepth}{2pt} \hspace*{2em}\mcm@commit@string@problemnum\uline{\hspace{1em}\mcm@tokens@tihao\hfill}\makebox[0.66em]{}\par \mcm@commit@string@signupnum\uline{\hspace{1em}\mcm@tokens@baominghao\hfill}\makebox[0.66em]{}\par \mcm@commit@string@schoolname\uline{\hfill\mcm@tokens@schoolname\hfill}\makebox[0.66em]{}\par \newlength{\mcm@lenB} \settowidth{\mcm@lenB}{\mcm@commit@string@membername\hspace{1em}1.} \setlength{\mcm@lenB}{\textwidth-\mcm@lenB} \mcm@commit@string@membername \begin{minipage}[t]{\mcm@lenB} 1.\uline{\hspace{1em}\mcm@tokens@membera\hfill} \makebox[0.46em]{}\par 2.\uline{\hspace{1em}\mcm@tokens@memberb\hfill} \makebox[0.46em]{}\par 3.\uline{\hspace{1em}\mcm@tokens@memberc\hfill} \makebox[0.46em]{}\par \end{minipage}\par\vskip1ex \mcm@commit@string@supervisorname\uline{\hspace{1em}\mcm@tokens@supervisor\hfill}\makebox[0.66em]{}\par \hspace*{1em}（{\kaishu 指导教师签名意味着对参赛队的行为和论文的真实性负责}）\par \vskip2ex \newlength{\mcm@lenA} \settowidth{\mcm@lenA}{请仔细核对，提交后将不再允许做任何修改。如} \hspace*{\mcm@lenA}\mcm@commit@string@date\hspace{0.5em}\uline{\hfill\hspace{1em}\mcm@tokens@yearinput\hspace{1em}\hfill}\mcm@commit@string@year\uline{\hfill\mcm@tokens@monthinput\hfill}\mcm@commit@string@month\uline{\hfill\mcm@tokens@dayinput\hfill}\mcm@commit@string@day\makebox[1em]{}\par} \vskip1ex {\kaishu\bfseries\mcm@commit@string@inform \par} \vfill \newpage}
\def\mcm@make@numberpage{\thispagestyle{empty} {\zihao{4}\noindent\begin{tabularx}{\textwidth}{cXcX@{}} \mcm@numberpage@string@headname & & \mcm@numberpage@string@allcountrynum&\\[-5pt] \mcm@numberpage@string@headnameb & &\mcm@numberpage@string@allcountrynumb&\\ \cline{2-2}\cline{4-4} \end{tabularx} \vspace*{1.2em} \noindent\rule{\textwidth}{1pt}\par} \begin{center} {\zihao{4}\bfseries\heiti \mcm@numberpage@string@titlea\par} {\vskip1ex\zihao{3}\songti \bfseries\mcm@numberpage@string@titleb\par} \end{center}\par {{\zihao{4} \vskip3em \hspace*{2em}\mcm@numberpage@string@appraiselog \par \newlength{\mcm@lenC} \setlength{\mcm@lenC}{\textwidth-8.72em} \setlength{\mcm@lenC}{\mcm@lenC/6} \newlength{\mcm@lenD} \settoheight{\mcm@lenD}{\mcm@numberpage@string@reviewer} \setlength{\mcm@lenD}{\mcm@lenD+2em} \newlength{\mcm@lenF} \settoheight{\mcm@lenF}{\mcm@numberpage@string@remarks} \setlength{\mcm@lenF}{\mcm@lenF+2em} \newcolumntype{P}{@{}p{\mcm@lenC}@{}} \hspace*{1.5em}\begin{tabular}{|!{\hspace{4pt}}c!{\hspace{4pt}}|*{6}{P|}} \hline \rule{0pt}{\mcm@lenD}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@reviewer} & & & & & & \\\cline{1-7} \rule{0pt}{\mcm@lenF}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@remarks} & & & & & & \\ \hline \end{tabular}\par \vskip5em \hspace*{2em}\mcm@numberpage@string@countrynum}} \vfill {\zihao{-4}\kaishu\bfseries\mcm@numberpage@string@inform\par} \newpage}

%% 其他定义保持不变
\renewenvironment{abstract}{\begin{center}{\zihao{3}\bfseries \abstractname}\end{center}\begin{quotation} \zihao{-4}\songti \setlength{\parindent}{2em}}{\end{quotation}}
\newcommand\keywords[1]{\renewcommand{\mcm@tokens@keywords}{#1} \par\vskip1ex {\noindent\zihao{-4}\bfseries\heiti\mcm@cap@keywordsname：}~{\zihao{-4}\mcm@tokens@keywords} \newpage}
\renewenvironment{thebibliography}[1]{\section*{\refname} \list{\@biblabel{\@arabic\c@enumiv}}{\settowidth\labelwidth{\@biblabel{#1}} \leftmargin\labelwidth \advance\leftmargin\labelsep \@openbib@code \usecounter{enumiv} \let\p@enumiv\@empty \renewcommand\theenumiv{\@arabic\c@enumiv}} \sloppy \clubpenalty4000 \@clubpenalty \clubpenalty \widowpenalty4000 \sfcode`\.\@m}{\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}\endlist}
\newcommand*\tihao[1]{\renewcommand{\mcm@tokens@tihao}{#1}} \newcommand*\baominghao[1]{\renewcommand{\mcm@tokens@baominghao}{#1}} \newcommand*\schoolname[1]{\renewcommand{\mcm@tokens@schoolname}{#1}} \newcommand*\membera[1]{\renewcommand{\mcm@tokens@membera}{#1}} \newcommand*\memberb[1]{\renewcommand{\mcm@tokens@memberb}{#1}} \newcommand*\memberc[1]{\renewcommand{\mcm@tokens@memberc}{#1}} \newcommand*\supervisor[1]{\renewcommand{\mcm@tokens@supervisor}{#1}} \newcommand*\yearinput[1]{\renewcommand{\mcm@tokens@yearinput}{#1}} \newcommand*\monthinput[1]{\renewcommand{\mcm@tokens@monthinput}{#1}} \newcommand*\dayinput[1]{\renewcommand{\mcm@tokens@dayinput}{#1}}
\renewcommand\abstractname{摘\hspace{2em}要} \renewcommand\refname{参考文献} \renewcommand\appendixname{附\hspace{2em}录} \newcommand*{\mcm@cap@keywordsname}{关\hspace{1em}键\hspace{1em}词} \renewcommand\figurename{图} \renewcommand\tablename{表}
\newcommand*\mcm@commit@string@headname{赛区评阅编号（由赛区组委会填写）：} \newcommand*\mcm@commit@string@titlea{2025高教社杯全国大学生数学建模竞赛} \newcommand*\mcm@commit@string@titleb{承\hspace{1em}诺\hspace{1em}书}

\long\def\mcm@commit@string@contents{\quotation 我们仔细阅读了《全国大学生数学建模竞赛章程》和《全国大学生数学建模竞赛参赛规则》（以下简称“竞赛章程和参赛规则”，可从 \url{http://www.mcm.edu.cn} 下载）。
	
	我们完全清楚，在竞赛开始后参赛队员不能以任何方式，包括电话、电子邮件、“贴吧”、QQ群、微信群等，与队外的任何人（包括指导教师）交流、讨论与赛题有关的问题；无论主动参与讨论还是被动接收讨论信息都是严重违反竞赛纪律的行为。
	
	我们完全清楚，在竞赛中必须合法合规地使用文献资料和软件工具，不能有任何侵犯知识产权的行为。否则我们将失去评奖资格，并可能受到严肃处理。
	
	{\bfseries\songti 我们以中国大学生名誉和诚信郑重承诺，严格遵守竞赛章程和参赛规则，以保证竞赛的公正、公平性。如有违反竞赛章程和参赛规则的行为，我们将受到严肃处理。}
	
	我们授权全国大学生数学建模竞赛组委会，可将我们的论文以任何形式进行公开展示（包括进行网上公示，在书籍、期刊和其他媒体进行正式或非正式发表等）。
	\endquotation}

\newcommand*\mcm@commit@string@problemnum{我们参赛选择的题号（从A/B/C/D/E/F中选择一项填写）：} \newcommand*\mcm@commit@string@signupnum{我们的报名参赛队号（12位数字全国统一编号）：} \newcommand*\mcm@commit@string@schoolname{参赛学校（完整的学校全称，不含院系名）：} \newcommand*\mcm@commit@string@membername{参赛队员 (打印并签名) ：} \newcommand*\mcm@commit@string@supervisorname{指导教师或指导教师组负责人 (打印并签名)：}

\long\def\mcm@commit@string@inform{\quotation \noindent{（\bfseries\kaishu 请勿改动此页内容和格式。此承诺书打印签名后作为纸质论文的封面，注意电子版论文中不得出现此页。%
		以上内容请仔细核对，如填写错误，论文可能被取消评奖资格。）} \endquotation}

\newcommand*\mcm@commit@string@date{日\hspace{1em}期:} \newcommand*\mcm@commit@string@year{年} \newcommand*\mcm@commit@string@month{月} \newcommand*\mcm@commit@string@day{日}
\newcommand*\mcm@numberpage@string@headname{赛区评阅编号：} \newcommand*\mcm@numberpage@string@headnameb{（由赛区填写）} \newcommand*\mcm@numberpage@string@allcountrynum{全国评阅编号：} \newcommand*\mcm@numberpage@string@allcountrynumb{（全国组委会填写）} \newcommand*\mcm@numberpage@string@titlea{2025高教社杯全国大学生数学建模竞赛} \newcommand*\mcm@numberpage@string@titleb{编\hspace{.5em}号\hspace{.5em}专\hspace{.5em}用\hspace{.5em}页} \newcommand*\mcm@numberpage@string@appraiselog{赛区评阅记录（可供赛区评阅时使用）：} \newcommand\mcm@numberpage@string@reviewer{\shortstack{评\\ 阅\\ 人}} \newcommand\mcm@numberpage@string@remarks{\shortstack{备\\ 注}} \newcommand*\mcm@numberpage@string@countrynum{送全国评阅统一编号:\par \hspace*{2em}（赛区组委会填写）}

\long\def\mcm@numberpage@string@inform{\quotation \noindent（{\bfseries\kaishu 请勿改动此页内容和格式。此编号专用页仅供赛区和全国评阅使用，参赛队打印后装订到纸质论文的第二页上。注意电子版论文中不得出现此页。}） \endquotation}

\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\newcommand{\supercite}[1]{\textsuperscript{\cite{#1}}}

\endinput
%%
%% End of file `cumcmthesis.cls'.