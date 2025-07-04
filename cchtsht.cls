% Provide identification.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cchtsht}[2025-06-16 Custom cheatsheet document class]

% Load base class and packages.
\LoadClass[8pt]{extarticle}
\RequirePackage{multicol}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable}
\tcbuselibrary{skins}

% Set page layout.
\RequirePackage[
    a4paper,
    landscape,
    margin=1cm,
    footskip=0.5cm
]{geometry}

% Set parskip options.
\RequirePackage[
    skip=5pt plus1pt,
    indent=0pt
]{parskip}

% Configure custom section titles.
\RequirePackage[
    compact
]{titlesec}

\newlength{\sepwidth}
\setlength{\sepwidth}{0.4pt}
\setlength{\columnseprule}{\sepwidth}

\newcommand{\secsep}{
    \vspace{\baselineskip}
    \leaders
        \hrule width \columnwidth \relax
    \vskip\sepwidth
}

\titleformat{\section}
    {\secsep\Large\bfseries}
    {\thesection}
    {1em}
    {}

% Configure list spacing.
\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=-0.6\parskip}

% Configure equation spacing.
\g@addto@macro \normalsize{
    \setlength\abovedisplayskip{-\baselineskip}
    \setlength\belowdisplayskip{0pt}
    \setlength\abovedisplayshortskip{-\baselineskip}
    \setlength\belowdisplayshortskip{0pt}
}

% Define keyword command.
\newcommand{\key}[1]{\textit{\color{teal}{#1}}}

% Define box environment.
\newtcolorbox{colbox}[2]{
    blanker,
    parbox=false,
    breakable=true,
    autoparskip,
    title=#2,
    attach title to upper,
    after title={:\ },
    colback=white,
    coltitle=#1,
    fonttitle=\bfseries,
    sharp corners,
    top=0mm, right=0mm, bottom=0mm, left=2mm,
    borderline west={0.5mm}{0mm}{#1}
}

% Define cheatsheet environment (which is basically just multicols for now).
\newenvironment{cheatsheet}[1][3]{
    \begin{multicols*}{#1}
}{
    \end{multicols*}
}
