\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{avhandling}[2018/02/06 Class for thesis writing]

\DeclareOption{draft}{%
    \PassOptionsToClass{\CurrentOption, oneside}{memoir}
}
\DeclareOption{showimages}{%
    \PassOptionsToPackage{final}{graphicx}
}
\DeclareOption*{%
      \PassOptionsToClass{\CurrentOption}{memoir}%
   }
\ProcessOptions\relax

% This class is a tweak of the memoir class
\LoadClass[11pt, b5paper]{memoir}[2016/05/16]

\RequirePackage{graphicx}
\RequirePackage{xspace}
\RequirePackage{xcolor}

\newcommand{\numdesc}[1]{\item{\bfseries\sffamily{#1}\\}}

%%%%%%%%%%%%%%%%%%%%%%
% Memoir settings
%%%%%%%%%%%%%%%%%%%%%%

% Margins to accomodate b5 format
\setbinding{10mm}
\isopage[12]
\checkandfixthelayout

% Section styles and numbering
\setsecnumdepth{subsubsection}

\setsechook{\hangsecnum}
\setsubsechook{\defaultsecnum}
\setsubsubsechook{\defaultsecnum}

\setsecheadstyle{\sffamily\LARGE\bfseries}
\setsubsecheadstyle{\sffamily\large\bfseries}
\setsubsubsecheadstyle{\sffamily}

% Caption styles
\captionnamefont{\sffamily\footnotesize\bfseries}
\captiontitlefont{\small}

% Preparing for subfigures
\newsubfloat{figure}
\subcaptionlabelfont{\sffamily\footnotesize\bfseries}
\subcaptionfont{\small}

% Table of contents
\setcounter{tocdepth}{2}

\renewcommand*{\cftchapterfont}{\sffamily\bfseries}
\renewcommand*{\cftchaptername}{Chapter\space}
\renewcommand*{\cftsubsectionfont}{\footnotesize}
\renewcommand*{\cftsubsectionformatpnum}{\footnotesize}

% Headers and footers
\copypagestyle{avhandling}{ruled}
\makefootrule{avhandling}{\textwidth}{\normalrulethickness}{\footruleskip}
\pagestyle{Ruled}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fouriernc}
\RequirePackage{montserrat}
% \RequirePackage{avant}
\renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont #1}}
\RequirePackage{upgreek}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

\RequirePackage{tikz}

\RequirePackage{bm}
\RequirePackage{mathtools}
\RequirePackage{physics}

% Defining vector and matrix notation
\newcommand{\mat}[1]{\bm{\mathbf{#1}}\xspace}

% Define Assumption environment
\theoremstyle{plain}
\newtheorem{assumption}{Assumption}

%Redefining frac in inline (text) mode
\let\oldfrac\frac% Store \frac
\renewcommand{\frac}[2]{%
  \mathchoice
    {\oldfrac{#1}{#2}}% display style
    {#1/#2}% text style
    {#1/#2}% script style
    {#1/#2}% script-script style
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Work in progress tools
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comments
\RequirePackage{marginnote}
\RequirePackage[draft, author=]{fixme}
\fxusetheme{color}
\newcommand{\todo}{\fxfatal[draft]}
\newcommand{\todocite}[1][]{\fxnote[draft]{Citation needed #1}\xspace}
\newcommand{\todofig}[1][]{\fxwarning[draft]{Figure wanted #1}\xspace}
%\newcommand{\todo}{\fxfatal[final]}
%\newcommand{\todocite}[1][]{\fxnote[final]{Citation needed #1}\xspace}
%\newcommand{\todofig}[1][]{\fxwarning[final]{Figure wanted #1}\xspace}


% Chapter mini toc
\RequirePackage{titletoc} %Mainly for the writing process
\newcommand{\chaptertoc}{\vfill
\par
\startcontents[chapters]\vbox{\bfseries\sffamily Chapter outline}
\small
\printcontents[chapters]{}{1}{\setcounter{tocdepth}{1}}
\normalsize
\clearpage
}

% Chapter abstract with mini toc
\newcommand{\intro}[1]{{\sffamily #1}\chaptertoc}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography settings
%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
style=nature,%
date=year,%
backend=biber,%
url=false,%
doi=false,%
isbn=false,%
natbib=true,%
sorting=none,%
maxbibnames=99,%
giveninits=true,%
terseinits=true%
]{biblatex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperlinks in pdf document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[pdftex]{hyperref}
\hypersetup{
pdftitle={Iteratively coupled implicit dynamic MPM-FVM},
pdfauthor={Hilde Aas Nøst},
linktoc=page,
colorlinks=true,
final=true,
citecolor=olive,
linkcolor=teal
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clever referencing tool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
\RequirePackage[capitalise, noabbrev, sort&compress]{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapter heading style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{color,calc,soul}
\definecolor{nicered}{rgb}{.28,.02,.03} %Bulgarian rose
% \definecolor{nicered}{rgb}{.33,.41,.47} %Cadet grey
% \definecolor{nicered}{rgb}{.35,.15,.13} %Caput mortuum
% \definecolor{nicered}{rgb}{.18,.31,.31} %Dark slate grey
\newlength\dlf@normtxtw
\setlength\dlf@normtxtw{\textwidth}
\def\myhelvetfont{\def\sfdefault{mdput}}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
\sbox\feline@chapter{%
\resizebox{!}{#1}{\fboxsep=1pt%
\colorbox{nicered}{\color{white}\bfseries\sffamily\thechapter}%
}}%
\rotatebox{90}{%
\resizebox{%
\heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}%
{!}{\scshape\so\@chapapp}}\quad%
\raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}
\newcommand\feline@chm[1][4cm]{%
\sbox\feline@chapter{\feline@chapter@marker[#1]}%
\makebox[0pt][l]{% aka \rlap
\makebox[1cm][r]{\usebox\feline@chapter}%
}}
\makechapterstyle{daleif1}{
\renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft\so}
\renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{nicered}}
\renewcommand\chapternamenum{}
\renewcommand\printchaptername{}
\renewcommand\printchapternum{\null\hfill\feline@chm[2.5cm]\par}
\renewcommand\afterchapternum{\par\vskip\midchapskip}
\renewcommand\printchaptertitle[1]{\chaptitlefont\raggedleft ##1\par}
}
\chapterstyle{daleif1}
