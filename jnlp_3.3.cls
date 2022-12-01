%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 自然言語処理                             %%%%
%%%% Journal of Natural Language Processing   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{pLaTeX2e}
%%%%\ProvidesClass{jnlp_1.1}[2006/09/15 v1.1]
%%%%\ProvidesClass{jnlp_1.2}[2006/12/06 v1.2]
%%%%\ProvidesClass{jnlp_1.3}[2007/02/10 v1.3]
%%%%\ProvidesClass{jnlp_1.4}[2007/12/11 v1.4]
%%%%\ProvidesClass{jnlp_2.1}[2017/12/19 v2.1]
%%%%\ProvidesClass{jnlp_2.2}[2019/02/16 v2.2]
%%%%\ProvidesClass{jnlp_2.3}[2019/03/08 v2.3]
%%%%\ProvidesClass{jnlp_2.4}[2020/04/13 v2.4]
%%%%\ProvidesClass{jnlp_3.1}[2020/06/01 v3.1]
%%%%\ProvidesClass{jnlp_3.2}[2020/07/21 v3.2]
    \ProvidesClass{jnlp_3.3}[2020/11/16 v3.3]
%%%% based on {jarticle}[2002/04/09 v1.4 Standard pLaTeX class]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@landscape \@landscapefalse
\newif\if@restonecol
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@enablejfam \@enablejfamtrue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%\DeclareOption{b5paper}{\setcounter{@paper}{4}%
%%%%  \setlength\paperheight {257mm}
%%%%  \setlength\paperwidth  {182mm}}
  \setlength\paperheight {731pt}
  \setlength\paperwidth  {518pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{landscape}{\@landscapetrue
  \setlength\@tempdima{\paperheight}%
  \setlength\paperheight{\paperwidth}%
  \setlength\paperwidth{\@tempdima}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@japanese \@japanesetrue
\newif\if@other \@otherfalse
\newif\if@specialissue \@specialissuefalse
\DeclareOption{japanese}{\@japanesetrue}
\DeclareOption{english}{\@japanesefalse}
\DeclareOption{other}{\@othertrue}
\DeclareOption{specialissue}{\@specialissuetrue}
\newif\if@fontsizeplain \@fontsizeplaintrue
\newif\if@zinbunsize \@zinbunsizefalse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExecuteOptions{japanese,onecolumn,final}
\ProcessOptions\relax
%%%%\RequirePackage{jnlpbbl_1.1} %% jnlp_1.3a.cls, Defended against multiple loading
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareFontShape{JY1}{mc}{m}{n}{<->s*[1.039] jis}{}
\DeclareFontShape{JY1}{mc}{m}{it}{<->s*[1.039] jis}{}
\DeclareFontShape{JY1}{mc}{m}{sc}{<->s*[1.039] jis}{}
\DeclareFontShape{JY1}{gt}{m}{n}{<->s*[1.039] jisg}{}
\DeclareFontShape{JY1}{gt}{m}{it}{<->s*[1.039] jisg}{}
\DeclareFontShape{JY1}{gt}{m}{sc}{<->s*[1.039] jisg}{}
\DeclareFontShape{JT1}{mc}{m}{n}{<->s*[1.039] jis-v}{}
\DeclareFontShape{JT1}{mc}{m}{it}{<->s*[1.039] jis-v}{}
\DeclareFontShape{JT1}{mc}{m}{sc}{<->s*[1.039] jis-v}{}
\DeclareFontShape{JT1}{gt}{m}{n}{<->s*[1.039] jisg-v}{}
\DeclareFontShape{JT1}{gt}{m}{it}{<->s*[1.039] jisg-v}{}
\DeclareFontShape{JT1}{gt}{m}{sc}{<->s*[1.039] jisg-v}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%\input{jsize1\@ptsize.clo}
%%%% This is file `jsize10.clo',
%%%% \NeedsTeXFormat{pLaTeX2e}
%%%% \ProvidesFile{jsize10.clo}
%%%%  [2002/04/09 v1.4
%%%%  Standard pLaTeX file (size option)]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% honbun: 10pt, gyou-okuri=17pt
\renewcommand{\normalsize}{%
    \@setfontsize\normalsize\@xpt{17}%
  \abovedisplayskip 8.5\p@ \@plus8.5\p@ \@minus\z@
  \abovedisplayshortskip\abovedisplayskip
  \belowdisplayshortskip\abovedisplayskip
  \belowdisplayskip\abovedisplayskip
   \let\@listi\@listI}
\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% keywords, table, fig-caption: 9pt, gyouokuri=17pt
%%%% gyouokuri --> 13pt on jnlp_1.2b.cls
\newcommand{\small}{%
%%%%  \@setfontsize\small\@ixpt{17}%
      \@setfontsize\small\@ixpt{13}%
  \abovedisplayskip 8.5\p@ \@plus8.5\p@ \@minus\z@
  \abovedisplayshortskip\abovedisplayskip
  \belowdisplayshortskip\abovedisplayskip
  \def\@listi{\leftmargin\leftmargini
              \topsep \z@
              \parsep \z@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% header, footnote: 8pt, gyouokuri=10pt
\newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viiipt{10}%
  \abovedisplayskip 5\p@ \@plus5\p@ \@minus\z@
  \abovedisplayshortskip \abovedisplayskip
  \belowdisplayshortskip \abovedisplayskip
  \def\@listi{\leftmargin\leftmargini
              \topsep \z@
              \parsep \z@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
%%%% j-author, reference-title, section, subsection, biotile: 12pt, gyouokuri=17pt
\newcommand{\large}{\@setfontsize\large\@xiipt{17}}
%%%% j-title, e-title: 14pt, gyouokuri=21pt
\newcommand{\Large}{\@setfontsize\Large\@xivpt{21}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xviipt{34}}
\newcommand{\huge}{\@setfontsize\huge\@xxpt{34}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{34}}
%%%% issuename, subject: 11pt, gyookuri=17pt
\newcommand{\semilarge}{\@setfontsize\semilarge{11\p@}{34}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\headheight{8\p@}
\setlength\headsep{22\p@}
\setlength\topskip{1\Cht}
\setlength\footskip{30\p@}
\setlength\maxdepth{1\Cwd}
\setlength\textheight{33\Cvs}
%%%%\addtolength\textheight{1\Cwd} %%%% 1\Cwd not equal 10pt
    \addtolength\textheight{10\p@}
\@settopoint\textheight
\setlength\topmargin{57\p@}
\addtolength\topmargin{-1in}
\@settopoint\topmargin
\setlength\textwidth{420\p@}
\@settopoint\textwidth
\setlength\marginparsep{\z@}
\setlength\marginparpush{\z@}
\setlength\marginparwidth{\z@}
\@settopoint\marginparwidth
\setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-\textwidth}
  \setlength\oddsidemargin{.5\@tempdima}
  \addtolength\oddsidemargin{-1in}
\evensidemargin\oddsidemargin
\@settopoint\oddsidemargin % 1999.1.6
\@settopoint\evensidemargin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\footnotesep{7\p@}%%%% 0.7times(Strut-dimen) Baselineskip of Footnotesize
\setlength\@tempdima{1\Cvs}
%%%%  \addtolength\@tempdima{-1\Cht}
      \addtolength\@tempdima{-1\Cht}\addtolength\@tempdima{7\p@} %%%%jnlp_1.2c.cls
  \setlength{\skip\footins}{\@tempdima \@plus 1\Cvs \@minus \z@}
\setlength\floatsep    {17\p@}
\setlength\textfloatsep{2\@tempdima \@plus \@tempdima \@minus \@tempdima}
\setlength\intextsep   {2\@tempdima \@plus \@tempdima \@minus \@tempdima}
\setlength\dblfloatsep {17\p@}
\setlength\dbltextfloatsep{\@tempdima \@plus \@tempdima \@minus \@tempdima}
\setlength\@fptop{0\p@}
\setlength\@fpsep{17\p@}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{17\p@}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\partopsep{\z@}
\def\@listi{\leftmargin\leftmargini
  \parsep \z@
  \topsep \z@
  \itemsep \z@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  \z@
   \parsep  \z@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep \z@
   \parsep\z@
   \partopsep \z@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%%%%\endinput
%%
%% End of file `jsize10.clo'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\columnsep{20\p@}
\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{0\p@ \@plus \p@}
%%%%\setlength\parindent{1\Cwd} %%%% jnlp_1.2.cls
    \if@japanese
       \setlength\parindent{1\Cwd}
    \else
       \setlength\parindent{15pt}
    \fi
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{5}
\setcounter{dbltopnumber}{4}
\renewcommand{\topfraction}{.9}
\renewcommand{\bottomfraction}{.9}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.5}
\renewcommand{\dbltopfraction}{.9}
\renewcommand{\dblfloatpagefraction}{.5}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \let\@oddhead\@empty
   \def\@oddfoot{\reset@font\hfil\thepage\hfil}%
   \let\@evenhead\@empty
   \let\@evenfoot\@oddfoot}
\let\ps@jpl@in\ps@plain
\def\ps@myheadings{\let\ps@jpl@in\ps@plain%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\leftmark}%
  \def\@oddhead{{\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% pagestyle of `jnlp'
\if@japanese
 \def\headjnlp{自然言語処理　}
\else
 \def\headjnlp{Journal of Natural Language Processing\qquad}
\fi
\def\Volume#1{\gdef\@Volume{#1}}\let\@Volume\relax
\def\Number#1{\gdef\@Number{#1}}\let\@Number\relax
\def\Month#1{\gdef\@Month{#1}}  \let\@Month\relax
\def\Year#1{\gdef\@Year{#1}}    \let\@Year\relax
\def\Issuetitle#1{\gdef\@Issuetitle{#1}}    \let\@Issuetitle\relax
\def\headauthor#1{\gdef\@headauthor{#1}}\let\@headauthor\relax
\def\headtitle#1{\gdef\@headtitle{#1}}  \let\@headtitle\relax

\def\ps@mainpage{\let\ps@jpl@in\ps@mainpage
 \def\@VolumeX{%
	\@ifundefined{@Volume}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\Volume given}%
	\global\let\@Volume\@empty}{\@Volume}}
 \def\@NumberX{%
	\@ifundefined{@Number}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\Number given}%
	\global\let\@Number\@empty}{\@Number}}
 \def\@MonthX{%
	\@ifundefined{@Month}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\Month given}%
	\global\let\@Month\@empty}{\@Month}}
 \def\@YearX{%
	\@ifundefined{@Year}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\Year given}%
	\global\let\@Year\@empty}{\@Year}}
 \def\@headauthorX{%
	\@ifundefined{@headauthor}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\headauthor given}%
	\global\let\@headauthor\@empty}{\@headauthor}}
 \def\@headtitleX{%
	\@ifundefined{@headtitle}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\headtitle given}%
	\global\let\@headtitle\@empty}{\@headtitle}}
 \let\@mkboth\markboth
 \def\@evenhead{%
	\footnotesize\bfseries\headjnlp Vol.~\protect\@VolumeX\ No.~\protect\@NumberX
	\hfill\protect\@MonthX\ \protect\@YearX}
 \def\@evenfoot{\hfil\thepage\hfil}
 \def\@oddhead{\footnotesize\bfseries\protect\@headauthorX\hfill\protect\@headtitleX}
 \def\@oddfoot{\hfil\thepage\hfil}
}

\def\ps@frontpage{%
 \def\@IssuetitleX{%
	\@ifundefined{@Issuetitle}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\Issuetitle given}%
	\global\let\@Issuetitle\@empty}{\@Issuetitle}}
  \let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \def\@oddhead{\setlength{\fboxsep}{3pt}\setlength{\fboxrule}{0.25pt}\raisebox{6pt}[0pt][0pt]{\framebox{\hspace{0.5zw}\semilarge\bfseries\protect\@IssuetitleX\hspace{1zw}}}\hfil}
   \let\@oddfoot\@empty
   \let\@evenhead\@empty
   \let\@evenfoot\@oddfoot}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\p@thanks#1{\footnotemark
  \protected@xdef\@thanks{\@thanks
    \protect{\noindent$\m@th^\thefootnote$~#1\protect\par}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\jsubject#1{\gdef\@jsubject{#1}}
\def\jtitle#1{\gdef\@jtitle{#1}}
\def\jauthor#1{\long\gdef\@jauthor{#1}}
\long\def\jabstract#1{\gdef\@jabstract{#1}}
%%%%\def\jkeywords#1{\gdef\@jkeywords{\textgt{キーワード}：#1}}
    \def\jkeywords#1{\gdef\@jkeywords{\hangafter=1\hangindent=6zw\leavevmode\hbox to6zw{\textgt{キーワード}：\hfill}\unskip{#1}\par}}%%%% jnlp_1.3b.cls
\def\esubject#1{\gdef\@esubject{#1}}
\def\etitle#1{\gdef\@etitle{#1}}
\def\eauthor#1{\long\gdef\@eauthor{#1}}
\long\def\eabstract#1{\gdef\@eabstract{#1}}
%%%%\def\ekeywords#1{\gdef\@ekeywords{\textbf{Key Words}: #1}}
    \def\ekeywords#1{\gdef\@ekeywords{\hangafter=1\hangindent=60pt\leavevmode\hbox to60pt{\textbf{Key~Words}:\hfill}\unskip{\itshape #1}\par}}%%%% jnlp_1.2.cls
\def\@jsubject{\GenericWarning{}{JNLP Warning: No \noexpand\jsubject given}}
\def\@jtitle{\GenericWarning{}{JNLP Warning: No \noexpand\jtitle given}}
\def\@jauthor{\GenericWarning{}{JNLP Warning: No \noexpand\jauthor given}}
\def\@jabstract{\GenericWarning{}{JNLP Warning: No \noexpand\jabstract given}}
\def\@jkeywords{\GenericWarning{}{JNLP Warning: No \noexpand\jkeywords given}}
\def\@esubject{\GenericWarning{}{JNLP Warning: No \noexpand\esubject given}}
\def\@etitle{\GenericWarning{}{JNLP Warning: No \noexpand\etitle given}}
\def\@eauthor{\GenericWarning{}{JNLP Warning: No \noexpand\eauthor given}}
\def\@eabstract{\GenericWarning{}{JNLP Warning: No \noexpand\eabstract given}}
\def\@ekeywords{\GenericWarning{}{JNLP Warning: No \noexpand\ekeywords given}}

\newcommand{\maketitle}{\par
  \begingroup
%%%%\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
    \def\thefootnote{\ifcase\c@footnote\or
	*\or ** \or ***
	\else **** \fi}
    \def\@makefnmark{\hbox{$\m@th^{\@thefnmark}$}}%
    \newlength{\@FMwidth}\setlength{\@FMwidth}{14pt} %%%% jnlp_1.2.cls
    \addtolength{\@FMwidth}{\ifcase\c@affi@footnote 0pt\or
	0pt\or 0pt\or 0pt\or 3.8pt\or 7.6pt\or 11.4pt\or 15.2pt \fi}
%%%%  \long\def\@makefntext##1{\parindent 1zw\noindent
%%%%  \hbox to2zw{\hss$\m@th^{\@thefnmark}$}##1}
%%%% jnlp_1.2.cls
      \renewcommand\@makefntext[1]{%
      \advance\leftskip\@FMwidth
      \parindent 1zw\noindent\llap{\@makefnmark~}##1}
      \newpage
      \global\@topnum\z@
     \if@specialissue
       \thispagestyle{frontpage}\@thanks %%%% jnlp_2.1.cls
     \else
       \thispagestyle{empty}\@thanks
     \fi
%%%%  \@maketitle\vfill
      \@maketitle %%%% jnlp_1.2.cls
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\jsubject\relax
  \global\let\jtitle\relax
  \global\let\jauthor\relax
  \global\let\and\relax
  \global\let\jabstract\relax
  \global\let\jkeywords\relax
  \global\let\esubject\relax
  \global\let\etitle\relax
  \global\let\eauthor\relax
  \global\let\eabstract\relax
  \global\let\ekeywords\relax
  \global\let\@thanks\@empty
  \global\let\p@thanks\@empty
  \global\let\@jsubject\@empty
  \global\let\@jtitle\@empty
  \global\let\@jauthor\@empty
  \global\let\@jabstract\@empty
  \global\let\@jkeywords\@empty
  \global\let\@esubject\@empty
  \global\let\@etitle\@empty
  \global\let\@eauthor\@empty
  \global\let\@eabstract\@empty
  \global\let\@ekeywords\@empty
  \global\let\footnotemark\@empty
  \global\let\footnotetext\@empty
  }
  \if@other   %%% not Paper (other): jnlp_2.4.cls
   \if@japanese %%%% Japanese not Paper (other)
 \def\@maketitle{%
   \newpage%%%%\null
   \parindent\z@
   \semilarge{\bfseries \@jsubject} \par  %%%% jnlp_2.1.cls
   \vskip 8pt
   \setlength{\leftskip}{25pt}\setlength{\rightskip}{25pt}
   \begin{center}
   \let\footnote\thanks
     \Large\bfseries \@jtitle \par
     \vskip 8pt
%%%% \large \mkt@makejauthor \par %%%% jnlp_1.2.cls
     \large\mdseries \mkt@makejauthor \par
     \vskip 14pt
   \end{center}
 }
\else %%%% English not Paper
 \def\@maketitle{%
   \newpage%%%%\null
   \parindent\z@
   \semilarge\bfseries \@esubject \par  %%%% jnlp_2.1.cls
   \vskip 8pt
   \setlength{\leftskip}{25pt}\setlength{\rightskip}{25pt}
   \let\footnote\thanks
   \begin{center}
     \Large\bfseries \@etitle \mdseries\par
     \vskip 7pt
%%%% \normalsize\scshape \mkt@makeeauthor \par
   \normalsize\upshape \mkt@makeeauthor \par  %%%% jnlp_1.2.cls
   \vskip 14pt
  \end{center}
   %% modified  \normalsize\setlength{\baselineskip}{13.5pt}\@eabstract \par
  %% DELETE   \vskip 3pt
%%%% \small \@ekeywords \par\vfill
  %% DELETE   \small \@ekeywords \par\vskip 17pt %%%% jnlp_1.2.cls
 }
\fi
\else           %% Paper
  \if@japanese %%%% Japanese Paper
 \def\@maketitle{%
   \newpage%%%%\null
   \parindent\z@
   \semilarge{\bfseries \@jsubject} \par  %%%% jnlp_2.1.cls
   \vskip 8pt
   \setlength{\leftskip}{25pt}\setlength{\rightskip}{25pt}
   \begin{center}
   \let\footnote\thanks
     \Large\bfseries \@jtitle \par
     \vskip 8pt
%%%% \large \mkt@makejauthor \par %%%% jnlp_1.2.cls
     \large\mdseries \mkt@makejauthor \par
     \vskip 14pt
   \end{center}
     \normalsize\setlength{\baselineskip}{13.5pt}\@jabstract\par
     \vskip 2pt
     \small \@jkeywords \par
     \vskip 10pt
   \begin{center}
     \Large\bfseries \@etitle \mdseries\par
     \vskip 7pt
     \normalsize\scshape \mkt@makeeauthor \par
     \vskip 14pt
   \end{center}
     \normalsize\setlength{\baselineskip}{13.5pt}\@eabstract \par
     \vskip 3pt
%%%% \small \@ekeywords \par\vfill
     \small \@ekeywords \par\vskip 17pt %%%% jnlp_1.2.cls
 }
\else %%%% English Paper
 \def\@maketitle{%
   \newpage%%%%\null
   \parindent\z@
   \semilarge{\bfseries \@esubject} \par  %%%% jnlp_2.1.cls
   \vskip 8pt
   \setlength{\leftskip}{25pt}\setlength{\rightskip}{25pt}
   \let\footnote\thanks
   \begin{center}
     \Large\bfseries \@etitle \mdseries\par
     \vskip 7pt
%%%% \normalsize\scshape \mkt@makeeauthor \par
%%%% \normalsize\upshape \mkt@makeeauthor \par  %%%% jnlp_1.2.cls
     \normalsize\mdseries \mkt@makeeauthor \par  %%%% jnlp_2.3.cls
     \vskip 14pt
   \end{center}
     \normalsize\setlength{\baselineskip}{13.5pt}\@eabstract \par
     \vskip 3pt
%%%% \small \@ekeywords \par\vfill
     \small \@ekeywords \par\vskip 17pt %%%% jnlp_1.2.cls
 }
\fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\mkt@makejauthor{\leavevmode\let\mkt@and\relax\gdef\affi@thefnmark{}%
	\def\@thefnmark{\affi@thefnmark}%
	\expandafter\mkt@imakejauthor\@jauthor\and\@nil\and}
\def\mkt@imakejauthor#1\and#2\and{%
	\def\@tempa{#2}
	\ifx\@tempa\@nnil
		#1\m@th\@makefnmark\let\next\relax
	\else
		\def\@tempb{#1}\def\next{\mkt@iimakejauthor#2\and}%
	\fi\next}
\def\mkt@iimakejauthor#1\and{%
	\def\@tempa{#1}
	\ifx\@tempa\@nnil
		\mkt@and\gdef\affi@thefnmark{}{\@tempb}%
		\@makefnmark\let\next\relax
	\else
		\mkt@and{\@tempb}\let\mkt@and\mkt@jandmid
		\let\next\mkt@iimakejauthor
	\fi\def\@tempb{#1}\next}
\def\mkt@jandmid{\unskip\@makefnmark\gdef\affi@thefnmark{}\m@th{・}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\mkt@makeeauthor{\leavevmode\let\mkt@and\relax\gdef\affi@thefnmark{}
	\def\@thefnmark{\affi@thefnmark}%
	\expandafter\mkt@imakeeauthor\@eauthor\and\@nil\and}
\def\mkt@imakeeauthor#1\and#2\and{%
	\def\@tempa{#2}
	\ifx\@tempa\@nnil
		#1\m@th\@makefnmark\let\next\relax
	\else
		\def\@tempb{#1}\def\next{\mkt@iimakeeauthor#2\and}%
	\fi\next}
\def\mkt@iimakeeauthor#1\and{%
	\def\@tempa{#1}
	\ifx\@tempa\@nnil
		\unskip\@makefnmark\ {\textup{and}~}\gdef\affi@thefnmark{}{\@tempb}%
		\@makefnmark\let\next\relax
	\else
		\mkt@and{\@tempb}\let\mkt@and\mkt@eandmid
		\let\next\mkt@iimakeeauthor
	\fi\def\@tempb{#1}\next}
\def\mkt@eandmid{\unskip\@makefnmark\gdef\affi@thefnmark{}, }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{affi@footnote} \c@affi@footnote\z@
\def\affilabel{\begingroup
	\def\@mpfn{affi@footnote}\def\thempfn{\theaffi@footnote}%
	\affi@label}
\def\paffilabel#1#2#3{\begingroup\PF@adjustfnote
	\affi@label{#1}{現在\quad#2}{Presently with #3}}
\def\affi@label#1#2#3{\stepcounter{\@mpfn}%
	\@ifundefined{affi@r@#1}%
		{\expandafter\xdef\csname affi@r@#1\endcsname{\thempfn}}
		{\GenericWarning{}{JNLP Warning: Affiliation label `#1' multiply defined}}
	\let\affi@footnotetext\relax\let\\\relax
	\if@japanese
	  \setbox0\hbox{\ignorespaces #2\ignorespaces}%  %%%% jnlp_1.3d.cls
	  \ifdim\wd0>\z@
	   \if@other  \xdef\@thanks{\@thanks\affi@footnotetext{\thempfn}{#2}} %%%% jnlp_2.4.cls
	   \else
		\xdef\@thanks{\@thanks\affi@footnotetext{\thempfn}{#2, #3}}
	  \fi
	  \else
		\xdef\@thanks{\@thanks\affi@footnotetext{\thempfn}{#3}}
	  \fi
	\else
		\xdef\@thanks{\@thanks\affi@footnotetext{\thempfn}{#3}}
	\fi
	\endgroup}
\def\affiref#1{\@ifundefined{affi@r@#1}%
		{\GenericWarning{}{JNLP Warning: Affiliation reference `#1' undefined}%
			\xdef\affi@thefnmark{\affi@thefnmark?}}%
		{\xdef\affi@thefnmark{\affi@thefnmark
			\csname affi@r@#1\endcsname}}%
	\@ifnextchar\affiref{\xdef\affi@thefnmark{\affi@thefnmark,}}{\relax}}
\def\affi@footnotetext#1#2{{\def\@thefnmark{#1}\@footnotetext{#2}}}
\def\theaffi@footnote{\ifcase\c@affi@footnote\or
	\dagger\or \dagger\dagger\or \dagger{\dagger}\dagger\or
%%%%\dagger{\dagger\dagger}\dagger\else \dagger{\dagger{\dagger}\dagger}\dagger %%%% jnlp_1.2.cls
	\dagger{\dagger\dagger}\dagger\or \dagger{\dagger{\dagger}\dagger}\dagger\or
	\dagger\dagger\dagger\dagger\dagger\dagger\or
	\dagger\dagger\dagger\dagger\dagger\dagger\dagger
	\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%\setcounter{secnumdepth}{2} %%% jnlp_1.3c.cls
    \setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \thesubsection.\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{%
   \thesubsubsection.\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{%
   \theparagraph.\@arabic\c@subparagraph}
%%%% section: 12pt, left, 3gyoudori
%%%%\newcommand{\section}{\@startsection{section}{1}{\z@}%
%%%%   {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
%%%%   {.5\Cvs \@plus.3\Cvs}%
%%%%   {\reset@font\Large\bfseries}}
\newcommand{\section}{\par\addvspace{1.3\Cvs}%
  \@afterindenttrue
  \secdef\@section\@ssection}
 \def\@section[#1]#2{%
  \ifnum \c@secnumdepth >\z@
    \refstepcounter{section}%
    \addcontentsline{toc}{section}{%
       \thesection\hspace{1zw}#1}%
  \else
    \addcontentsline{toc}{section}{#1}%
  \fi
  {\parindent\z@\raggedright
   \interlinepenalty\@M\reset@font
   \ifnum \c@secnumdepth >\z@
%%%% \large\bfseries\thesection\hspace{12pt} %%%% jnlp_1.2.cls
     \large\bfseries\thesection\hspace{12pt}\ignorespaces
   \fi
   \large\bfseries#2\par}%
  \nobreak\vskip0.7\Cvs\@afterheading}
 \def\@ssection#1{{%
  \parindent\z@\raggedright
  \interlinepenalty\@M\reset@font
  \large\bfseries#1\par}%
  \nobreak\vskip0.7\Cvs\@afterheading}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {.9\Cvs \@plus.4\Cvs \@minus.2\Cvs}%
%%%%   {.1\Cvs}%
       {.1\Cvs \@minus0.1\Cvs}%  %%%% jnlp_1.3c.cls
   {\reset@font\large\bfseries}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
%%%%   {1\Cvs \@plus.5\Cvs \@minus.2\Cvs}%  %%%% jnlp_1.2.cls
%%%%   {\z@}%
   {.9\Cvs \@plus.4\Cvs \@minus.2\Cvs}%
%%%%   {.1\Cvs}%  %%%% jnlp_1.3c.cls
       {.1\Cvs \@minus0.1\Cvs}%
   {\reset@font\normalsize\bfseries}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
%%%%   {\z@}{\z@}{\reset@font\normalsize\bfseries}} %%%% jnlp_2.3.cls
       {\z@}{-10pt}{\reset@font\normalsize\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
%%%%   {\z@}{\z@}{\reset@font\normalsize\bfseries}} %%%% jnlp_2.3.cls
       {\z@}{-10pt}{\reset@font\normalsize\bfseries}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\appendix}{\par
    \if@japanese
       \section*{付録} %%%% jnlp_1.3a.cls, addaed appendix-name 
    \else
       \section*{Appendix}
    \fi
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand{\thesection}{\@Alph\c@section}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\leftmargini  {3\Cwd}
\setlength\leftmarginii {3\Cwd}
\setlength\leftmarginiii{3\Cwd}
\setlength\leftmarginiv {3\Cwd}
\setlength\leftmarginv  {3\Cwd}
\setlength\leftmarginvi {3\Cwd}
\setlength  \labelsep  {1\Cwd}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{(\theenumi)}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{(\theenumiii)}
\newcommand{\labelenumiv}{(\theenumiv)}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\renewenvironment{enumerate}
  {\ifnum \@enumdepth >\thr@@\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep\z@
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newcommand{\labelitemi}{\textbullet}
\newcommand{\labelitemii}{%
  \iftdir
     {\textcircled{~}}
  \else
     {\normalfont\bfseries\textendash}
  \fi
}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}
\renewenvironment{itemize}
  {\ifnum \@itemdepth >\thr@@\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep\z@
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -2zw%
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 2zw}%
           \item\relax}{\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1zw%
           \itemindent\listparindent
           \leftmargin 2zw%   %%%%2007/05/22 jmlp_1.3e.cls
           \rightmargin\z@
           \parsep\z@ \@plus\p@}%
           \item\relax}{\endlist}
\newenvironment{quote}
%%%%  {\list{}{\rightmargin\leftmargin}%  %%%%2007/05/22 jmlp_1.3e.cls
      {\list{}{\leftmargin 2zw%
               \rightmargin\z@}%
           \item\relax}{\endlist}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
%%%%\def\fnum@figure{\figurename~\thefigure} %%%% jnlp_1.2.cls
    \def\fnum@figure{\textbf{\figurename~\thefigure}}
\newenvironment{figure}
%%%%           {\@float{figure}}  %%%% jnlp_1.2.cls, jnlp_1.3e.cls
%%%%           {\setlength\abovecaptionskip{4.5\p@}\setlength\belowcaptionskip{0\p@}\@float{figure}} %%%% returned jnlp_3.3.cls
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
%%%%\def\fnum@table{\tablename~\thetable} %%%% jnlp_1.2.cls
    \def\fnum@table{\textbf{\tablename~\thetable}}
\newenvironment{table}
%%%%           {\@float{table}}   %%%% jnlp_1.2.cls
%%%%           {\setlength\abovecaptionskip{0\p@}\setlength\belowcaptionskip{8\p@}\@float{table}}  %%%% returned jnlp_3.3.cls
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
%%%%\setlength\abovecaptionskip{0\p@}
    \setlength\abovecaptionskip{8\p@}% jnlp_3.3.cls
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{\small%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\hskip1zw#2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\hskip1zw#2\relax\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\def \@floatboxreset{%  
        \reset@font
        \small       %%%% orginal: \normalsize
        \@setminipage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\arraycolsep{0.5zw}
\setlength\tabcolsep{0.5zw}
\setlength\arrayrulewidth{0.25\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{0.5zw}
\setlength\fboxrule{0.25\p@}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\theequation}{\@arabic\c@equation}
\if@enablejfam
  \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
  \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{3}
\newcommand{\@pnumwidth}{2zw}
\newcommand{\@tocrmarg}{3zw}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength\toclineskip{\z@}
\newdimen\@lnumwidth
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip\toclineskip \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@lnumwidth #3\relax
     \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}%
     \hfill\nobreak
     \hb@xt@\@pnumwidth{\hss\normalfont \normalcolor #5}%
     \par}%
  \fi}
\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
\@temptokena{\thepage}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}
\newcommand{\tableofcontents}{%
  \section*{\contentsname
%%%%    \@mkboth{\contentsname}{\contentsname}%
  }\@starttoc{toc}%
}
\newcommand*{\l@section}[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty{\@secpenalty}%
    \addvspace{\baselineskip}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\bfseries
      \setlength\@lnumwidth{2zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
    \endgroup
  \fi}
\newcommand*{\l@subsection}   {\@dottedtocline{2}{1zw}{2zw}}
\newcommand*{\l@subsubsection}{\@dottedtocline{3}{3zw}{3zw}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{6zw}{4zw}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{6zw}{4zw}}
\newcommand{\listoffigures}{%
    \section*{\listfigurename
%%%%  \@mkboth{\listfigurename}{\listfigurename}
	}%
  \@starttoc{lof}%
}
\newcommand*{\l@figure}{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand{\listoftables}{%
    \section*{\listtablename
%%%%  \@mkboth{\listtablename}{\listtablename}
	}%
  \@starttoc{lot}%
}
\let\l@table\l@figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% `thebibliography' environment defined `jnlpbbl.sty'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 2zw
   \twocolumn[\section*{\indexname}]%
%%%%   \@mkboth{\indexname}{\indexname}%
   \thispagestyle{jpl@in}\parindent\z@
   \parskip\z@ \relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand{\@idxitem}{\par\hangindent 4zw}
\newcommand{\subitem}{\@idxitem \hspace*{2zw}}
\newcommand{\subsubitem}{\@idxitem \hspace*{3zw}}
\newcommand{\indexspace}{\par \vskip 10\p@ \@plus5\p@ \@minus5\p@\relax}
\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
%%%%\newcommand\@makefntext[1]{\parindent 1zw
%%%%  \noindent\hbox to 2zw{\hss\@makefnmark}#1}
%%%% 'footnote' revised, jnlp_1.2.cls
\newcommand\@makefntext[1]{%
  \samepage%%%% jnlp_3.1.cls
  \advance\leftskip 14pt
  \parindent 1zw
  \noindent
  \llap{\@makefnmark~}#1}
%%%%\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}} %%%% jnlp_3.2.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%      Biography environment     %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\biotitle{\textgt{\large\biotitlename}\par}
%%%%\if@japanese
%%%% \def\@bioauthername#1{　\textgt{#1}：}
%%%%\else
%%%% \def\@bioauthername#1{\hspace{10pt}\textbf{#1}:~}
%%%%\fi
%%%%\long\def\bioauthor#1#2{\hangafter=1\hangindent=20pt\@bioauthername{#1}#2\par}
    \newcommand{\bioauthor}[3][：]{%   %%%%jnlp_1.3d.cls
	\if#1:\@japanesefalse\else\@japanesetrue\fi
	\if@japanese
%%%%	 \def\@bioauthername##1{　\textgt{##1}：}
	 \def\@bioauthername##1{　\textbf{##1}：} %%%% jnlp_2.2.cls
	\else
	 \def\@bioauthername##1{\hspace{10pt}\textbf{##1}:~}
	\fi
	\hangafter=1\hangindent=20pt\@bioauthername{#2}#3\par}
\newenvironment{biography}{%
 \parindent=\z@
 \vspace{\baselineskip}\par
 \biotitle
 \setlength{\leftskip}{10pt}\setlength{\rightskip}{50pt}%
 }{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%         Received Date          %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\MonthName#1{%
%%%%	\ifcase#1\or Jan.\or Feb.\or Mar.\or Apr.\or May\or %
%%%%	June\or July\or Aug.\or Sep.\or Oct.\or Nov.\or Dec.\else\fi}
	\ifcase#1\or January\or February\or March\or April\or May\or %%% jnlp_1.2.cls
	June\or July\or August\or September\or October\or November\or December\else\fi}
\if@japanese
 \def\received#1#2#3{\gdef\ra@received{（#1 年 #2 月 #3 日　受付）}}
 \def\revised#1#2#3{\gdef\ra@revised{（#1 年 #2 月 #3 日　再受付）}}
 \def\rerevised#1#2#3{\gdef\ra@rerevised{（#1 年 #2 月 #3 日　再々受付）}}
 \def\accepted#1#2#3{\gdef\ra@accepted{（#1 年 #2 月 #3 日　採録）}}
\else
 \def\received#1#2#3{\gdef\ra@received{(Received\ \MonthName{#2}~#3, #1)}}
 \def\revised#1#2#3{\gdef\ra@revised{(Revised\ \MonthName{#2}~#3, #1)}}
 \def\rerevised#1#2#3{\gdef\ra@rerevised{(Rerevised\ \MonthName{#2}~#3, #1)}}
 \def\accepted#1#2#3{\gdef\ra@accepted{(Accepted\ \MonthName{#2}~#3, #1)}}
\fi
\long\def\biodate{%
 \addvspace{0.5\Cvs}
 \begin{flushright}
 \setlength{\rightskip}{50pt}
%%%% \small\def\baselinestretch{0.8}\selectfont
     \small\selectfont %%%% jnlp_1.2c.cls
 \begin{tabular}{l}
  \@ifundefined{ra@received}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\received given}}%
	{\ra@received\\}
  \@ifundefined{ra@revised}{}{\ra@revised\\}
  \@ifundefined{ra@rerevised}{}{\ra@rerevised\\}
  \@ifundefined{ra@accepted}{%
	\GenericWarning{}{JNLP Warning: No \noexpand\accepted given}}%
	{\ra@accepted\\}
 \end{tabular}
\end{flushright}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Acknowledge
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\acknowledgment{\section*{\acknowledgtitle}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@japanese
 \newcommand{\contentsname}{目　次}
 \newcommand{\listfigurename}{図　目　次}
 \newcommand{\listtablename}{表　目　次}
 \newcommand{\refname}{参考文献}
 \newcommand{\indexname}{索　引}
 \newcommand{\figurename}{図}
 \newcommand{\tablename}{表}
 \newcommand{\biotitlename}{略歴}
 \newcommand{\acknowledgtitle}{謝　辞}
\else
 \newcommand{\contentsname}{Contents}
 \newcommand{\listfigurename}{List of Figures}
 \newcommand{\listtablename}{List of Tables}
%%%% \newcommand{\refname}{Reference} %%%% revised 2020.8.31
     \newcommand{\refname}{References}
 \newcommand{\indexname}{Index}
 \newcommand{\figurename}{Fig.~}
 \newcommand{\tablename}{Table}
 \newcommand{\biotitlename}{\relax}
%%%% \newcommand{\acknowledgtitle}{Acknowledgment} %%%% revised 2010.3.23
     \newcommand{\acknowledgtitle}{Acknowledgement}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% allowed `widow' and `orphan'
\clubpenalty0
\widowpenalty0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% jnlp_1.3a.cls
\newcommand{\Ketuji}[1]{%
	\lower0.15zw\hbox{\includegraphics[width=1zw]{%
	C:/usr/local/share/texmf-local/sakuji-eps/#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{mainpage}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
\else
  \onecolumn
\fi
\@twosidetrue
\@mparswitchtrue
\endinput
%%
%% End of file `jarticle.cls'.
%%%% End of file `jnlp.cls'
