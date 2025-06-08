% Provide identification.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ethzbasic}[2025-06-05 Basic article for ETHZ]

% Load base class and packages.
\LoadClass{article}
\RequirePackage{titling}
\RequirePackage{fancyhdr}

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

% Redefine the maketitle command to also set the pagestyle to empty.
\NewCommandCopy{\@intmaketitle}{\maketitle}
\renewcommand{\maketitle}{\@intmaketitle\thispagestyle{empty}}
