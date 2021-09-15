% WUSTL thesis/dissertation template
% Copyright 2021 Liang-Bo Wang
%
% This work may be distributed and/or modified under the conditions of the LaTeX Project Public
% License, either version 1.3 of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `unmaintained'.
%
% This work consists of the files wuthesis.cls.

% ---- Origin of this template ------------------------------------------------
% While it's difficult to fully trace the origins, based on the comments in the original
% wuthesis.cls file, Kevin Ruland created the WashU Sever Institute thesis class wuthesis.dtx (later
% converted to wuthesis.cls) in 1995 based on UT Austin's Thesis Style File v2 by Dinesh Das in
% 1995. Revisions were made by Long Duan in 1996, by Greg Hackmann in 2005, 2007, and 2008, and
% finally by Michael Hall, David Lu in 2014.

% ---- Change Log -------------------------------------------------------------
% Version 2021-09-12
%   * Initial commit
%   * Rewrite of the original wuthesis.cls file

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{wustlthesis}[2021/09/12 WUSTL thesis/dissertation template]


% ---- Define Page Layout -----------------------------------------------------
\LoadClass[letterpaper,12pt,openany,oneside,onecolumn]{memoir}

% Page margin
\setlrmarginsandblock{1in}{1in}{*}
\setulmarginsandblock{1in}{88pt}{*}  % 1in + 16pt = 88pt

% Header and footer location
% Note though the style specifies that nothing can be inside the page margins, the style guide
% doc file actually places the page numbers in the margin. The settings below mimics the doc.
\setheadfoot{18pt}{16pt}
\setheaderspaces{*}{6pt}{*}

% Margin note location
% Note that the style guide prohibits margin notes.
\setmarginnotes{1em}{4em}{\onelineskip}

% Math environment
\RequirePackage{amsmath}

% Unicode fonts
\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% Localization specific settings
\RequirePackage[english]{babel}

% Quotation style
\RequirePackage[autostyle,english=american]{csquotes}


% ---- Main page style --------------------------------------------------------
\makepagestyle{main}
   \makeevenfoot{main}{}{\thepage}{}
   \makeoddfoot{main}{}{\thepage}{}

% Default page style
\pagestyle{plain}

% Quotation style
\AtBeginEnvironment{quote}{\OnehalfSpacing}

% Chapter style
\makechapterstyle{thesis}{%
    \chapterstyle{tandh}
    \renewcommand*{\chapnamefont}{\normalfont\huge\bfseries}
    \renewcommand*{\chapnumfont}{\normalfont\huge\bfseries}
    \renewcommand*{\chaptitlefont}{\normalfont\huge\bfseries}
    \renewcommand*{\printchaptername}{%
        \OnehalfSpacing\centering\chapnamefont\chaptername\ }
    \renewcommand*{\printchapternum}{\thechapter:\ }
    \renewcommand*{\printchapternonum}{\OnehalfSpacing\centering}
}

% Default chapter style
\chapterstyle{thesis}

% Appendix style
\addto{\captionsenglish}{\renewcommand{\appendixname}{Appendix}}
\makechapterstyle{thesisappendix}{%
    \chapterstyle{thesis}
    \renewcommand*{\printchaptername}{%
        \OnehalfSpacing\centering\chapnamefont\appendixname\ }
}
\addtodef{\appendix}{}{\chapterstyle{thesisappendix}}

% Section numbering down to subsection
\setsecnumdepth{subsection}
\maxsecnumdepth{subsection}


% ---- Bibliography/References style ------------------------------------------
\setlength{\bibitemsep}{\onelineskip}


% ---- Table of contents (ToC) -----------------------------------------------
\setrmarg{3em}
\setpnumwidth{1.5em}

\maxtocdepth{subsection}  % put 3 levels into the ToC
\addto{\captionsenglish}{\renewcommand{\contentsname}{Table of Contents}}
\renewcommand{\cftdotsep}{0.5}
\renewcommand*{\cftchapterfont}{\normalfont}
\renewcommand*{\cftchapterpagefont}{\normalfont}
\renewcommand*{\cftchapterleader}{\cftchapterfont\cftdotfill{\cftchapterdotsep}}
\renewcommand*{\cftchapterdotsep}{\cftdotsep}
\renewcommand*{\cftchaptername}{\chaptername}
\renewcommand*{\cftchapterpresnum}{\ }
\renewcommand*{\cftchapteraftersnum}{:}
\renewcommand*{\cftappendixname}{\appendixname}

\setlength{\cftbeforechapterskip}{6pt plus 1pt minus 1pt}
\setlength{\cftbeforesectionskip}{6pt plus 1pt minus 1pt}
\setlength{\cftbeforesubsectionskip}{6pt plus 1pt minus 1pt}


% ---- List of figures (LoF), and list of tables (LoT) -----------------------
\addtodef{\listoffigures}{\clearpage}{}
\renewcommand*{\cftfigurename}{\figurename}
\renewcommand*{\cftfigurepresnum}{\ }
\renewcommand*{\cftfigureaftersnum}{:}
\setlength{\cftbeforefigureskip}{6pt plus 1pt minus 1pt}

\addtodef{\listoftables}{\clearpage}{}
\renewcommand*{\cfttablename}{\tablename}
\renewcommand*{\cfttablepresnum}{\ }
\renewcommand*{\cfttableaftersnum}{:}
\setlength{\cftbeforetableskip}{6pt plus 1pt minus 1pt}

% No chapter space inserted in LoF and LoT
\renewcommand{\insertchapterspace}{}


% ---- Title page -----------------------------------------------------
\newcommand{\settitle}[1]{\def\thesistitle{#1}}
\newcommand{\setauthor}[1]{\def\thesisauthor{#1}}
\newcommand{\setthesistype}[1]{\def\thesistype{#1}}
\newcommand{\setthesisdegree}[1]{\def\thesisdegree{#1}}
\newcommand{\setthesisdegreeabbrv}[1]{\def\thesisdegreeabbrv{#1}}
% Degree officially earn date must be in December, May, or August
\newcommand{\setdegreeearnmonth}[1]{\def\degreeearnmonth{#1}}
\newcommand{\setdegreeearnyear}[1]{\def\degreeearnyear{#1}}

\newcommand{\setthesisadvisor}[1]{\def\thesisadvisor{#1}}
\newcommand{\setthesiscommittee}[1]{\def\thesiscommittee{#1}}
\newcommand{\setthesisschool}[1]{\def\thesisschool{#1}}
\newcommand{\setthesisdepartment}[1]{\def\thesisdepartment{#1}}

\newcommand{\thetitlepage}{%
    \clearpage
    \begin{titlingpage}
    \thispagestyle{empty}
    \SingleSpacing
    \setSingleSpace{1.2}
    \centering
    WASHINGTON UNIVERSITY IN ST.~LOUIS \\[\onelineskip]
    \thesisschool \\
    \thesisdepartment \\[3\onelineskip]

    \thesistype\ Examination Committee: \\
    \thesiscommittee

    \vfill
    \thesistitle \\
    by\\
    \thesisauthor \\[4\onelineskip]

    A \MakeLowercase{\thesistype} presented to \\
    The Graduate School \\
    of Washington University in \\
    partial fulfillment of the \\
    requirements for the degree \\
    of \thesisdegree

    \vfill
    \vfill
    \degreeearnmonth\ \degreeearnyear\\
    St.~Louis, Missouri
    \end{titlingpage}
    \clearpage%
}


% ---- Thesis copyright page -------------------------------------------------
\newcommand{\thesiscopyright}[1]{{%
    \clearpage
    \thispagestyle{empty}
    \mbox{}
    \vfill
    \centering #1
    \vfill
    \clearpage%
}}


% ---- Acknowledgements page -------------------------------------------------
\newcommand{\thesisacknowledgments}{%
    \chapter*{Acknowledgments}
    \vspace*{-1.5in}\phantomsection\vspace*{1.5in}
    \addcontentsline{toc}{chapter}{Acknowledgements}%
}


% ---- Dedication page -------------------------------------------------------
\newcommand{\thesisdedication}[1]{{%
    \clearpage
    \label{thesisdedication}
    \mbox{}
    \vfill
    \centering #1
    \vfill
    \clearpage%
}}


% ---- Abstract page ---------------------------------------------------------
\BeforeBeginEnvironment{abstract}{%
    \vspace*{-1.5in}\phantomsection\vspace*{1.5in}
    \addcontentsline{toc}{chapter}{Abstract}}
% Update the abstract title.
% Note the \addto{\captionLANG}{...} is needed to override babel.
% Ref: https://tex.stackexchange.com/a/24778
\addto{\captionsenglish}{%
    \renewcommand{\abstractname}{%
        ABSTRACT OF THE \MakeUppercase{\thesistype}\\
        \thesistitle \\
        by \\
        \thesisauthor \\
        \thesisschool \\
        \thesisdepartment \\
        Washington University in St.~Louis, \degreeearnyear \\
        \thesisadvisor%
    }}
\renewcommand{\absnamepos}{center}
\renewcommand{\abstractnamefont}{%
    \vspace{-\beforechapskip}
    \vspace{-\baselineskip}
    \normalfont\normalsize%
}
\renewcommand{\abstracttextfont}{\normalfont\normalsize}
\AtBeginDocument{
    \setlength{\absleftindent}{0em}
    \setlength{\absparindent}{0em}
    \setlength{\absrightindent}{0em}
}