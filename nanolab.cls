%добавить гиперреф как опцию
%добавить библиографию
%не переносятся слова в содержании, если задан перенос в начале документа

\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\ProvidesClass{nanolab}[2008/06/18]
\LoadClass[a4paper,12pt, oneside,titlepage]{book}
\RequirePackage[utf8]{inputenc}%for WiN
\RequirePackage[T2A]{fontenc}
\RequirePackage[english,russian]{babel}
%\RequirePackage[colorlinks=true, bookmarks=true, pagebackref=true, unicode=true]{hyperref}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{ifpdf}
\RequirePackage{cite}
\RequirePackage{xcolor}
\hfuzz=3pt \emergencystretch=8pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Для правильного переноса составных слов
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\lccode`\-=`\-
\defaulthyphenchar=127
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Параметры страницы
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{thesis}{
\PassOptionsToPackage{mag=1083}{geometry} %% Размер шрифта=13 (mag=1083) 
} 
\DeclareOption{diploma}{
\PassOptionsToPackage{mag=916}{geometry} %% Размер шрифта=11 (mag=916) 
} 
\DeclareOption{kursovaya}{
\PassOptionsToPackage{mag=916}{geometry} %% Размер шрифта=11 (mag=916) 
} 
\DeclareOption{draft}{
\PassOptionsToPackage{mag=750}{geometry} %% Размер шрифта=9 (mag=750) 
} 
\ProcessOptions\relax
\RequirePackage[hmargin={4cm,1.8cm}, vmargin={2.3cm, 1.8cm}, a4paper,truedimen]{geometry}

\linespread{1.2} %% Расстояние между строк
\pagestyle{headings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Команда \mm для выделения в тексте
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\mm}{\@mm}
\def\@mm#1{\colorbox{yellow}{\bf #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Исправим букву ё, которая в кодовой таблице T2A не на том месте
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\catcode`\ё\active
%\defё{\"{e}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Определяем форматы иллюстраций
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifpdf
  \RequirePackage[pdftex]{graphicx}
  \pdfcompresslevel=9
  \DeclareGraphicsExtensions{.png}
\else
  \RequirePackage[dvips]{graphicx}
  \DeclareGraphicsExtensions{.eps}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Описание колонтитулов
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@oddhead}
{\raisebox{0pt}[\headheight][0pt] {\vbox{\hbox to\textwidth
{\strut {\sl\rightmark} \hfil \thepage}\hrule}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Оформление содержания
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{5}% чтоб всё с запасом
\contentsmargin[0.3em]{2em}

\titlecontents{chapter}[0pt]{\addvspace{1pc}}%
{\bfseries\makebox[3cm][l]{\large Глава \thecontentslabel\enspace}%
\nopagebreak\vspace{.3em}\newline\large}{\large}{\titlerule*{ }\contentspage[{\makebox[1em][r]{\bf\thecontentspage}%
}]}[\vspace{0.3pc}]

%\dottedcontents{section}[1.5em]{}{2.3em}{1pc}
\titlecontents{section}[2.8em\hspace{-1.3em}]{}{\thecontentslabel.\hspace{.5em}}%
{\hspace*{-2pc}}{\protect\nolinebreak\titlerule*[.5em]{.}\protect\nolinebreak\contentspage[{\makebox[1em][r]{\thecontentspage}%
}]}[]

\titlecontents{subsection}[6em\hspace{-2em}]{\thecontentslabel.\hspace{.5em}}%
{}{}{\protect\nolinebreak\titlerule*[.5em]{.}\protect\nolinebreak\contentspage[{\makebox[1em][r]{\thecontentspage}%
}]}[]

\titlecontents{subsubsection}[8em\hspace{-2em}]{\thecontentslabel.\hspace{.5em}}%
{}{}{\protect\nolinebreak\titlerule*[.5em]{.}\protect\nolinebreak\contentspage[{\makebox[1em][r]{\thecontentspage}%
}]}[]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Оформляем заголовок главы
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand \thechapter {\@Roman\c@chapter}%% Нумерация глав римскими цифрами
\newcommand{\nonumchapter}{\@nonumchap}
\renewcommand{\appendix}{\@tataappendix}
\def\@nonumchap#1{\setcounter{section}{0}%
                        \newpage%
                       \hspace{-3.5ex \@plus -1ex \@minus -.2ex}%
                       \centerline{\large\bf #1}%
                     \addtocontents{toc}{\par\vspace{1pc}\hbox to \textwidth
                     {\noindent \bf {\large#1} \hfill \hspace{1em}\thepage}}%
                        \markboth{#1}{#1}\vspace{1ex}\par\nobreak%
                        \normalsize\normalfont\noindent\hspace{-0.3em}}
\def\@tataappendix#1#2{\setcounter{section}{0}%
                        \newpage%
                       \hspace{-3.5ex \@plus -1ex \@minus -.2ex}%
                       \large\bf #1%
                       \section*{#2}%
                     \addtocontents{toc}{\par\vspace{1pc}\noindent{\bf #1}\par}
                       \addcontentsline{toc}{section}{\hspace{3.3em}#2}
                        \markboth{#1}{#1}\par\nobreak%
                        \normalsize\normalfont}
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \centerline{\large\bf \contentsname}\vspace{2pc}
        \@mkboth{\contentsname}{\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Заголовки мелких секций
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3}
\renewcommand\thesection{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\figurename}{Рис.}
\def\tatabibname{Список литературы}
\titleformat{\chapter}[display]{\thispagestyle{empty}\large\bf}{\chaptername\
\thechapter}{1em}{\raggedright}
\titlespacing*{\chapter}{0pt}{-5ex}{2.3ex plus .2ex}
\titleformat{\section}{\normalfont\bf}{\thesection.\hspace{-0.12cm}}{1em}{}
\titleformat{\subsection}{\normalfont\it}{\thesubsection.\hspace{-0.3cm}}{1em}{}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titleformat{\subsubsection}{\normalfont\it}{\thesubsubsection\hspace{-0.5em}}{1em}{}
\titlelabel{\thetitle}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Оформление списка литературы
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{thebibliography}[1]
     {\nonumchapter{\tatabibname}%
      \@mkboth{\tatabibname}{\tatabibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Делаем сквозную нумерацию картинок, таблиц и уравнений
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \addtocounter{chapter}{1}% эти две строки переделаны, чтоб номера ур-ий не обнулялись
                         \setcounter{section}{0}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#2}%
                       \else
                         \addcontentsline{toc}{chapter}{#2}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#2}%
                    \fi
                    \markboth{}{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\renewcommand \theequation{\@arabic\c@equation}
\renewcommand \thefigure{\@arabic\c@figure}
\newcounter{tatafigure}
\renewenvironment{figure}
               {\setcounter{figure}{\value{tatafigure}}\@float{figure}}
               {\addtocounter{tatafigure}{1}\end@float}
\renewcommand \thetable{\@arabic\c@table}
\newcounter{tatatable}
\renewenvironment{table}
               {\setcounter{table}{\value{tatatable}}\@float{table}}
               {\addtocounter{tatatable}{1}\end@float}
