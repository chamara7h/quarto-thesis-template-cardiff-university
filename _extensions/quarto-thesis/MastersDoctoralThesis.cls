%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cardiff-adapted Masters/Doctoral Thesis
% Class File
%
% Final version with:
% - 1.5 line spacing
% - left-aligned body text
% - bold, left-aligned headings at all levels
% - centred page numbers
% - simplified front matter headings
% - abstract/front matter styled like chapters but unnumbered
% - no repeated title/author inside abstract
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
% CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{MastersDoctoralThesis}
\ProvidesClass{\classname}[2026/04/08 Cardiff-adapted thesis class]

\providecommand{\baseclass}{book}

\RequirePackage{etoolbox}
\RequirePackage{xparse}

% Boolean switches
\newbool{nolistspace}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}

% Class options
\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}

% Pass unknown options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax
\LoadClass{\baseclass}

%----------------------------------------------------------------------------------------
% OPTIONAL PARAGRAPH SPACING PACKAGE
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}}{}

%----------------------------------------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage{babel}         % Language support
\RequirePackage{scrbase}       % Language-dependent names
\RequirePackage{scrhack}       % Fixes for package interactions
\RequirePackage{setspace}      % Line spacing
\RequirePackage{longtable}     % Multi-page tables
\RequirePackage{graphicx}      % Graphics
\graphicspath{{Figures/}{./}}
\RequirePackage{booktabs}      % Better table rules
\RequirePackage{caption}       % Caption formatting
\RequirePackage{xcolor}        % Colours
\RequirePackage{titlesec}      % Heading formatting
\RequirePackage[markcase=used]{scrlayer-scrpage} % Headers/footers

% Caption style
\captionsetup{
  justification=raggedright,
  singlelinecheck=false,
  font={normalsize},
  labelfont=bf
}

%----------------------------------------------------------------------------------------
% TOC / LIST OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{listtoc}{%
  \patchcmd{\listoftables}{\@starttoc{lot}}{%
    \addchaptertocentry{\listtablename}\@starttoc{lot}%
  }{}{}%
  \patchcmd{\listoffigures}{\@starttoc{lof}}{%
    \addchaptertocentry{\listfigurename}\@starttoc{lof}%
  }{}{}%
}{}

\ifbool{toctoc}{%
  \patchcmd{\tableofcontents}{\@starttoc{toc}}{%
    \addchaptertocentry{\contentsname}\@starttoc{toc}%
  }{}{}%
}{}

% Prevent unwanted forced upper case in contents/lists
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% Optional single spacing inside TOC / LOF / LOT
\ifbool{nolistspace}{
  \patchcmd{\listoffigures}{\@starttoc{lof}}{%
    \begingroup\singlespacing\@starttoc{lof}\endgroup
  }{}{}%
  \patchcmd{\listoftables}{\@starttoc{lot}}{%
    \begingroup\singlespacing\@starttoc{lot}\endgroup
  }{}{}%
  \patchcmd{\tableofcontents}{\@starttoc{toc}}{%
    \begingroup\singlespacing\@starttoc{toc}\endgroup
  }{}{}%
}{}

%----------------------------------------------------------------------------------------
% CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

% Thesis title
\NewDocumentCommand{\thesistitle}{ o m }{%
  \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
  \def\@title{#2}%
  \def\ttitle{#2}%
}

% Author
\DeclareDocumentCommand{\author}{m}{%
  \newcommand{\authorname}{#1}%
  \renewcommand{\@author}{#1}%
}

% Other metadata
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\examiner}{m}{\newcommand{\examname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}
\NewDocumentCommand{\addresses}{m}{\newcommand{\addressname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\group}{m}{\newcommand{\groupname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}

%----------------------------------------------------------------------------------------
% HELPER COMMANDS
%----------------------------------------------------------------------------------------

% Move to next right-hand page in two-sided mode
\newcommand{\checktoopen}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \ifdef{\phantomsection}{\phantomsection}{}%
}

% Console helpers
\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

% Decorative rules
\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}}
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}}

% Add a chapter entry to TOC
\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
  \addcontentsline{toc}{chapter}{#1}%
}

\makeatletter
\let\l@part\l@chapter
\makeatother

%----------------------------------------------------------------------------------------
% FRONT-MATTER HEADING STYLE
%----------------------------------------------------------------------------------------

% Same visual style as chapter headings, but unnumbered
\newcommand{\frontmatterheading}[1]{%
  \checktoopen
  \thispagestyle{plain}
  {\raggedright\normalfont\Large\bfseries #1\par}
  \vspace{1.2em}
}

%----------------------------------------------------------------------------------------
% COLOURS
%----------------------------------------------------------------------------------------

\colorlet{mdtRed}{red!50!black}

%----------------------------------------------------------------------------------------
% PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000
\brokenpenalty=10000
\widowpenalty=9999
\clubpenalty=9999
\interfootnotelinepenalty=9999

%----------------------------------------------------------------------------------------
% HEADINGS
%----------------------------------------------------------------------------------------

\makeatletter

% Chapter headings:
% - Main matter:  Chapter 1. Title
% - Appendix:     Appendix A. Title
\titleformat{\chapter}[block]
  {\normalfont\Large\bfseries\raggedright}
  {\@chapapp\ \thechapter.}
  {0.75em}
  {}

\titlespacing*{\chapter}{0pt}{0pt}{1.2em}

% Section headings
\titleformat{\section}[block]
  {\normalfont\large\bfseries\raggedright}
  {\thesection}
  {0.75em}
  {}

\titlespacing*{\section}{0pt}{1.2em}{0.6em}

% Subsection headings
\titleformat{\subsection}[block]
  {\normalfont\normalsize\bfseries\raggedright}
  {\thesubsection}
  {0.75em}
  {}

\titlespacing*{\subsection}{0pt}{1em}{0.5em}

% Subsubsection headings
\titleformat{\subsubsection}[block]
  {\normalfont\normalsize\bfseries\raggedright}
  {\thesubsubsection}
  {0.75em}
  {}

\titlespacing*{\subsubsection}{0pt}{0.8em}{0.4em}

%----------------------------------------------------------------------------------------
% HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

% Page number centred in footer
\providepairofpagestyles{thesisSimple}{%
  \clearpairofpagestyles
  \cfoot*{\pagemark}
}

\pagestyle{thesisSimple}

\providepairofpagestyles[thesisSimple]{thesis}{}
\providepairofpagestyles[thesisSimple]{review}{}

\pagestyle{thesis}

% Optional top header line only if explicitly requested
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}

% Prevent fancyhdr use
\PreventPackageFromLoading[
  \ClassError{\classname}{Package `fancyhdr' is incompatible\MessageBreak with this class}{%
    The page styles are defined using package `scrlayer-scrpage'.%
  }
]{fancyhdr}

% Blank/chapter page styles
\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}

\NewDocumentCommand{\blankpagestyle}{ m }{%
  \ClassWarning{\classname}{\string\blankpagestyle\space is obsolete,\MessageBreak use \string\setblankpagestyle\space instead}%
  \renewcommand{\blank@p@gestyle}{#1}%
}

\NewDocumentCommand{\setblankpagestyle}{ m }{%
  \renewcommand{\blank@p@gestyle}{#1}%
}

\NewDocumentCommand{\setchapterpagestyle}{ m }{%
  \renewcommand{\chapter@p@gestyle}{#1}%
}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \thispagestyle{\blank@p@gestyle}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

\makeatother

%----------------------------------------------------------------------------------------
% ABBREVIATIONS PAGE
%----------------------------------------------------------------------------------------

\newcommand{\abbrevname}{List of Abbreviations}
\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}

\NewDocumentEnvironment{abbreviations}{ m }{%
  \frontmatterheading{\abbrevname}
  \ifbool{nolistspace}{\begingroup\singlespacing}{}
  \begin{longtable}{#1}
}{%
  \end{longtable}
  \addtocounter{table}{-1}
  \ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
% ABSTRACT PAGE
%----------------------------------------------------------------------------------------

\newcommand{\abstractname}{Abstract}

\DeclareDocumentEnvironment{abstract}{ O{} }{%
  \frontmatterheading{\abstractname}
  \ignorespaces
}{%
}

\DeclareDocumentEnvironment{extraAbstract}{ O{} }{%
  \frontmatterheading{\abstractname}
  \ignorespaces
}{%
}

%----------------------------------------------------------------------------------------
% ACKNOWLEDGEMENTS PAGE
%----------------------------------------------------------------------------------------

\newcommand{\acknowledgementname}{Acknowledgements}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\acknowledgementname}{Acknowledgements}
\providecaptionname{german,ngerman,austrian,naustrian}{\acknowledgementname}{Danksagung}

\DeclareDocumentEnvironment{acknowledgements}{}{%
  \frontmatterheading{\acknowledgementname}
}{%
}

%----------------------------------------------------------------------------------------
% DECLARATION PAGE
%----------------------------------------------------------------------------------------

\newcommand{\authorshipname}{Declaration of Authorship}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\authorshipname}{Declaration of Authorship}
\providecaptionname{german,ngerman,austrian,naustrian}{\authorshipname}{Eidesstattliche Erkl\"arung}

\DeclareDocumentEnvironment{declaration}{}{%
  \frontmatterheading{\authorshipname}
}{%
}

%----------------------------------------------------------------------------------------
% DEDICATION PAGE
%----------------------------------------------------------------------------------------

\newcommand\dedicatory[1]{%
  \checktoopen
  \thispagestyle{plain}
  \null\vfill
  {\begin{center}\normalsize\itshape ``#1''\par\end{center}}
  \vfill\null
}

%----------------------------------------------------------------------------------------
% PHYSICAL CONSTANTS PAGE
%----------------------------------------------------------------------------------------

\newcommand{\constantsname}{Physical Constants}
\providecaptionname{english,british,american}{\constantsname}{Physical Constants}
\providecaptionname{ngerman,german,austrian,naustrian}{\constantsname}{Physikalische Konstanten}

\NewDocumentEnvironment{constants}{ m }{%
  \frontmatterheading{\constantsname}
  \ifbool{nolistspace}{\begingroup\singlespacing}{}
  \begin{longtable}{#1}
}{%
  \end{longtable}
  \addtocounter{table}{-1}
  \ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
% SYMBOLS PAGE
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{ngerman,german,austrian,naustrian}{\symbolsname}{Symbolverzeichnis}

\NewDocumentEnvironment{symbols}{ m }{%
  \frontmatterheading{\symbolsname}
  \ifbool{nolistspace}{\begingroup\singlespacing}{}
  \begin{longtable}{#1}
}{%
  \end{longtable}
  \addtocounter{table}{-1}
  \ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
% UNNUMBERED CHAPTERS / SECTIONS WITH TOC ENTRIES
%----------------------------------------------------------------------------------------

\ProvideDocumentCommand{\addchap}{ s o m }{%
  \chapter*{#3}%
  \markboth{}{}%
  \IfBooleanTF{#1}{%
  }{%
    \IfNoValueTF{#2}{%
      \addchaptertocentry{#3}%
      \markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
    }{%
      \addchaptertocentry{#2}%
      \markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
    }%
  }%
}

\ProvideDocumentCommand{\addsec}{ s o m }{%
  \section*{#3}%
  \markright{}%
  \IfBooleanTF{#1}{%
  }{%
    \IfNoValueTF{#2}{%
      \addcontentsline{toc}{section}{#3}%
      \markright{\MakeMarkcase{#3}}%
    }{%
      \addcontentsline{toc}{section}{#2}%
      \markright{\MakeMarkcase{#2}}%
    }%
  }%
}

%----------------------------------------------------------------------------------------
% HYPERREF SUPPORT
%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{
\AtEndPreamble{%
  \RequirePackage{hyperref}
  \hypersetup{
    pdfpagemode={UseOutlines},
    bookmarksopen=true,
    bookmarksopenlevel=0,
    hypertexnames=false,
    pdfstartview={FitV},
    unicode,
    breaklinks=true
  }
  \pdfstringdefDisableCommands{%
    \let\\\space%
  }
}
}{}

%----------------------------------------------------------------------------------------
% DOCUMENT DEFAULTS
%----------------------------------------------------------------------------------------

% 1.5 spacing
% left-aligned paragraphs
% no paragraph indent
% visible paragraph gap
\AtBeginDocument{%
  \onehalfspacing
  \raggedright
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{0.8em}
}

%----------------------------------------------------------------------------------------

\endinput
% End of class file