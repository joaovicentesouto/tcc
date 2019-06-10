    % % \renewcommand{\cftfigpresnum}{Figure }
%!TEX root = main.tex

% @Author: ismaelseidel
% @Date:   2017-03-16 16:37:06
% @Last Modified by:   ismaelseidel
% @Last Modified time: 2017-03-16 16:37:51

% --- Class structure: identification part
% ---

% version history:
% 0.1a: sent to Rafa and Luiz for first uses
% 0.1b: corrected the problem with empty coadvisor; now if a coadvisor is not named, the labels will not be printed
% 0.1c: corrected the wrong toc format; the problem was caused by an inconsistence between memoir (base of abntex2) and titlesec (formerly used to format the titles when printed)

% open issues:
% ?

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufxc}[2017/11/08 -- Defines a new UFSC class]
%The date should be given in the form ‘yyyy/mm/dd’ and must be present

\RequirePackage[T1]{fontenc}    % Selecao de codigos de fonte.
\RequirePackage[utf8]{inputenc}   % Codificacao do documento (conversão automática dos acentos)

%\usepackage[subfigure]{tocloft}



\RequirePackage{ifthen} %required to define booleans, such as the following ones:
%possible types of documents
\newboolean{tcc}
\setboolean{tcc}{false}
\newboolean{monografia-pos}
\setboolean{monografia-pos}{false}
\newboolean{mestrado}
\setboolean{mestrado}{false}
\newboolean{mestrado-profissional}
\setboolean{mestrado-profissional}{false}
\newboolean{doutorado}
\setboolean{doutorado}{false}
\newboolean{pos-doutorado}
\setboolean{pos-doutorado}{false}
%these will be used to set the cover:
\newboolean{capa}
\setboolean{capa}{false}
\newboolean{capa-completa}
\setboolean{capa-completa}{false}

\newboolean{usingGlossaries}
\setboolean{usingGlossaries}{false}

\newboolean{usingAlgorithm2e}
\setboolean{usingAlgorithm2e}{false}


%% abtex2-modelo-trabalho-academico.tex, v-1.9.6 laurocesar
%% Copyright 2012-2016 by abnTeX2 group at http://www.abntex.net.br/ 
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is the abnTeX2 team, led
%% by Lauro César Araujo. Further information are available on 
%% http://www.abntex.net.br/
%%
%% This work consists of the files abntex2-modelo-trabalho-academico.tex,
%% abntex2-modelo-include-comandos and abntex2-modelo-references.bib
%%





% --- Class structure: declaration of options part
% ---

%\DeclareOption{optionName}{optionCode}



\DeclareOption{tcc}{\setboolean{tcc}{true}}
\DeclareOption{monografia-pos}{\setboolean{monografia-pos}{true}}
\DeclareOption{mestrado}{\setboolean{mestrado}{true}}
\DeclareOption{mestrado-profissional}{\setboolean{mestrado-profissional}{true}}
\DeclareOption{doutorado}{\setboolean{doutorado}{true}}
\DeclareOption{pos-doutorado}{\setboolean{pos-doutorado}{true}}
\DeclareOption{capa}{\setboolean{capa}{true}}
\DeclareOption{capa-completa}{\setboolean{capa-completa}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\ProcessOptions\relax

% \RequirePackage{hyperref}

%\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}
% \pdfstringdefDisableCommands{\def\\{, }\def\and{; }}


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% abnTeX2: Modelo de Trabalho Academico (tese de doutorado, dissertacao de
% mestrado e trabalhos monograficos em geral) em conformidade com 
% ABNT NBR 14724:2011: Informacao e documentacao - Trabalhos academicos -
% Apresentacao
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
\LoadClass[
  % -- opções da classe memoir --
  %cleardoublepage=plain, %LaTeX Warning: Unused global option(s):    [cleardoublepage=plain].
  10pt,       % tamanho da fonte %should be 10.5
  openright,      % capítulos começam em pág ímpar (insere página vazia caso preciso)
  twoside,      % para impressão em recto e verso. Oposto a oneside
  a5paper,      % tamanho do papel. 
  % -- opções da classe abntex2 --
  chapter=TITLE,    % títulos de capítulos convertidos em letras maiúsculas
  section=TITLE,    % títulos de seções convertidos em letras maiúsculas
%   subsection=TITLE,  % títulos de subseções convertidos em letras maiúsculas
%   subsubsection=TITLE,% títulos de subsubseções convertidos em letras maiúsculas
  % -- opções do pacote babel --
     % o último idioma é o principal do documento
     %
  ]{abntex2}

% \setboolean{ABNTEXsumario-tradicional}{true}
% \setboolean{ABNTEXsumario-abnt-6027-2012}{false}

% \renewcommand{\tocprintchapter}{%
%     \addtocontents{toc}{\cftsetindents{chapter}{0em}{10cm}}}

%\settocdepth{chapter} %this specifies the maximum depth of the toc

%trying to work with table of contents
% memoir class seems not compatible with titlesec
\setlength{\cftbeforechapterskip}{0em} %removes the spacing between chapters in the toc
%\setlength{\cftchapterindent}{10cm}
% \setlength{\cftlastnumwidth}{1cm}

% \setboolean{ABNTEXsumario-abnt-6027-2012}{false}

% \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
%   \ClassWarning{ufxc}{Usando}
% }{}

%"cftsubsubsectionnumwidth"

% \newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{10mm}
% \addtolength{\cftlastnumwidth}{1em}

% \renewcommand{\tocprintchapternonum}{%
%     \addtocontents{toc}{\cftsetindents{chapter}{\cftchapternumwidth}{2em}}}

  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}


% \settocpreprocessor{part}{%
%   \let\tempf@rtoc\f@rtoc%
%   \def\f@rtoc{%
%   \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
%   }

  % \renewcommand{\tocpartapendices}{%
  %   \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
  %   \cftinserthook{toc}{A}}

% \newcommand{\partapendices}{%
% \tocpartapendices%
% \@ifstar{\appendixpage*}{\partpage}}


  %http://texdoc.net/texmf-dist/doc/latex/memoir/memman.pdf
  % see page 158


%ok, got a workaround in StackExchange :)
%https://tex.stackexchange.com/questions/156916/how-to-make-section-name-uppercase-in-toc
  \let\oldcontentsline\contentsline
\def\contentsline#1#2{%
  \expandafter\ifx\csname l@#1\endcsname\l@section
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
  {%
    \oldcontentsline{#1}{\MakeTextUppercase{#2}}%
  }{%
    \oldcontentsline{#1}{#2}%
  }%
}


\renewcommand{\cftsectionformatpnum}{\bfseries}

% {\cftKfont {{\cftKname \cftKpresnum SNUM\cftKaftersnum\hfil} \cftKaftersnumb TITLE}}
% {\cftKleader}{\cftKformatpnum{PAGE}}\cftKafterpnum\par

% {\cftKfont TITLE}{\cftKleader}{\cftKformatpnum{PAGE}}\cftKafterpnum\par

% \renewcommand{\l@section}[1]{\MakeTextUppercase{#1}}

% \settocpreprocessor{section}{%
%   \let\tempf@rtoc\f@rtoc%
%   \def\f@rtoc{%
%   \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
%   }

% \renewcommand{\cftlastnumwidth}{0em}

% \setlength{\cftchapterindent}{0em} 

% \captiondelimin{: }

% \renewcommand{\cftsubsectionnumwidth}{2em}
% \renewcommand{\cftsectionnumwidth}{2em}
% \renewcommand{\cftchapternumwidth}{1em}
% \setlength{\cftchapternumwidth}{-1cm}

\normalcaption
\renewcommand{\ABNTEXcaptiondelim}{: }

\renewcommand{\cftsectionfont}{\mdseries}


\setsecheadstyle{\normalfont\uppercase}
\setsubsecheadstyle{\bfseries}  






  % \renewcommand{\tocprintchapter}{%
  %   \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}

% {\texorpdfstring{\MakeTextUppercase{\bibname}}{\bibname}

% This is to undo these lines from abntex2:
% \hangcaption
% \newcommand{\ABNTEXcaptiondelim}{~\textendash~}


%\PassOptionsToClass{section=TITLE}{abntex2}

%Fonte sugerida: Times New Roman

  %brazil,
  %english 

%---------------------------------------------------------------------------
% % Carrega classe ABNTex, com padrão de página A5, fonte 10pt, frente e verso
% \LoadClass[cleardoublepage=plain,a5paper,10pt,twoside,capchap,capsec,openright,abntfigtabnum,espacosimples]{abnt}

%---------------------------------------------------------------------------
% Definicao da geometria da página
\RequirePackage[a5paper,inner=2.5cm,outer=1.5cm,top=2.0cm,bottom=1.5cm,head=0.7cm,foot=0.7cm]{geometry} %ufscThesis.cls
% Superior 2,0 cm
% – Inferior 1,5 cm
% – Interna 2,5 cm
% – Externa 1,5 cm
%Cabeçalho e Rodapé 0,7 cm; (head and foot)


%https://tex.stackexchange.com/questions/367821/table-of-contents-undefined-control-sequence
%https://github.com/abntex/abntex2/issues/180
\RequirePackage{relsize} 
%this must be placed after load class!!


%%%% color definitions
\RequirePackage{xcolor}        % Controle das cores
%http://www.bu.ufsc.br/design/GuiaRapido2013.pdf

%Para a definição das cores das capas dependendo do grau o trabalho representa, baseou-se na psicodinâmica das cores de Pedrosa (1999) que dispõe sobre o valor intrínseco de cada cor, onde foram valorizadas a significação e a temperatura e, também, nas cores oficiais da Universidade Federal de Santa Catarina.
%PEDROSA, Israel. Da cor à cor inexistente. 7. ed. Rio de Janeiro: Léo Christiano Editorial, 1999.

\definecolor{vermelhoTCC}{RGB}{218, 37, 29}
\definecolor{amareloMonografia}{RGB}{254, 227, 0}
\definecolor{verdeMestrado}{RGB}{0, 146, 6}
\definecolor{azulDoutorado}{RGB}{0, 56, 147}
\definecolor{cinzaPosDoc}{RGB}{114, 112, 111}

% \PassOptionsToClass{oldfontcommands}{memoir}

\RequirePackage[pdftex]{graphicx} % Inclusão de gráficos; Needed by the class to inser the UFSC logo
%\graphicspath{{images/}}
%\RequirePackage{subfigure}
% \usepackage{subcaption}

\RequirePackage{tikz}
\usetikzlibrary{calc, positioning}



% \renewcommand*{\chapterheadstartvskip}{\vspace*{1cm}}
% \renewcommand*{\chapterheadendvskip}{\vspace{2cm}}

% \renewcommand{\printchaptertitle}[1]{%
%     \chaptitlefont%
%     \ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupperifneeded{#1}}{%
%     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
%         \centering%
%         \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
%         \ABNTEXchapterupperifneeded{#1}%
%       }{% here
%         \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
%         \fbox{\parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{#1}}}}%
%      }    
%   }

% \def\printchaptertitle##1{%
%     \chaptitlefont%
%     \ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupperifneeded{##1}}{%
%     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
%         \centering%
%         \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
%         \ABNTEXchapterupperifneeded{##1}%
%       }{%
%         \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
%         \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{##1}}}%
%      }    
%   }


% \let\oldemph\emph
% \renewcommand{\emph}[1]{\textbf{\oldemph{#1}}}

%\usepackage{titlesec}

%copied from abntex to cope with the LoS and LoA title problems...
\renewcommand{\textual}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    \pagestyle{plain}%
  }{%else  
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 

  %%all of the above is from abntex... 
  %\makeatletter
  
  %commented because an incompatibility between titlesec and memoir
  % \titleformat{\chapter}
  %  {\normalfont\bfseries}{\thechapter}{1em}{\ABNTEXchapterupperifneeded}
  %  %\ABNTEXchapterupperifneeded{}
  %\titleformat{hcommandi}[hshapei]{hformati}{hlabeli}{hsepi}{hbeforei}[hafter i]

%https://tex.stackexchange.com/questions/408367/format-content-in-toc-when-using-memoir-titlesec
  \renewcommand*{\afterchaptertitle}{\vspace*{1em}}
  %\renewcommand*{\afterchaptertitle}{\par\nobreak\vspace*{-10pt}\hrulefill\vskip\afterchapskip}

  % \titlespacing{\chapter}{0pt}{1em}{1em}%

  % \titleformat{\section}
  % {\normalfont\bfseries}{\thesection}{1em}{\ABNTEXsectionupperifneeded}
  % %\ABNTEXsectionupperifneeded{#1}
  % %

  \ifthenelse{\boolean{usingGlossaries}}{%
    \glsresetall %reset dos acrônimos
  }{}%
  % \if@packageloaded{glossaries}{%
  %   \glsresetall %reset dos acrônimos
  % }{}%

  %\makeatother

}

%\titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before-code>}[<after-code>]

% \titleformat
% {\chapter} % command
% [display] % shape
% {\bfseries\Large\itshape} % format
% {Story No. \ \thechapter} % label
% {0.5ex} % sep
% {
%     \rule{\textwidth}{1pt}
%     \vspace{1ex}
%     \centering
% } % before-code
% [
% \vspace{-0.5ex}%
% \rule{\textwidth}{0.3pt}
% ] % after-code


%  \titleformat{\chapter}
%    {\normalfont\bfseries}{\thechapter}{1em}{\ABNTEXchapterupperifneeded{#1}}

% \titlespacing{\chapter}{0pt}{1em}{1em}%

% \titleformat{\section}
%   {\normalfont\bfseries}{\thesection}{1em}{\ABNTEXsectionupperifneeded{#1}}


\newcommand{\citeonline}[1]{\citeauthor*{#1} (\citeyear*{#1})}







%palavras chave
%https://tex.stackexchange.com/questions/155776/check-if-counter-exists
\newcommand*\ifcounter[1]{%
  \ifcsname c@#1\endcsname
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}

% \newcounter{ufxcPalavrasChaveCounter{brazil}}
% \newcounter{ufxcPalavrasChaveCounter{english}}

% %\addtokeywordslanguage{brazilian}{}
% \ifcounter{ufxcPalavrasChaveCounter{brazil}}{}{%
%   \newcounter{ufxcPalavrasChaveCounter{brazil}}
% }%


%https://en.wikibooks.org/wiki/TeX/gdef
\newcommand{\ufxcPalavraChave}[2]{%
  \expandafter\gdef\csname ufxcPalavraChave\expandafter{#2}\arabic{ufxcPalavrasChaveCounter\expandafter{#2}}\endcsname{#1}\relax%
  \stepcounter{ufxcPalavrasChaveCounter\expandafter{#2}}%
}


%\providecommand{\ufxcPalavrasChave}{}

\newcommand{\palavrasChave}[2][brazil]{
  \ifcounter{ufxcPalavrasChaveCounter\expandafter{#1}}{}{%
    \newcounter{ufxcPalavrasChaveCounter\expandafter{#1}}
  }%
  %\renewcommand{\ufxcPalavrasChave}{#1}
  \foreach \argtext in {#2} { %
    %\expandafter\ufxcPalavraChave\expandafter[brazil]\expandafter{\argtext}%    
    %\expandafter\ufxcPalavraChave\expandafter{\argtext}
    %\ufxcPalavraChave{#1}{teste} %this 'works'
    \expandafter\ufxcPalavraChave\expandafter{\argtext}{#1}
  }%
}


\newcounter{ufxcPalavrasChaveAtualCounter}

\newcommand{\keywordsname}{Palavras-chave}
\addto\captionsbrazil{% portugues-brasil
  \renewcommand{\keywordsname}{Palavras-chave}
}

\addto\captionsenglish{% ingles
  \renewcommand{\keywordsname}{Keywords}
}

\newcommand{\imprimirPalavrasChave}[1][\languagename]{\textbf{\keywordsname}: %\ufxcPalavrasChave{}
  \forloop{ufxcPalavrasChaveAtualCounter}{0}{\value{ufxcPalavrasChaveAtualCounter} < \value{ufxcPalavrasChaveCounter\expandafter{#1}}}%
  {%
    \expandafter\csname ufxcPalavraChave\expandafter{#1}\arabic{ufxcPalavrasChaveAtualCounter}\endcsname{}. %
  }%
}



%\NewDocumentEnvironment {environment} {arg spec}{start code} {end code}


%\newcommand{\resumoname}{Resumo}
\addto\captionsbrazil{% portugues-brasil
  \renewcommand{\resumoname}{Resumo}
}

\addto\captionsenglish{% ingles
  \renewcommand{\resumoname}{Abstract}
}

\addto\captionsspanish{%espanhol
  \renewcommand{\resumoname}{Resumen}
}

\addto\captionspolish{% polones
  \renewcommand{\resumoname}{Streszczenie}
}


\RequirePackage{xparse}
\RenewDocumentEnvironment{resumo}{O{\languagename} }{%
  \begin{otherlanguage}{#1}%
    \PRIVATEbookmarkthis{\resumoname}%
    \renewcommand{\abstractnamefont}{\chaptitlefont}%
    \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{\resumoname}}%
    \begin{abstract}%
}{%
  \\[\onelineskip]%
  \imprimirPalavrasChave{}%
  \end{abstract}\end{otherlanguage}\PRIVATEclearpageifneeded\ignorespacesafterend% 
}

% \RequirePackage{xparse}
% \RenewDocumentEnvironment{resumo}{O{\resumoname} O{\languagename} }{%
%   \PRIVATEbookmarkthis{#1}
%   \begin{otherlanguage*}{#2}
%    \renewcommand{\abstractnamefont}{\chaptitlefont}
%    \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
%    \begin{abstract}
% }{%
%   \imprimirPalavrasChave{}%
%    \end{abstract}\PRIVATEclearpageifneeded\ignorespacesafterend% 
%    \end{otherlanguage*}
% }


% %definition copied from abntex
% \renewenvironment{resumo}[1][\resumoname]{ % begin 
%   \PRIVATEbookmarkthis{#1}
%    \renewcommand{\abstractnamefont}{\chaptitlefont}
%    \renewcommand{\abstractname}{\ABNTEXchapterupperifneeded{#1}}
%    \begin{abstract}
% }{% end
%    \imprimirPalavrasChave{}%
%    \languagename
%    \end{abstract}\PRIVATEclearpageifneeded\ignorespacesafterend% 
% }



%\selectlanguage{english}



%ok, esse é um template da UFSC, logo, faz todo o sentido:
\instituicao{Universidade Federal de Santa Catarina}
%default!

\providecommand{\imprimirDia}{}
\providecommand{\imprimirMes}{}
\providecommand{\imprimirAno}{}
\providecommand{\imprimirData}{}

\renewcommand{\data}[3]{%
  \renewcommand{\imprimirDia}{#1}%
  \renewcommand{\imprimirMes}{#2}%
  \renewcommand{\imprimirAno}{#3}%
  \renewcommand{\imprimirData}{\imprimirDia{} de \imprimirMes{} de \imprimirAno{}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%                           definição de membros da banca                            %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3 Inserir após o nome da Instituição, entre parênteses, o termo Videoconferência para os membros da banca que participaram por
% videoconferência

\newcounter{membroBancaCounter}

\newcommand{\membroBanca}[3][]{%  %video  %nome %instituição
  \expandafter\newcommand\csname membroBancaVideo\arabic{membroBancaCounter}\endcsname{#1}%
  \expandafter\newcommand\csname membroBancaNome\arabic{membroBancaCounter}\endcsname{#2}%
  \expandafter\newcommand\csname membroBancaInst\arabic{membroBancaCounter}\endcsname{#3}%
  \stepcounter{membroBancaCounter}%
}

\RequirePackage{forloop}

\newcounter{membroBancaAtualCounter}

% \newcommand{\testBanca}{ %
%    \forloop{membroBancaAtualCounter}{0}{\value{membroBancaAtualCounter} < \value{membroBancaCounter}}
%    {%
%      \expandafter\csname membroBancaNome\arabic{membroBancaAtualCounter}\endcsname \\%
%      \expandafter\csname membroBancaInst\arabic{membroBancaAtualCounter}\endcsname \\%
%    }%
% }

\newcommand{\orientadorEstaNaBanca}{sim}
\newcommand{\orientadorNaBanca}[1]{\renewcommand{\orientadorEstaNaBanca}{#1}}


\newboolean{coorientadorEstaNaBanca}
\setboolean{coorientadorEstaNaBanca}{false}

% \newcommand{\coorientadorEstaNaBanca}{nao}
\newcommand{\coorientadorNaBanca}{\setboolean{coorientadorEstaNaBanca}{true}}

\RequirePackage{calc}

\newcounter{assinaturasCounter}
\newcommand{\imprimirAssinaturasBanca}{ %
   \ifthenelse{\equal{\orientadorEstaNaBanca}{sim}}
   {\stepcounter{assinaturasCounter}}{}
   %
   \ifthenelse{\boolean{coorientadorEstaNaBanca}}
   {\stepcounter{assinaturasCounter}}{}
   %
   \forloop{membroBancaAtualCounter}{0}{\value{membroBancaAtualCounter} < \value{membroBancaCounter}}
   {%
     \ifthenelse{\value{assinaturasCounter} = 3}{\newpage}{}
     \assinatura{%
     \expandafter\csname membroBancaNome\arabic{membroBancaAtualCounter}\endcsname \\%
     \ufxc@boundedOneLineText{\expandafter\csname membroBancaInst\arabic{membroBancaAtualCounter}\endcsname} %
     \ifthenelse{\equal{\expandafter\csname membroBancaVideo\arabic{membroBancaAtualCounter}\endcsname}{video}}{ (Videoconferência)}{%
     \ifthenelse{\equal{\expandafter\csname membroBancaVideo\arabic{membroBancaAtualCounter}\endcsname}{}}{}{
     \ClassWarning{ufxc}{Vc quis dizer video?}%
     }%
     }%
     % \ifthenelse{\isEmpty{\expandafter\csname membroBancaVideo\arabic{membroBancaAtualCounter}\endcsname}}%
     % {}{%
     %  (Videoconferência)
     % }%
     }%
     \stepcounter{assinaturasCounter}
     %
   }%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\providecommand{\@pequenoresumo}{}
\newcommand{\pequenoResumo}[1]{\renewcommand{\@pequenoresumo}{#1}}

\newcommand{\imprimirPequenoResumo}{\@pequenoresumo}

%\newcommand{\ABNTEXchapterfont}{\sffamily}
\renewcommand{\ABNTEXchapterfontsize}{\fontsize{10.5pt}{10.5pt}}
\renewcommand{\ABNTEXsectionfontsize}{\fontsize{10.5pt}{10.5pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%                            definição da folha de rosto                             %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\textofolhaderosto}[1][]{
  \imprimirtipotrabalho{} \caseGeneroTipoTrabalho{submetido}{submetida}{submetido(a)} ao \imprimirDepartamento{} em \imprimirCurso{} da \imprimirinstituicao{} para a obtenção do Grau de \imprimirGrauNome{}\imprimirAutorGenero{} em \imprimirCurso.
    \ifnotempty{#1}
    {\\[#1]} %
    {\\}%
    Orientador\ufxc@orientadorGender{}: \imprimirorientador{}
    \ifnotempty{\ufxc@thereIsCoorientador}{
    \ifnotempty{#1}
    {\\[#1]} %
    {\\}%
    Coorientador\ufxc@coorientadorGender{}: \imprimircoorientador{}}{}
    }


\renewcommand{\folhaderostocontent}{ \selectlanguage{brazil}
  \begin{center}

    \vspace*{1cm}
    {\large\imprimirautor}

    \vspace*{\fill}\vspace*{\fill}
    \begin{center}
      \begin{raggedright}
         \bfseries\Large\imprimirtitulo{}%
        \ifthenelse{\boolean{ufxcSubtitleDefined}}{:}{}%
      \end{raggedright}
      \ifthenelse{\boolean{ufxcSubtitleDefined}}{
        \\
        \begin{raggedright}
           \bfseries\Large\imprimirsubtitulo{}%
        \end{raggedright}\\[2\baselineskip]%
      }{%
      }%
    \end{center}
    \vspace*{\fill}

    \begin{adjustwidth}{5.5cm}{} \small
      \textofolhaderosto
    %   \imprimirtipotrabalho{} \caseGeneroTipoTrabalho{submetido}{submetida}{submetido(a)} ao \imprimirDepartamento{} em \imprimirCurso{} da \imprimirinstituicao{} para a obtenção do Grau de \imprimirGrauNome{}\imprimirAutorGenero{} em \imprimirCurso.
    % \\Orientador: \imprimirorientador
    % \ifnotempty{\imprimircoorientador}{\\Coorientador: \imprimircoorientador}{}
    \end{adjustwidth}

\vspace*{\fill}

    {\large\imprimirlocal}
    \par
    {\large\imprimirAno}
    \vspace*{1cm}

  \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Usefull links:
% https://pt.sharelatex.com/learn/Writing_your_own_package
% http://pgfplots.sourceforge.net/TeX-programming-notes.pdf
% http://tutex.tug.org/pracjourn/2005-4/hefferon/hefferon.pdf
% https://www.latex-project.org/help/documentation/clsguide.pdf


%Useful hooks:
% \AtBeginDocument and \AtEndDocument
%atbegindocuemtn is part of the preamble!

 \RequirePackage{etoolbox} % required to perform the patch pretocmd in the \printbibliography

\AtBeginDocument{
  \@ifpackageloaded{glossaries}{%
    \setboolean{usingGlossaries}{true}%
  }{}%
  
   \@ifpackageloaded{algorithm2e}{%
    \setboolean{usingAlgorithm2e}{true}
   }

   \@ifpackageloaded{biblatex}{%
    \pretocmd{\printbibliography}{%
      \let\ufxc@oldbibname\bibname%
      \renewcommand{\bibname}{\texorpdfstring{\MakeTextUppercase{\ufxc@oldbibname}}{\ufxc@oldbibname}}%
    }{}{}%
   }

   
}



% Configuração dos tipos de trabalhos disponíveis:

%Trabalho de Conclusão de Curso
%Monografia de Pós-graduação
%Dissertação de Mestrado
%Tese de Doutorado
%Relatório de Pós-doutorado

%tcc
%monografia-pos
%mestrado
%doutorado
%pos-doutorado

\newcommand{\caseTipoTrabalho}[7]
{%
   \ifthenelse{\boolean{tcc}}%
   {%
     #1%
   }{%
     \ifthenelse{\boolean{monografia-pos}}%
     {%
       #2%
     }{%
       \ifthenelse{\boolean{mestrado}}%
       {%
         #3%
       }{%
         \ifthenelse{\boolean{mestrado-profissional}}%
         {%
           #4%
         }{%
           \ifthenelse{\boolean{doutorado}}%
           {%
             #5%
           }{%
             \ifthenelse{\boolean{pos-doutorado}}%
             {%
               #6
             }{% default
               #7%
             }%
           }%
         }%
       }%
     }%
   }%
}%

\newcommand{\caseGeneroTipoTrabalho}[3]{%
  %#1 = masc; #2 = fem; #3 = ambos
  \caseTipoTrabalho{%
  %tcc: o trabalho -> masc
    #1%
  }{%
  %monografia-pos: a monografia -> fem
    #2%
  }{%
  %mestrado: a dissertação -> fem
    #2%
  }{%
  %mestrado-profissional: a dissertação -> fem
    #2
  }{%
  %doutorado: a tese -> fem
    #2%
  }{%
  %pos-doutorado: o relatório -> masc
    #1%
  }{%
  %default
    #3%
  }%
}%

% \caseTipoTrabalho{%
%   %tcc

%   }{%
%   %monografia-pos

%   }{%
%   %mestrado

%   }{%
%   %mestrado-profissional

%   }{%
%   %doutorado

%   }{%
%   %pos-doutorado

%   }{%
%   %default
%   }%

\caseTipoTrabalho{%
  %tcc
    \tipotrabalho{Trabalho de Conclusão de Curso}%
  }{%
  %monografia-pos
    \tipotrabalho{Monografia}%
  }{%
  %mestrado
    \tipotrabalho{Dissertação}%
  }{%
%   %mestrado-profissional
    \tipotrabalho{Dissertação}
  }{%
  %doutorado
    \tipotrabalho{Tese}%
  }{%
  %pos-doutorado
    \tipotrabalho{Relatório}%
  }{%
    \ClassWarning{ufxc}{I dont know this kind of work...}
  %default
  }%


% título concedido:
% bacharel
% licenciado / licenciado pleno
% bacharel e licenciado
% engenheiro
% especialista
% mestre
% doutor
% pós-doutor?


% \newcommand{\@UFSCError}{Errora}
% \newcommand{\@UFSCSetErrorMessage}[1]{\renewcommand{\@UFSCError}{#1}}

% \newcommand{\tipo}[1]{
%   \ifthenelse{\equal{#1}{tcc}}
%   {
%     \setboolean{tcc}{true}
%   }%
%   { %it is not TCC, what else can it be?
%     \ifthenelse{\equal{#1}{mestrado}}
%     {%
%       \setboolean{mestrado}{true} %
%     } %
%     { %it is not TCC nor Msc, what else?
%       \ifthenelse{\equal{#1}{doutorado}} %
%       {%
%         \setboolean{doutorado}{true} %
%       }%
%       { %it is not TCC, nor MsC, nor PhD, what else?
%         \ifthenelse{\equal{#1}{monografia-pos}} %
%         {%
%           \setboolean{monografia-pos}{true} %
%         }%
%         { % it is not TCC, nor MsC, nor PhD, nor Monography, is it PostDoc?
%           \ifthenelse{\equal{#1}{pos-doutorado}} %
%           { %
%             \setboolean{pos-doutorado}{true} %
%           } %
%           { %
%             %It is something that is not suported! I need to issue an error message!
%             %\@ifpackagewith{babel}{english}{\@UFSCSetErrorMessage{Oi}}
%             \PackageError{UFSCThesis3}{\@ifpackagewith{babel}{english}{\@UFSCError}{aa}}{help-text}%
%           }%
%         }%
%       }%
%     }%
%   }%
% }%

\newboolean{ufxcSubtitleDefined}
\setboolean{ufxcSubtitleDefined}{false}

\newcommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}\setboolean{ufxcSubtitleDefined}{true}}
%\subtitulo{Testing}


\newcommand{\imprimircoordenadorNome}{}
\newcommand{\imprimircoordenadorGenero}{}
\newcommand{\coordenador}[2][]{% gênero, nome 
  \renewcommand{\imprimircoordenadorNome}{#2}%
  \renewcommand{\imprimircoordenadorGenero}{#1}%
}


\newcommand{\imprimirGrauNome}{}
\newcommand{\grau}[1]{\renewcommand{\imprimirGrauNome}{#1}}

\newcommand{\imprimirAutorGenero}{}%i should put some guards on this
\newcommand{\autorgenero}[1]{\renewcommand{\imprimirAutorGenero}{#1}}

\newcommand{\imprimirgrau}{\imprimirGrauNome{}\imprimirAutorGenero{}}


\newcommand{\imprimirCurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimirCurso}{#1}}

\newcommand{\imprimirDepartamento}{} %não sei como chamar isso!!
\newcommand{\departamento}[1]{\renewcommand{\imprimirDepartamento}{#1}}

\newcommand{\ifnotempty}[3]{\ifthenelse{\not\equal{#1}{}}{#2}{#3}}
%emprestado ufscThesis


\newcommand{\campus}[1]{\cidade{#1}}


\providecommand{\ufxc@bairro}{Trindade}
\providecommand{\ufxc@cidade}{Florianópolis}
\providecommand{\ufxc@estado}{SC}
\newcommand{\bairro}[1]{\renewcommand{\ufxc@bairro}{#1}}
\newcommand{\cidade}[1]{\renewcommand{\ufxc@cidade}{#1}\local{#1}}
\newcommand{\estado}[1]{\renewcommand{\ufxc@estado}{#1}}
\newcommand{\imprimirBairro}{\ufxc@bairro}
\newcommand{\imprimirCidade}{\ufxc@cidade}
\newcommand{\imprimirEstado}{\ufxc@estado}



\providecommand{\ufxc@website}{www.inf.ufsc.br}%i'm not very sure from what should be this site...
\newcommand{\site}[1]{\renewcommand{\ufxc@website}{#1}}
\newcommand{\imprimirSite}{\ufxc@website{}}





% \RequirePackage{textcase}
% %\RequirePackage{tocstyle}


% \let\oldcontentsline\contentsline
% \def\contentsline#1#2{%
%   \expandafter\ifx\csname l@#1\endcsname\l@section
%     \expandafter\@firstoftwo
%   \else
%     \expandafter\@secondoftwo
%   \fi
%   {%
%     \oldcontentsline{#1}{\MakeTextUppercase{#2}}%
%   }{%
%     \oldcontentsline{#1}{#2}%
%   }%
% }


% informações do PDF
%\makeatletter
\hypersetup{
      %pagebackref=true,
    pdftitle={\@title}, 
    pdfauthor={\@author},
      pdfsubject={\imprimirpreambulo},
      pdfcreator={LaTeX with abnTeX2},
    pdfkeywords={abnt}{latex}{abntex}{abntex2}{trabalho acadêmico}, 
    colorlinks=true,          % false: boxed links; true: colored links
      linkcolor=black,           % color of internal links
      citecolor=black,           % color of links to bibliography
      filecolor=magenta,          % color of file links
    urlcolor=blue,
    bookmarksdepth=4
}
%\makeatother
% --- 


% ---
% Pacotes de citações
% ---
% \usepackage[brazilian,hyperpageref]{backref}   % Paginas com as citações na bibl
% \usepackage[alf]{abntex2cite} % Citações padrão ABNT

%\usepackage[leftmargin=0pt, rightmargin=0pt]{quoting}
\usepackage[thresholdtype=lines, threshold=3]{csquotes}
% Corpo: Todo o texto deve ser digitado em tamanho 10,5 pt inclusive títulos das seções e subseções.
% Citação com mais de três linhas, legendas de ilustrações e tabelas, notas de rodapé, natureza do trabalho,
% objetivo e nome da instituição a que é submetida e área de concentração, devem ser digitadas em tamanho:
% 9,5 pt. Citações com mais de três linhas devem ter um recuo de 4 cm a partir da margem esquerda.
%\AtBeginEnvironment{quote}{\small \addtolength\leftmargin{4cm} }

%\usepackage[autostyle]{csquotes}  
%\usepackage[vskip=0pt, leftmargin=4cm, rightmargin=0in]{quoting}
%\usepackage{etoolbox}
% \AtBeginEnvironment{quote}{\setlength{\parshape}{4cm} \small}
% \SetBlockEnvironment{quote}

\renewenvironment{quote}
  {\small\list{}{\rightmargin=0cm \leftmargin=4cm}%
   \item\relax}
  {\endlist}
%https://tex.stackexchange.com/questions/177186/how-can-i-change-the-margins-of-quote-environment

%\renewenvironment{quote}{\list{}{\rightmargin0pt\leftmargin4cm}\item\relax\small\singlespacing}{\endlist}

\SetCiteCommand{\cite}
%https://tex.stackexchange.com/questions/103445/how-to-quote-correctly-with-csquotes


%Espaçamento entrelinhas: simples
%\fontsize{10.5pt}{1cm}
%\renewcommand{\baselinestretch}{1}
\linespread{1.0}
%https://pt.sharelatex.com/learn/Paragraph_formatting#!#Line_spacing
% 1.0 single spacing
% 1.3 one-and-a-half spacing
% 1.6 double spacing

% ---
% Pacotes básicos 
% ---
%\usepackage{lmodern}     % Usa a fonte Latin Modern      


% Fonte: serifada ou semi serifada
% Fonte sugerida: Times New Roman

%\usepackage{uarial} %http://www.tug.org/fonts/getnonfreefonts/
%uarial for the cover
%\renewcommand{\familydefault}{\sfdefault}
\usepackage{newtxtext,newtxmath}

%The below one is sugested in the memoir manual:
%\usepackage{mathptmx} % Times New Roman

% \usepackage{mathpazo}
% \renewcommand\familydefault{\sfdefault}



\usepackage{lastpage}     % Usado pela Ficha catalográfica
\usepackage{indentfirst}    % Indenta o primeiro parágrafo de cada seção.

\usepackage{microtype}      % para melhorias de justificação
% ---
    
% ---
% Pacotes adicionais, usados apenas no âmbito do Modelo Canônico do abnteX2
% ---
\usepackage{lipsum}       % para geração de dummy text
% ---




% --- 
% Espaçamentos entre linhas e parágrafos ABNT:
% --- 



% --- 
% Espaçamentos entre linhas e parágrafos Norma UFSC (http://www.bu.ufsc.br/design/GuiaRapido2013.pdf):
% --- 
% Recuo de parágrafo (primeira linha): 1,0 cm
\setlength{\parindent}{1cm}

%``NÃO dê espaço entre os parágrafos. ''
\setlength{\parskip}{0pt}

% Isso é definido no modelo ABNTeX, mas ignorado pela USFC:
% Controle do espaçamento entre um parágrafo e outro:
%\setlength{\parskip}{0.2cm}  % tente também \onelineskip


\SetBlockThreshold{3} 
%\SetBlockThreshold defines the number of lines or words the block quotation facilities use as a threshold when determining whether a quotation should be typeset in inline or in display mode.
%\SetCiteCommand{\fullcite}





%ficha catalográfica:

% \ufxc@thereIsCoorientador

\providecommand{\ufxc@authorGender}{}
\providecommand{\ufxc@authorName}{}
\providecommand{\ufxc@authorSurname}{}

%name, surname
\renewcommand{\autor}[3][]{ \renewcommand{\ufxc@authorGender}{#1}%
                            \renewcommand{\ufxc@authorName}{#2}% 
                            \renewcommand{\ufxc@authorSurname}{#3}%
                          }%

\renewcommand{\imprimirautor}{\ufxc@authorName{} \ufxc@authorSurname{}}
\newcommand{\imprimirReversedAuthor}{\ufxc@authorSurname{}, \ufxc@authorName{}}

%title, name, surname, affiliation
\providecommand{\ufxc@orientadorGender}{}
\providecommand{\ufxc@orientadorTitle}{}
\providecommand{\ufxc@orientadorName}{}
\providecommand{\ufxc@orientadorSurname}{}
\providecommand{\ufxc@orientadorAffiliation}{}

\renewcommand{\orientador}[5][]{%
  \renewcommand{\ufxc@orientadorGender}{#1}% 
  \renewcommand{\ufxc@orientadorTitle}{#2}% 
  \renewcommand{\ufxc@orientadorName}{#3}% 
  \renewcommand{\ufxc@orientadorSurname}{#4}% 
  \renewcommand{\ufxc@orientadorAffiliation}{#5}% 
}%

%\renewcommand{\imprimirorientador}{\ufxc@orientadorTitle{} \ufxc@orientadorName{} \ufxc@orientadorSurname{}}
\renewcommand{\imprimirorientador}[1][sim]{%
  \ifthenelse{\equal{#1}{sim}}{\ufxc@orientadorTitle{} }{}%
  \ufxc@orientadorName{} \ufxc@orientadorSurname{}%
}%

\renewcommand{\imprimirorientadorRotulo}{Orientador}
\renewcommand{\imprimircoorientadorRotulo}{Coorientador}

\newcommand{\imprimirReversedorientador}{\ufxc@orientadorSurname{}, \ufxc@orientadorName{}}

%title, name, surname, affiliation
\providecommand{\ufxc@coorientadorGender}{}
\providecommand{\ufxc@coorientadorTitle}{}
\providecommand{\ufxc@coorientadorName}{}
\providecommand{\ufxc@coorientadorSurname}{}
\providecommand{\ufxc@coorientadorAffiliation}{}

\providecommand{\ufxc@thereIsCoorientador}{}

\renewcommand{\coorientador}[5][]{\renewcommand{\ufxc@coorientadorGender}{#1}%
                                  \renewcommand{\ufxc@coorientadorTitle}{#2}%
                                  \renewcommand{\ufxc@coorientadorName}{#3}% 
                                  \renewcommand{\ufxc@coorientadorSurname}{#4}%
                                  \renewcommand{\ufxc@coorientadorAffiliation}{#5}%
                                  \renewcommand{\ufxc@thereIsCoorientador}{sim}
                                  }%

\renewcommand{\imprimircoorientador}[1][sim]{%
  \ifthenelse{\equal{#1}{sim}}{\ufxc@coorientadorTitle{} }{}%
  \ufxc@coorientadorName{} \ufxc@coorientadorSurname{}%
}%
\newcommand{\imprimirReversedcoorientador}{\ufxc@coorientadorSurname{}, \ufxc@coorientadorName{}}


\providecommand{\ufxc@centro}{}

\newcommand{\centro}[1]{\renewcommand{\ufxc@centro}{#1}}
\newcommand{\imprimircentro}{\ufxc@centro}

% --- 
% Espaçamentos entre linhas e parágrafos 
% --- 

% % O tamanho do parágrafo é dado por:
% \setlength{\parindent}{1.3cm}

% % Controle do espaçamento entre um parágrafo e outro:
% \setlength{\parskip}{0.2cm}  % tente também \onelineskip


% from ufsc thesis
\renewcommand{\ABNTEXchapterfontsize}{\normalsize} % Fonte de capítulo
\renewcommand{\ABNTEXchapterfont}{\bfseries}

% %from BUUFSCthesis


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% % Variáveis identificadoras do trabalho
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% % 
% %---------------------------------------------------------------------------
% % Instituicao
% \renewcommand{\ABNTinstituicaodata}{Universidade Federal de Santa Catarina}
% \providecommand{\UFSCinstituicaogenerodata}{a}
% \renewcommand{\instituicao}[2][a]%
%     {\renewcommand{\ABNTinstituicaodata}{#2}\renewcommand{\UFSCinstituicaogenerodata}{#1}}

% \renewcommand{\instituicaoformat}[1]{\bfseries\MakeUppercase{#1}}



% %---------------------------------------------------------------------------
% % Departamento
% \providecommand{\UFSCdepartamentodata}{Departamento de Engenharia Mec\^anica}
% \providecommand{\UFSCdepartamentogenerodata}{o}
% \newcommand{\departamento}[2][o]%
%     {\renewcommand{\UFSCdepartamentodata}{#2}\renewcommand{\UFSCdepartamentogenerodata}{#1}}

% \newcommand{\departamentoformat}[1]{\bfseries\MakeUppercase{#1}}

% %---------------------------------------------------------------------------
% % Curso
% \providecommand{\UFSCcursodata}{Programa de P\'os-Gradua\c{c}\~ao em Engenharia Mec\^anica}
% \providecommand{\UFSCcursogenerodata}{o}
% \newcommand{\curso}[2][o]%
%     {\renewcommand{\UFSCcursodata}{#2}\renewcommand{\UFSCcursogenerodata}{#1}}

% %---------------------------------------------------------------------------
% % Tipo do documento
% \providecommand{\UFSCdocumentodata}{Tese}
% \providecommand{\UFSCdocumentogenerodata}{a}
% \newcommand{\documento}[2][a]%
%     {\renewcommand{\UFSCdocumentodata}{#2} \renewcommand{\UFSCdocumentogenerodata}{#1} \detgenerodoc{#2}}

% %---------------------------------------------------------------------------



%titulos

\newcommand{\capitulo}[1]{\chapter{#1}}
\newcommand{\secao}[1]{\section{#1}}
\newcommand{\subsecao}[1]{\subsection{#1}}



%%%%%%%%%%%%%%%%%%%%%%
% FICHA CATALOGRÁFICA
%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\cipname}{Ficha Catalográfica}
\addto\captionsbrazil{% portugues-brasil
  \renewcommand{\cipname}{Ficha Catalográfica}
}

\addto\captionsenglish{% ingles
  \renewcommand{\cipname}{CIP Record}
}

%CIP Record (Cataloging-in-Publication)
\newcommand{\imprimirFichaCatalografica}[2][brazil]{%
  \pdfbookmark[0]{\cipname}{cip}
  \begin{fichacatalografica}
    \IfFileExists{#2}{%then
      \includepdf{#2}
    }{%else
      \begin{otherlanguage}{#1}
      \vspace*{\fill}         % Posição vertical
      \begin{center}          % Minipage Centralizado
      Ficha gerada automaticamente pelo \LaTeX.\\[.25cm]
      \fbox{
      \begin{minipage}[c]{10cm}   % Largura 
      
      \begin{center}
        
      \vspace*{.5cm}
      %Sobrenome, Nome do autor
      \begin{minipage}[c]{7.5cm} \fontfamily{cmtt}\selectfont %\renewcommand*\rmdefault{ppl}
      \scriptsize %\renewcommand*\familydefault{\ttdefault} 
      \ttfamily %\selectfont
      \imprimirReversedAuthor

      \hspace{0.3cm} \imprimirtitulo{} \ifthenelse{\boolean{ufxcSubtitleDefined}}{: \imprimirsubtitulo{} }{}/ \imprimirautor{}; % \ufxc@orientadorGender{}
      orientador\ufxc@orientadorGender{}, \imprimirorientador[nao]{}\ifnotempty{\ufxc@thereIsCoorientador}{; coorientador\ufxc@coorientadorGender{}, \imprimircoorientador[nao]{}}{}, \imprimirAno{}. 

      \hspace{0.3cm} \pageref{LastPage} p. \\% : il. (algumas color.) ; 30 cm.\\
      

      %\hspace{0.3cm} \imprimirorientadorRotulo~\imprimirorientador\\
      
      \hspace{0.3cm}
      %\parbox[t]{\textwidth}{
      \imprimirtipotrabalho{} (%
      \caseTipoTrabalho{%
        %tcc
          graduação%
        }{%
        %monografia-pos
          especialização%
        }{%
        %mestrado
          mestrado%
        }{%
        %mestrado-profissional
          mestrado profissional%
        }{%
        %doutorado
          doutorado%
        }{%
        %pos-doutorado
          pos-doutorado%
        }{%
        %default
          ???%
          \ClassWarning{ufxc}{I dont know this type of work. I'm printed question marks in the CIP Record...}%
        }%
      )~--~\imprimirinstituicao{}, \imprimircentro{}, \imprimirDepartamento{} em \imprimirCurso{}, \imprimirCidade{}, \imprimirAno{}.\\[0.25cm]

      \hspace{0.3cm}
      \parbox[t]{\textwidth}{\indent Inclui referências}\\[0.25cm]

      \newcounter{ufxc-keywords}
      \newcounter{ufxc-romanwords}

      %\hspace{0.5cm}
        % 1. Palavra-chave1.
        % 2. Palavra-chave2. 
        % 2. Palavra-chave3. 
        % pelo visto o sistema da ufsc inclui o nome do curso como primeira 'palavra chave...'
        \stepcounter{ufxc-keywords}%
        \arabic{ufxc-keywords}. \imprimirCurso{}. %
        %
        \forloop{ufxcPalavrasChaveAtualCounter}{0}{\value{ufxcPalavrasChaveAtualCounter} < \value{ufxcPalavrasChaveCounter\expandafter{#1}}}%
        {%
          \stepcounter{ufxc-keywords}%
          \arabic{ufxc-keywords}. \expandafter\csname ufxcPalavraChave\expandafter{#1}\arabic{ufxcPalavrasChaveAtualCounter}\endcsname{}. %
        }%        
        \stepcounter{ufxc-romanwords}\Roman{ufxc-romanwords}. \imprimirReversedorientador{}. %
        % \ifnotempty{\imprimircoorientador[nao]{}}{\stepcounter{ufxc-romanwords}\Roman{ufxc-romanwords}. \imprimirReversedcoorientador.}{}
        \ifnotempty{\ufxc@thereIsCoorientador}{
        \stepcounter{ufxc-romanwords}\Roman{ufxc-romanwords}. \imprimirReversedcoorientador{}. %
        }{}%
        \stepcounter{ufxc-romanwords}\Roman{ufxc-romanwords}. \imprimirinstituicao. \imprimirDepartamento{} em \imprimirCurso.
        \stepcounter{ufxc-romanwords}\Roman{ufxc-romanwords}. Título. 
        \end{minipage}
        \end{center}
        \vspace*{1.5cm}
      \end{minipage}

      }
      \end{center}
      \end{otherlanguage}
    }
  \end{fichacatalografica}
}%


%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE APROVAÇÃO
%%%%%%%%%%%%%%%%%%%%%

% \RequirePackage{layouts}
% \RequirePackage{printlen}


\newlength{\ufxc@signatureMaxOneLineLength}
\setlength{\ufxc@signatureMaxOneLineLength}{.7\linewidth}

\newlength{\ufxc@temporaryTestLenght}


%http://texdoc.net/texmf-dist/doc/latex/base/ifthen.pdf
\newcommand{\ufxc@boundedOneLineText}[1]{%
  \settowidth{\ufxc@temporaryTestLenght}{#1}%
  \ifthenelse{\lengthtest{\ufxc@signatureMaxOneLineLength>\ufxc@temporaryTestLenght}}{%
    \mbox{#1}%
  }{%
    #1%
  }%
}%

\renewcommand{\ABNTEXsign}[1]{%
  \parbox[t]{\ufxc@signatureMaxOneLineLength}{\SingleSpacing\vspace*{\ABNTEXsignskip}\centering%
  \rule{\ABNTEXsignwidth}{\ABNTEXsignthickness}\\%
  \nopagebreak #1\par}%
}


\newcommand{\inserirFolhaDeAprovacao}[1]{%
  \IfFileExists{#1}{ % then
    \includepdf{#1} %
    }{ % else
      \begin{folhadeaprovacao}
      \setlength{\ABNTEXsignwidth}{.5\linewidth}
      \begin{center}
        {\ABNTEXchapterfont\large\imprimirautor}

        \vspace*{\fill}\vspace*{\fill}
        
        \ABNTEXchapterfont\bfseries\Large \imprimirtitulo{}\ifthenelse{\boolean{ufxcSubtitleDefined}}{: \imprimirsubtitulo{}}{}

      \end{center}
       
        \raggedright{%  used this trying to avoid hypenation
          \caseGeneroTipoTrabalho{Este}{Esta}{Este(a)} \imprimirtipotrabalho{} foi \caseGeneroTipoTrabalho{julgado}{julgada}{julgado(a)} \caseGeneroTipoTrabalho{adequado}{adequada}{adequado(a)} para obtenção do Título de ``\imprimirgrau{} em \imprimirCurso'', e \caseGeneroTipoTrabalho{aprovado}{aprovada}{aprovado(a)} em sua forma final pelo \imprimirDepartamento{} em \imprimirCurso{}.
        }%

        \begin{center}
          \imprimirlocal, \imprimirData.
        \end{center}

        \assinatura{\ufxc@boundedOneLineText{\imprimircoordenadorNome} \\ Coordenador\imprimircoordenadorGenero{} do Curso}
        ~\\

      \textbf{Banca Examinadora:}
            
      \ifthenelse{\equal{\orientadorEstaNaBanca}{sim}}
       { %
        \assinatura{\ufxc@boundedOneLineText{\imprimirorientador{}} \\ %
                    Orientador\ufxc@orientadorGender{} \\ %
                    \ufxc@boundedOneLineText{\ufxc@orientadorAffiliation{}} %
                  }%
       }{}
       %
       \ifthenelse{\boolean{coorientadorEstaNaBanca}}%
       {%
          \ifnotempty{\ufxc@thereIsCoorientador}%
          {% not empty
            \assinatura{%
              \ufxc@boundedOneLineText{\imprimircoorientador{}} \\%
              \ufxc@boundedOneLineText{Coorientador\ufxc@coorientadorGender{}} \\% 
              \ufxc@boundedOneLineText{\ufxc@coorientadorAffiliation{}}%
            } %                  
          }{% isEmpty
            \ClassWarning{ufxc}{You said that your co-advisor is in the evaluation comitee. However you did   not specified its name... I am going to skip it.}
          }
       }{}%

      \imprimirAssinaturasBanca{}      
    
    \end{folhadeaprovacao}
    }%
% ---  
}%


%%%%%%%%%%%%%%%%%%%%%
% LISTAS
%%%%%%%%%%%%%%%%%%%%%

%%% LISTA DE TABELAS
\newcommand{\inserirListaDeTabelas}{%
  \pdfbookmark[0]{\listtablename}{listot}%
  \listoftables*%
  \cleardoublepage%
}%

\newcommand{\insertListOfTables}{%
  \inserirListaDeTabelas{}%
}%
%%%%%%%%%%%%

%%% LISTA DE FIGURAS
\newcommand{\inserirListaDeFiguras}{%
  \pdfbookmark[0]{\listfigurename}{listof}%
  \listoffigures*%
  \cleardoublepage%
}%

\newcommand{\insertListOfFigures}{%
  \inserirListaDeFiguras{}%
}%

%%% LISTA DE ACRÔNIMOS
\newcommand{\inserirListaDeAcronimos}{%
  \pdfbookmark[0]{\listadesiglasname}{loc}%
  \printglossary[type=\acronymtype,title={\listadesiglasname}]%
  \cleardoublepage%  
}%

\newcommand{\insertListOfAcronyms}{\inserirListaDeAcronimos{}}%

%%% LISTA DE SÍMBOLOS
\newcommand{\inserirListaDeSimbolos}{%
  \pdfbookmark[0]{\listadesimbolosname}{los}%
  %\PRIVATEbookmarkthis{\listadesimbolosname}
  \printglossary[type=symbols,title={\listadesimbolosname}]%
  \cleardoublepage%  
}%

\newcommand{\insertListOfSymbols}{\inserirListaDeSimbolos{}}%




\providecommand{\listadealgoritmosname}{}

\addto\captionsbrazil{% portugues-brasil
  \renewcommand{\listadealgoritmosname}{Lista de Algoritmos}
}

\addto\captionsenglish{% ingles
  \renewcommand{\listadealgoritmosname}{List of Algorithms}
}

\addto\captionsbrazil{
  \renewcommand{\algorithmsname}{Algoritmo}
}

\addto\captionsenglish{
  \renewcommand{\algorithmsname}{Algorithm}
}

\providecommand{\algorithmsname}{}


\newcommand{\customListOfAlgorithms}{
  \ClassWarning{ufxc}{Custom list of algorithms. To create one, use renewcommand and overwrite the customListOfAlgorithms. }
}


\newboolean{overwriteAlgorithmLanguage}
\setboolean{overwriteAlgorithmLanguage}{true}

\newcommand{\inserirListaDeAlgoritmos}{%
  \ifthenelse{\boolean{usingAlgorithm2e}}{%
    \ifthenelse{\boolean{overwriteAlgorithmLanguage}}{
      \SetAlgorithmName{\algorithmsname}{algocf}{\listadealgoritmosname}
    }{
      \ClassInfo{ufxc}{You ask me to avoid to overwrite the defined language of algorithm2e. I'll respect your decision, which means I may not use the names defined by the selected language.}
    }%
    % isso é usado para formatar a lista de algoritmos da seguinte forma:
    %  Algorithm 1 - Short Caption ..........
    \let\oldlistofalgorithms\listofalgorithms
    \let\oldnumberline\numberline% Store \numberline
    \newcommand{\algnumberline}[1]{\algorithmcfname~##1 -- }
    \renewcommand{\listofalgorithms}{%
        \let\numberline\algnumberline% Update \numberline
        \oldlistofalgorithms
        \let\numberline\oldnumberline% Restore \numberline
    }
    % =====================================================
    %
    \pdfbookmark[0]{\listadealgoritmosname}{loa}%
    \listofalgorithms%    
    \cleardoublepage% 
  }{%
    \ClassWarning{ufxc}{You are not using package algorithm2e in your algorithms. I'm not sure how to make a list of algorithms, thus I will execute the command customListOfAlgorithms. I recommend the use of algorithm2e.}%
    \customListOfAlgorithms{}%
  }%
}%

\newcommand{\insertListOfAlgorithms}{\inserirListaDeAlgoritmos{}}%


%%% SUMARIO
\newcommand{\inserirSumario}{%
\renewcommand{\tocheadstart}{\ABNTEXchapterfont \normalsize}%
\pdfbookmark[0]{\contentsname}{toc}%
\tableofcontents*%
\cleardoublepage%  
}%

\RequirePackage{totcount}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                                     CAPAS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\RequirePackage{afterpage}
%\RequirePackage{xcolor}


\newcommand{\covername}{Capa}
\addto\captionsbrazil{% portugues-brasil
  \renewcommand{\covername}{Capa}
}

\addto\captionsenglish{% ingles
  \renewcommand{\covername}{Cover}
}

\newcommand{\completecovername}{Capa Completa}
\addto\captionsbrazil{% portugues-brasil
  \renewcommand{\completecovername}{Capa Completa}
}

\addto\captionsenglish{% ingles
  \renewcommand{\completecovername}{Complete Cover}
}


% 4 = current page.north east
% 5 = current page.center
% 6 = current page.south east

\newcommand{\capaContents}[6][white]
{
      %\node[color=green] at (0,0) {oi};
     %\addtocounter{abntex@bookmarkcounter}{1}

    %1. Nível do trabalho: fonte ARIAL 17 pt, cor branca, direita; barra superior padrão (1,5 cm de altura na cor preta);
    \node[color=white, text width=8cm, align=right, anchor=east] at ($(#4) + (-.5cm,-0.75cm)$) {\ABNTEXchapterfont\bfseries\LARGE #3};


    %\node[draw, fill=white, circle, minimum width=1cm] at (#5) {};



    \node[color=#1, text width=13cm, align=center] at (#5) {% draw can be used to see the limits
      \begin{raggedright}
        \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo{}%
        \ifthenelse{\boolean{ufxcSubtitleDefined}}{:}{}%
      \end{raggedright}
      \ifthenelse{\boolean{ufxcSubtitleDefined}}{
        \\
        \begin{raggedright}
          \ABNTEXchapterfont\bfseries\LARGE%
          \imprimirsubtitulo{}%
        \end{raggedright}\\[2\baselineskip]%
      }{%
        \\[2\baselineskip]
      }%
      
      
      %
      \ABNTEXchapterfont\bfseries\LARGE\imprimirautor

      %
    };

    
    %4. Nome da Universidade e Programa de Pós-Graduação: fonte 13 pt, direita, cor branca; 
    %6. Assinatura visual da UFSC: 1,5 cm altura, chapado branco, esquerda.

    \coordinate(southWest) at ($(#6)+(-15cm,0)$);

    \node[anchor=west] at ($(southWest) + (.5cm,1.25cm)$) {\includegraphics[height=1.5cm]{ufsc_pb.pdf}};
    \node[white, text width=10cm, align=right, anchor=east] at ($(#6) + (-.5cm,1.25cm)$) {\ABNTEXchapterfont\bfseries\large Universidade Federal de Santa Catarina\\ %
                                                                                    \imprimirDepartamento{} em \\ %
                                                                                    \imprimirCurso{} %
                                                                                    };
}






\newcommand{\capaColorida}[3][white]{ % corlabel central, cor fundo, label grau
  %\pretextualchapter{Cover}
  \PRIVATEbookmarkthis{\covername}
  \pagecolor{#2}\afterpage{\nopagecolor}
  \begin{tikzpicture}[remember picture, overlay]
    \draw[fill=black] (current page.north west) rectangle ($(current page.north east) + (0,-1.5cm)$);
    \draw[fill=black] (current page.south west) rectangle ($(current page.south east) + (0,2.5cm)$);
    % 4 = current page.north east
% 5 = current page.center
% 6 = current page.south east
    \capaContents[#1]{#2}{#3}{current page.north east}{current page.center}{current page.south east}
  \end{tikzpicture}

  \cleardoublepage
}


%\RequirePackage{bookcover}
%ver
%http://repositorios.cpai.unb.br/ctan/macros/latex/contrib/bookcover/bookcover.pdf



\renewcommand{\imprimircapa}{%
  \ifthenelse{\boolean{capa}}
  {%
    \hypersetup{pageanchor=false}
    \begingroup % https://tex.stackexchange.com/questions/207496/using-arial-font-for-just-one-page-and-mathpazo-for-rest %Fonte capa: Arial®;
    \fontfamily{phv}\selectfont
    %
    % Helvetica (Arial): \blindtext
    %
    \begin{capa}%
      \caseTipoTrabalho{%
        %tcc
        \capaColorida{vermelhoTCC}{Trabalho de Conclusão de Curso}
      }{%
        %monografia-pos
        \capaColorida[black]{amareloMonografia}{Monografia de Pós-graduação}
      }{%
        %mestrado
        \capaColorida{verdeMestrado}{Dissertação de Mestrado}
      }{%
        %mestrado-profissional (Possible BUG: qual a cor da capa?)
        \capaColorida{verdeMestrado}{Dissertação de Mestrado}
      }{%
        %doutorado
        \capaColorida{azulDoutorado}{Tese de Doutorado}
      }{%
        %pos-doutorado
        \capaColorida{cinzaPosDoc}{Relatório de Pós-doutorado} 
      }{%
      %default
        \ClassWarning{ufxc}{Unknow work type. The options are tcc, monografia-pos, mestrado, doutorado, pos-doutorado. I dont know how to create a cover for such kind of work...}
      }%

      \center
      \ABNTEXchapterfont\large\imprimirautor

      \vfill%
      \begin{center}%
      \begin{raggedright}%
        \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo{}%
        \ifthenelse{\boolean{ufxcSubtitleDefined}}{:}{}%
      \end{raggedright}
      \ifthenelse{\boolean{ufxcSubtitleDefined}}{%
        \\
        \begin{raggedright}
          \ABNTEXchapterfont\bfseries\LARGE%
          \imprimirsubtitulo{}%
        \end{raggedright}\\[2\baselineskip]%
      }{%
        \\[2\baselineskip]%
      }%
      \end{center}
      \vfill

      \large\imprimirlocal

      \large\imprimirData

      \vspace*{1cm}
    \end{capa}
    \endgroup
    \hypersetup{pageanchor=true} %https://tex.stackexchange.com/questions/18924/pdftex-warning-ext4-destination-with-the-same-identifier-nam-epage-1-has
  }{%
    %do nothing
  }%

  \ifthenelse{\boolean{capa-completa}}{%
    \imprimirCapaCompleta{}
  }{%
    %do nothing
  }%

}





\newcommand{\@tikzCapaCompletaColorida}[3][white]{% %corlabel central, cor fundo, label grau
  \pagecolor{#2}\afterpage{\nopagecolor}
    \begin{tikzpicture}[remember picture, overlay]
    \draw[fill=black] (current page.north west) rectangle ($(current page.north east) + (\msize,-1.5cm)$);
    \draw[fill=black] (current page.south west) rectangle ($(current page.south west) + (\msize,2.5cm)$);

    \coordinate(downLeftEar) at ($(current page.south west) + (4.5cm,0)$);
    \coordinate(upLeftEar) at ($(current page.north west) + (4.5cm,0)$);

    \coordinate(downLombadaLeft) at ($(downLeftEar) + (14.8cm,0)$);
    \coordinate(upLombadaLeft) at ($(upLeftEar) + (14.8cm,0)$);

    \coordinate(downLombadaRight) at ($(downLombadaLeft) + (\lombadasize,0)$);
    \coordinate(upLombadaRight) at ($(upLombadaLeft) + (\lombadasize,0)$);

    \coordinate(downEarRight) at ($(downLombadaRight) + (15cm,0)$);
    \coordinate(upEarRight) at ($(upLombadaRight) + (15cm,0)$);

    \draw[white] (downLeftEar) -- (upLeftEar);

    \draw[white] (downLombadaLeft) -- (upLombadaLeft);

    \draw[white] (downLombadaRight) -- (upLombadaRight);

    \draw[white] (downEarRight) -- (upEarRight);

    \coordinate(centerBackCover) at ($(upLeftEar)!0.5!(downLombadaLeft)$);

    \node[white, text width=14cm, align=center] at ($(centerBackCover)+(0,2.5cm)$) {\textofolhaderosto[.75cm]{}};

    \node[white, text width=14cm, align=center] at ($(centerBackCover)+(0,-6cm)$) {\imprimirlocal, \imprimirAno};

    \coordinate(centerLeftEar) at ($(current page.west)!.5!(upLeftEar)$); 


    \node[white, text width=4cm] (earInstit) at ($(centerLeftEar)+(0,2cm)$) {\imprimirinstituicao{}};

    \node[white, text width=4cm, below=.75cm of earInstit] (earCurso) {\imprimirDepartamento{} em \imprimirCurso{}};

    \node[white, text width=4cm, below=.75cm of earCurso] (earSite) {\imprimirSite{}};

    \node[white, text width=4cm, below=1cm of earSite] (earAddress) { Campus Universitário\\ % 
                                                                      \imprimirBairro{}\\ %
                                                                      \imprimirCidade{}-\imprimirEstado{} %
                                                                    }; %


    \coordinate(centerLombada) at ($(downLombadaLeft)!0.5!(upLombadaRight)$);

    \node[white, text width=15.5cm, rotate=-90, align=center] at (centerLombada) {\small \imprimirtitulo{} -- \imprimirautor};

    \ifdim\lombadasize<.7cm 
      \node[white, text width=.7cm, rotate=-90, align=center] at ($(centerLombada)+(0,9.75cm)$) {\small \imprimirAno};
    \else
      \node[white, text width=.7cm, align=center] at ($(centerLombada)+(0,9.75cm)$) {\small \imprimirAno};
    \fi


    \coordinate(downEarRightRight) at ($(downEarRight)+(5cm,0)$);
    \coordinate(centerRightEar) at ($(upEarRight)!.5!(downEarRightRight)$); 

    \node[white, text width=4cm, anchor=north] (earSmallAbs) at ($(centerRightEar)+(0,8cm)$) {%
                                                                                  \imprimirPequenoResumo{}\\[.5cm]
                                                                                  Orientador\ufxc@orientadorGender{}: \imprimirorientador{}\\
                                                                                  \ifnotempty{\ufxc@thereIsCoorientador}{Coorientador\ufxc@coorientadorGender{}: \imprimircoorientador{} %
                                                                                  }{}%
                                                                              };%

    \newlength{\initCapa}{\lombadasize+19.3cm}

    % 4 = current page.north east
    % 5 = current page.center
    \coordinate(coverCenter) at ($(downLombadaRight)!.5!(upEarRight)$);
    % 6 = current page.south east
    \begin{scope} %xshift=\initCapa
      \capaContents[white]{}{#3}{upEarRight}{coverCenter}{downEarRight}
    \end{scope}

  \end{tikzpicture}

}%


\newcommand{\imprimirCapaCompleta}{%
  \AtEndDocument{%
 
    \afterpage{%
     \hypersetup{pageanchor=false}
      \begingroup % https://tex.stackexchange.com/questions/207496/using-arial-font-for-just-one-page-and-mathpazo-for-rest %Fonte capa: Arial®;
      \fontfamily{phv}\selectfont
      %
      % Helvetica (Arial): \blindtext
      %
      \PRIVATEbookmarkthis{\completecovername{}}%
      \regtotcounter{lastsheet}%
%
      \newlength{\msize}%
      \newlength{\lombadasize}%

      \setlength{\msize}{\value{lastsheet}mm}%
      \setlength{\lombadasize}{0.075\msize}%
      \setlength{\msize}{\lombadasize+ 15cm + 5cm + 14.8cm + 4.5cm}%
%
      %\total{lastsheet}
      %(N * 150 )/2000
      %{150\value{lastsheet}/2000}
      %\uselengthunit{mm}\printlength{\msize}
%
      \pdfpagewidth \msize %
      \pdfpageheight 21cm %

      \caseTipoTrabalho{%
          %tcc
          \@tikzCapaCompletaColorida{vermelhoTCC}{Trabalho de {Conclusão} de Curso}%
        }{%
          %monografia-pos
          \@tikzCapaCompletaColorida[black]{amareloMonografia}{Monografia de Pós-graduação}%
        }{%
          %mestrado
          \@tikzCapaCompletaColorida{verdeMestrado}{Dissertação de Mestrado}%
        }{%
          %mestrado-profissional
          \@tikzCapaCompletaColorida{verdeMestrado}{Dissertação de Mestrado}%
        }{%
          %doutorado
          \@tikzCapaCompletaColorida{azulDoutorado}{Tese de Doutorado}%
        }{%
          %pos-doutorado
          \@tikzCapaCompletaColorida{cinzaPosDoc}{Relatório de Pós-doutorado}%
        }{%
        %default
          \ClassWarning{ufxc}{Unknow work type. The options are tcc, monografia-pos, mestrado, doutorado, pos-doutorado. I dont know how to create a complete cover for such kind of work...}%
        }%
%
      \clearpage%
      \restoregeometry%
    \endgroup
    \hypersetup{pageanchor=true} %https://tex.stackexchange.com/questions/18924/pdftex-warning-ext4-destination-with-the-same-identifier-nam-epage-1-has
    } % end of \afterpage{...}
  % ... still more material?
  } % end of  \AtEndDocument
}%