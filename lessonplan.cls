% Provide identification.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lessonplan}[2026-08-25 Document class for lesson plans]

% Load base class and packages.
\LoadClassWithOptions{article}
\RequirePackage{titling}
\RequirePackage{fancyhdr}
\RequirePackage{translator}
\RequirePackage{xltabular}
\RequirePackage{environ}

% Set page layout to A4.
\RequirePackage[
    a4paper,
    margin=2cm
]{geometry}

% Set parskip options.
\RequirePackage[
    skip=10pt plus1pt,
    indent=0pt
]{parskip}

% Configure fancyhdr.
\pagestyle{fancy}
\fancyhead[C]{\thetitle}
\fancyhead[L,R]{\leftmark}
\fancyfoot[C]{\thedate}
\fancyfoot[R]{\thepage}

% Declare custom "option" commands.
\def\@topic{\@latex@error{No \noexpand\topic given}\@ehc}
\def\@duration{\@latex@error{No \noexpand\duration given}\@ehc}
\def\@goals{\@latex@error{No \noexpand\goals given}\@ehc}
\def\@participants{\@latex@error{No \noexpand\participants given}\@ehc}
\def\@material{\@latex@error{No \noexpand\material given}\@ehc}
\DeclareRobustCommand\topic[1]{\gdef\@topic{#1}}
\DeclareRobustCommand\duration[1]{\gdef\@duration{#1}}
\DeclareRobustCommand\goals[1]{\gdef\@goals{#1}}
\DeclareRobustCommand\participants[1]{\gdef\@participants{#1}}
\DeclareRobustCommand\material[1]{\gdef\@material{#1}}

% Provide translations for header labels.
\newtranslation[to = German]{Topic:}{Thema:}
\newtranslation[to = German]{Duration:}{Dauer:}
\newtranslation[to = German]{Goals:}{Lernziele:}
\newtranslation[to = German]{Participants:}{Teilnehmende:}
\newtranslation[to = German]{Material:}{Material:}
\newtranslation[to = German]{Time}{Zeit}
\newtranslation[to = German]{Description}{Ablauf}
\newtranslation[to = German]{Methodical Notes}{Methodische Notizen}
\newtranslation[to = German]{Plan}{Plan}

% Define font to use for header labels (and the fact that we want to localise
% them).
\newcommand\@hdrlabel[1]{\textbf{\translate{#1}}}

% Declare command to produce header.
\newcommand\makeheader{
    \begingroup
    \renewcommand{\arraystretch}{1.5}
    \begin{tabularx}{\textwidth}{|X|X|X|X|}
        \hline
        \multicolumn{3}{|>{\hsize=\dimexpr3\hsize+3\tabcolsep+\arrayrulewidth\relax\setlength\linewidth{\hsize}}X|}
        {\@hdrlabel{Topic:}\par \@topic}
        &
        \@hdrlabel{Duration:}\par \@duration
        \\
        \hline
        \multicolumn{4}{|>{\hsize=\dimexpr4\hsize+4\tabcolsep+\arrayrulewidth\relax\setlength\linewidth{\hsize}}X|}
        {\@hdrlabel{Goals:}\par \@goals}
        \\
        \hline
        \multicolumn{2}{|>{\hsize=\dimexpr2\hsize+2\tabcolsep+\arrayrulewidth\relax\setlength\linewidth{\hsize}}X|}
        {\@hdrlabel{Participants:}\par \@participants}
        &
        \multicolumn{2}{|>{\hsize=\dimexpr2\hsize+2\tabcolsep+\arrayrulewidth\relax\setlength\linewidth{\hsize}}X|}
        {\@hdrlabel{Material:}\par \@material}
        \\
        \hline
    \end{tabularx}
    \endgroup
}

% Declare main environment.
\NewEnviron{plan}[1][\translate{Plan}]{
    \section{#1}
    \begingroup
    \renewcommand{\arraystretch}{1.5}
    \newcommand\segment[3]{ {##1} & {##2} & {##3} \\ \hline}
    \begin{xltabular}{\textwidth}{|l|X|X|}
        \hline
        \@hdrlabel{Time} &
        \@hdrlabel{Description} &
        \@hdrlabel{Methodical Notes} \\
        \hline
        \BODY
    \end{xltabular}
    \endgroup
}

% Redefine the maketitle command to also set the pagestyle to empty.
\NewCommandCopy{\@intmaketitle}{\maketitle}
\renewcommand{\maketitle}{\@intmaketitle\thispagestyle{empty}}
