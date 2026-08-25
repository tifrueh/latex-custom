% Provide identification.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lessonplan}[2026-08-25 Document class for lesson plans]

% Load base class and packages.
\LoadClassWithOptions{article}
\RequirePackage{titling}
\RequirePackage{fancyhdr}
\RequirePackage{translator}

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

% Define font to use for header labels (and the fact that we want to localise
% them).
\newcommand\@hdrlabel[1]{\textbf{\translate{#1}}}

% Declare command to produce header.
\newcommand\makeheader{
    \begingroup
    \renewcommand{\arraystretch}{1.5}
    \begin{center}
        \begin{tabular}{
                | p{0.25\textwidth}
                | p{0.25\textwidth}
                | p{0.25\textwidth}
                | p{0.25\textwidth} | }
            \hline
            \multicolumn{3}{|p{0.75\textwidth}|}
            {\@hdrlabel{Topic:}\par \@topic}
            &
            \@hdrlabel{Duration:}\par \@duration
            \\
            \hline
            \multicolumn{4}{|p{1.0\textwidth}|}
            {\@hdrlabel{Goals:}\par \@goals}
            \\
            \hline
            \multicolumn{2}{|p{0.5\textwidth}|}
            {\@hdrlabel{Participants:}\par \@participants}
            &
            \multicolumn{2}{|p{0.5\textwidth}|}
            {\@hdrlabel{Material:}\par \@material}
            \\
            \hline
        \end{tabular}
    \end{center}
    \endgroup
}
