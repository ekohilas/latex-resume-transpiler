\ProvidesClass{two-column-resume}[2017/04/20 resume class]
\NeedsTeXFormat{LaTeX2e}
\ProcessOptions\relax
\LoadClass{article}

\usepackage{geometry}
\geometry{a4paper, margin=1cm, twocolumn, columnsep=1cm}

\pagestyle{empty}

% Header
\RequirePackage{tikz}
% For image
\usepackage[skins]{tcolorbox}
\usepackage{eso-pic}
% For argument parsing
\usepackage{xifthen}
\newcommand{\header}[4][]{%
    \twocolumn[\vspace*{2.8cm}]
    \AddToShipoutPictureBG*{\AtPageUpperLeft{
        \begin{tikzpicture}[remember picture, overlay]%

            % Header Shader
            \node [outer sep=0, inner sep=0, rectangle, fill=header-color,
            anchor=north, minimum width=\paperwidth, minimum height=3.3cm]
            (box) at (current page.north){};

            % Picture
            \ifthenelse{\isempty{#1}}{}{%
                \node [circle, inner sep=1cm, fill overzoom image=#1] (picture) at (box) {%\includegraphics[height=2cm]{#1}
                    };
            }

            % Name
            \node [outer xsep=0, inner xsep=0, align=left,
            anchor=north west, below right=1cm] (name) at (box.north west)
            {%
                % Title
                \titlefont #2\\[0.2ex]%
                % Subtitle
            \thinspace\subtitlefont #3%
            };

            % Details
            \node (info) at (box.north east) [outer xsep=0cm, inner xsep=0,
            align=right, font=\detailsfont, anchor=north east, below left=1cm]
            {%
                #4%
            };

        \end{tikzpicture}%
    }}
}

% Section Headings
\usepackage[explicit]{titlesec}
\usepackage{xhfill}
\usepackage{changepage}

% Section lines
\def\Vhrulefill{\leavevmode\leaders\hrule height 0.8ex depth \dimexpr-0.8ex+3pt \hfill\kern0pt}

% Section definition
\titleformat{\section}
{\headfont}{}{0pt}{\sectionfont\noindent\Vhrulefill~~\uppercase{#1}~~\Vhrulefill}

% Section formatting
\titlespacing*{\section}{0pt}{1.8ex}{1ex}


% Events Section
\usepackage[none]{hyphenat}
% Argument parsing
\usepackage{xparse}
\newenvironment{eventlist}{%
\DeclareDocumentCommand\item{ m m m g g }{

    % Heading and time
    \raggedright
    \noindent\headingfont ##1 \hfill \begingroup\raggedleft{}\normfont ##2\endgroup \vspace{4pt}

    % Indent right
    \setlength{\leftskip}{1em}
    \setlength{\parindent}{0pt}

    % Subheading
    \subheadingfont ##3

    % Description if exists
    \IfValueT{##4}{%
        \smallskip%
        \normfont ##4%
    }

    % Revert Indent
    \setlength{\leftskip}{0pt}
    \setlength{\parindent}{1em}

    % Link if exists
    \IfNoValueF{##5}{%
        \smallskip%
        \hfill\linkfont ##5%
    }

    % Spacing under element
    \vspace{2.1ex}%\medbreak
    }
}

% Skills section
\newenvironment{skilllist}{%
\renewcommand\item[2]{
    \par\noindent\subheadingfont ##1 \hfill\normfont ##2
    \vspace{0.6ex}%\smallbreak
    }
}

