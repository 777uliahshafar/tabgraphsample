% Simple Article
% Integrated article template with simple for make4ht
% LaTeX Class
% Version 1.0 (10/11/20)
%
% This class originates by:
% Vel and  Nicolas Diaz
%
% Authors:
% Muhammad Uliah Shafar
%
%
% Free License:
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{timeline}[2020/11/10 Simart Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class


% \usepackage[square, numbers, comma, sort & compress]{natbib}
\usepackage[table]{xcolor}
\usepackage{multirow}
\usepackage{rotating}

\newcommand*\MonthLetters{SONDJFMAMJJA}
\newcommand*\NumMonths{28}
\newcommand*\YearMonths{4,12,12,}
\newcommand*\FirstYear{2024}


% Put this upside tikz package if there any
\makeatletter
\newcommand*\YearHeadRow{%
	\expandafter\TL@year@head\number\numexpr\FirstYear\expandafter\relax\expandafter\@nil\YearMonths\@nil
}
\def\TL@year@head#1\@nil#2,#3\@nil{%
	&\multicolumn{#2}{c|}{#1}%
	\ifx\\#3\\\else
		\TL@after@fi\TL@year@head\number\numexpr#1+1\relax\@nil#3\@nil
	\fi
}
\newcommand*\YearMonthSep[1]{%
	\cline{\numexpr#1+1\relax-\numexpr#1+\NumMonths\relax}%
}
\newcommand*\MonthHeadRow{%
	\expandafter\TL@month@head\expandafter\@ne\expandafter\@nil\MonthLetters\@nil
}
\def\TL@month@head#1\@nil#2#3\@nil{%
	&#2%
	\ifnum\NumMonths>#1 %
		\TL@after@fi\TL@month@head\number\numexpr#1+1\relax\@nil#3#2\@nil
	\fi
}
\newcount\TL@block@first
\newcount\TL@block@last
\newcommand*\NewBlock[3]{%
	\xglobal\colorlet{TL@block}{#1}%
	\global\TL@block@first\numexpr#2-1\relax
	\global\TL@block@last\numexpr#3+1\relax
	\ignorespaces
}
\newcounter{TL@group}
\newcounter{TL@task}[TL@group]
\renewcommand*\theTL@task{\theTL@group.\arabic{TL@task}}
\newcommand*\Task[1]{%
	\stepcounter{TL@task}%
	\theTL@task&#1%
	\TL@cell\@ne
	\\\hline
}
\newcommand*\NewGroup{%
	\stepcounter{TL@group}%
}
\def\TL@cell#1{%
	&%
	\ifnum#1>\TL@block@first
		\ifnum#1<\TL@block@last
			\cellcolor{TL@block}%
		\fi
	\fi
	\ifnum\NumMonths>#1 %
		\expandafter\TL@cell\expandafter{\number\numexpr#1+1\expandafter}%
	\fi
}
\def\TL@after@fi#1\fi{\fi#1}
\makeatother






