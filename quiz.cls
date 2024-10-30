\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{quiz}[基於 LaTeX Class: article and Program Design 出題格式慣例]

\DeclareOption{solution}{
	\newcommand{\solution}[2][C]{\inputminted[linenos, bgcolor=Beige, breaklines, breakanywhere = true, fontsize = \scriptsize]{#1}{#2}}
}

\ProcessOptions\relax
\LoadClassWithOptions{article}
\PassOptionsToClass{\CurrentOption}{article}

% Use Times New Rome as default font
\usepackage{newtxtext}

\usepackage{minted}
\usepackage[svgnames]{xcolor}

% set margin
\RequirePackage[]{geometry}
\geometry{margin = 2.54cm}

% counters
\newcounter{one}
\setcounter{one}{1} % pseudo counter represent one for compare

\newcounter{semester}
\newcounter{quiz}
\newcounter{hw}

\providecommand\totalHw{}
\providecommand\totalQuiz{}
\providecommand\duedate{\today}
\newcommand{\setduedate}[1]{\renewcommand{\duedate}{#1}}

\newcommand{\stepsemeter}{\stepcounter{semester}}
\stepsemeter

% titles
\newcommand{\hwtitle}[1]{%
\stepcounter{hw}
\begin{center}
\begin{LARGE}
\textbf{Program Design (\Roman{semester})}\\\medskip\smallskip
\end{LARGE}
\begin{large}
Homework\ \# #1\ifnum0\totalHw > \c@one -\arabic{hw} \fi \\% if total HW greater than one, show 2-1 and 2-2 etc.
Due: \duedate (CST)\\
\end{large}\medskip
\textbf{NOTE: Please upload your C program to DomJudge before the due date and time.}
\end{center}
}

\newcommand{\quiztitle}[1]{%
\stepcounter{quiz}
\begin{center}
\begin{Large}
\textbf{Quiz Section for Program Design (\Roman{semester})}\\\medskip\smallskip
\end{Large}
\begin{large}
Execrise\ \# #1\ifnum0\totalHw > \c@one -\arabic{quiz} \fi
\end{large}
\end{center}\medskip
}


% 把 total Quiz 跟 Total Hw 寫進 aux file 中
\AtEndDocument{%
  \immediate\write\@mainaux{%
    \string\gdef\string\totalHw{\number\value{hw}}%
    \string\gdef\string\totalQuiz{\number\value{quiz}}%
  }%
}

% set length for page layout
\setlength{\parindent}{0pt}
\linespread{1.2}
\setlength{\parskip}{\baselineskip}

% Set label for itemize environment
\usepackage{amssymb}
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\scriptstyle\blacksquare$}

% custom itemize for spacing
\usepackage{enumitem}
\newenvironment{myitemize}%
{\begin{itemize}[leftmargin = 24pt, labelsep = *, listparindent = 0pt, align = left, itemsep = -4pt]}%
{\end{itemize}}

% Custom environment and command for listing input and output
\usepackage{longtable}
\newenvironment{testcase}{\par\noindent%
The table below shows the example input and output.\smallskip
\begin{longtable}{|p{0.5\textwidth}|p{0.5\textwidth}|}
\hline
Input & Output\\
\hline
}{\end{longtable}}

\usepackage{soul}
\newcommand{\case}[2]{ %
\texttt{\ul{#1}} & \texttt{#2}
\\\hline
}

\providecommand{\solution}[2][C]{\relax}

\endinput