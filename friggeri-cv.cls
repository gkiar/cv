\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{28282e}
\definecolor{gray}{HTML}{4a484c}
\definecolor{lightgray}{HTML}{888888}

\definecolor{green}{HTML}{33A02C}
\definecolor{orange}{HTML}{F75C03}
\definecolor{purple}{HTML}{921273}
\definecolor{pink}{HTML}{D90368}
\definecolor{lightblue}{HTML}{318dde}
\definecolor{blue}{HTML}{006BA6}
\definecolor{red}{HTML}{BA2638}
\definecolor{plubblue}{HTML}{1C518C}
\definecolor{orcidgreen}{HTML}{8ACC00}
\definecolor{googred}{HTML}{F90F1D}
\definecolor{gateteal}{HTML}{00C9AD}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
	\colorlet{pink}{gray}
  \colorlet{lightblue}{gray}
  \colorlet{plubblue}{gray}
  \colorlet{orcidgreen}{gray}
  \colorlet{googred}{gray}
  \colorlet{gateteal}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}
\colorlet{fillheader}{white}
\colorlet{header}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{fontawesome5}
\RequirePackage{academicons}

\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont[]{[Gentona-Medium.ttf]}
\newfontfamily\thinfont[]{[Gentona-Light.ttf]}
\newfontfamily\headingfont[]{[Gentona-Bold.ttf]}
\newfontfamily\italicfont[]{[Gentona-LightItalic.ttf]}
\newfontfamily\jobfont[]{[Gentona-BookItalic.ttf]}
\DeclareTextFontCommand{\emph}{\color{textcolor}\selectfont\italicfont}
\DeclareTextFontCommand{\job}{\color{textcolor}\selectfont\jobfont}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{[Gentona-Light.ttf]}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=south] (name) at (box.center) {%
      \vspace{20pt}
      \fontsize{30pt}{50pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] (job) at (name.south) {%
      \fontsize{12pt}{18pt}\color{header}%
      \thinfont #3%
    };
    \node [anchor=north,text width=0.9*\paperwidth,align=center] at (job.south) {%
      \fontsize{12pt}{18pt}\color{header}%
      \thinfont #4%
    };
  \end{tikzpicture}
  \vspace{40pt}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        lightblue\or%
        red\or%
        orange\or%
        green\or%
        pink\or%
				blue\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{15.3cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \renewcommand{\subsection}[1]{
    \par\vspace{\baselineskip}{\large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 3.6)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99,sorting=chronological]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[manual]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inbook]{title}{#1\par}
\DeclareFieldFormat[booklet]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[proceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\defbibenvironment{bibliography}
  {\enumerate
     {}
     {\setlength{\leftmargin}{\bibhang}%
      \setlength{\itemindent}{-\leftmargin}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}}
  {\endenumerate}
  {\item}


\DeclareBibliographyDriver{article}{%
	\printfield{title}
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{manual}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{proceedings}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inbook}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
	\vspace{-5pt}%
  \printnames{author}%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{booklet}{%
  \printfield{title}%
  \newblock%
  \par%
  \newblock%
	\vspace{-5pt}%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle},%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
		.
  }
  \par\vspace{0.3\baselineskip}
}
\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
	\ifstrequal{\namepartfamily,Kiar}{}{}%
  \ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\defbibheading{bibheading}[\bibname]{%
   \subsubsection*{#1}
   \markboth{#1}{#1}
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=bibheading]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=false,       
    linkcolor=red,          
    citecolor=red,        
    filecolor=red,      
    urlcolor = red}
    
% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
