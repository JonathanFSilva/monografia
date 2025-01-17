\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monografia}[2017/09/20]

% Repassa os parametros ao abntex2
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{%
    % -- opções da classe memoir --
    12pt,
    a4paper,
    sumario=abnt-6027-2012,
    % -- opções da classe abntex2 --
    chapter=TITLE,
    % section=TITLE,
    % subsection=TITLE,
    % subsubsection=TITLE,
    % -- opções do pacote babel --
    english,
    % french,
    % spanish,
    brazil,
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian, hyperpageref]{backref}       % Produzir índice nas referências
\RequirePackage{makeidx}                                % Produzir índice remissivo de palavras
\RequirePackage{chngcntr}
\usepackage{setspace}

% --------------------------------------------------------------------------------
% Configurações gerais
% --------------------------------------------------------------------------------

% Configurações do pacote backref usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define as listas de item compactas (sem espaçamento entre os itens)
\setlist{noitemsep, topsep=0pt, parsep=0pt, partopsep=0pt}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
        Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% Redefine títulos
\renewcommand{\folhaderostoname}{Folha de Rosto}
\renewcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
\addto\captionsbrazil{%
    % Ajusta nomes padrões do babel
    \renewcommand{\bibname}{REFER\^ENCIAS BIBLIOGR\'AFICAS}
    \renewcommand{\listadesiglasname}{LISTA DE ABREVIATURAS E SIGLAS}
    \renewcommand{\listadesimbolosname}{LISTA DE S\'IMBOLOS}
    \renewcommand{\listfigurename}{LISTA DE FIGURAS}
    \renewcommand{\listtablename}{LISTA DE TABELAS}
    % Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{SE{\c C}\~AO}
    \renewcommand{\subsectionautorefname}{SUBSE{\c C}\~AO}
    \renewcommand{\subsubsectionautorefname}{Subse{\c c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse{\c c}\~ao}
}
\newcommand{\listofquadrosname}{LISTA DE QUADROS}

% --------------------------------------------------------------------------------
% Comandos gerais
% --------------------------------------------------------------------------------

% Automatiza o processo de aspas
\newcommand{\aspas}[1]{''{#1}''}

% --------------------------------------------------------------------------------
% Comandos de dados
% --------------------------------------------------------------------------------

% Comandos de dados - nome autor
\providecommand{\imprimirnomeautor}{}
\newcommand{\nomeautor}[1]{\renewcommand{\imprimirnomeautor}{#1}}

% Comandos de dados - sobrenome autor
\providecommand{\imprimirsobrenomeautor}{}
\newcommand{\sobrenomeautor}[1]{\renewcommand{\imprimirsobrenomeautor}{#1}}

% Comandos de dados - titulo
\providecommand{\imprimirtitulotb}{}
\newcommand{\titulotb}[1]{\renewcommand{\imprimirtitulotb}{#1}}

% Comandos de dados - departamento
\providecommand{\imprimirdepartamento}{}
\newcommand{\departamento}[1]{\renewcommand{\imprimirdepartamento}{#1}}

% Comandos de dados - abreviatura
\providecommand{\imprimirabreviatura}{}
\newcommand{\abreviatura}[1]{\renewcommand{\imprimirabreviatura}{#1}}

% Comandos de dados - programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comandos de dados - subtítulo
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comandos de dados - grau
\providecommand{\imprimirgrau}{}
\newcommand{\grau}[1]{\renewcommand{\imprimirgrau}{#1}}

% Comandos de dados - data apresentacao
\providecommand{\imprimirdataapresentacao}{}
\newcommand{\dataapresentacao}[1]{\renewcommand{\imprimirdataapresentacao}{#1}}

% --------------------------------------------------------------------------------
% Estilo de elementos
% --------------------------------------------------------------------------------

% Elementos textuais
\renewcommand{\textual}{%
	
    %\pagenumbering{arabic} % Inicia a numeração em 1
% 	\setcounter{page}{14} 			%>>>INDICAR PAGINA DE INTRODUÇÂO
    \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
        \pagestyle{plain}
    }
    {%
		\pagestyle{simple}
        %\pagestyle{abntheadings}
        \aliaspagestyle{chapter}{abntchapfirst}
    }
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

%Elementos pós-textuais
\renewcommand{\postextual}{%
    \phantompart
    \renewcommand{\indexname}{\'Indice Remissivo}
}

% --------------------------------------------------------------------------------
% Objetos flutuantes
% --------------------------------------------------------------------------------

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    % \centering\small{Fonte: #1}
    \centering{\textbf{Fonte:} #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}

% --------------------------------------------------------------------------------
% Paragrafos
% --------------------------------------------------------------------------------

% Tamanho da identação do parágrafo
\setlength{\parindent}{1.5cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0cm}

% --------------------------------------------------------------------------------
% Fontes
% --------------------------------------------------------------------------------

% Redefinição de fontes
\renewcommand{\ABNTEXchapterfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% --------------------------------------------------------------------------------
% Sumário
% --------------------------------------------------------------------------------

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{0.0em \@plus\p@}

\renewcommand*{\cftsectionfont}{\normalfont}
\renewcommand*{\cftpartfont}{\normalfont}
\renewcommand*{\cftsubsectionfont}{\normalfont}
\renewcommand*{\cftsubsubsectionfont}{\normalfont}

% Alteração da indentação dos itens do sumário
\cftsetindents{section}{0pt}{20pt}
\cftsetindents{subsection}{0pt}{32pt}
\cftsetindents{subsubsection}{0pt}{42pt}

\newcommand{\sumario}
{	
		\setlength\cftpartnumwidth{\cftparagraphnumwidth}
		\setlength\cftchapternumwidth{\cftparagraphnumwidth}
		\setlength\cftsectionnumwidth{\cftparagraphnumwidth}
		\setlength\cftsubsectionnumwidth{\cftparagraphnumwidth}
		\setlength\cftsubsubsectionnumwidth{\cftparagraphnumwidth}
		\setlength\cftsectionindent{0pt}
		\setlength\cftsubsectionindent{0pt}
		\setlength\cftsubsubsectionindent{0pt}
		%\renewcommand{\cftpartfont}{\normalfont}
		%\renewcommand*{\cftsectionfont}{\bfseries}

		\thispagestyle{empty}
        \setlength{\baselineskip}{1.2\baselineskip} % Espacamento: 0.7
        \begin{center}
                \textbf{SUM\'ARIO} \\ [0.5\baselineskip]
        \end{center}
        \@starttoc{toc}
        \cleardoublepage
        \newpage
}

% --------------------------------------------------------------------------------
% Listas
% --------------------------------------------------------------------------------

% Cria a lista de quadros
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\setfloatadjustment{quadro}{\centering}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

\setfloatlocations{quadro}{hbtp}

% --------------------------------------------------------------------------------
% Dedicatória
% --------------------------------------------------------------------------------

\renewenvironment{dedicatoria}[1][]
{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{OnehalfSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}	
{%       
		    \end{OnehalfSpacing}
        \end{minipage}
    \end{flushright}
}

% --------------------------------------------------------------------------------
% Epigrafe
% --------------------------------------------------------------------------------

\renewenvironment{epigrafe}[1][]
{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{OnehalfSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{%
            \end{OnehalfSpacing}
        \end{minipage}
    \end{flushright}
}

\newenvironment{autorepigrafe}[1][]
{%
    \vspace*{-1,5cm}
		\begin{flushright}
            \begin{OnehalfSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{%
            \end{OnehalfSpacing}
        \end{flushright}
}

% --------------------------------------------------------------------------------
% Agradecimento
% --------------------------------------------------------------------------------

\newenvironment{agradecimento}{
    \newpage %%cria nova pagina
    \thispagestyle{empty}%%limpa estilo da pagina
    \normalsize %Muda tamanho da fonte
	\hspace{0.1 cm}
    \begin{center}
	    \textbf{AGRADECIMENTOS}
    \end{center}%Alinhamento centralizado
}{}

% --------------------------------------------------------------------------------
% Resumo
% --------------------------------------------------------------------------------

\newenvironment{RESUMO}{
    \newpage %%cria nova pagina
    \thispagestyle{empty}%%limpa estilo da pagina
    \normalsize %Muda tamanho da fonte
    % \begin{center}
	   % \textbf{RESUMO}
    % \end{center}%Alinhamento centralizado
}{}

% --------------------------------------------------------------------------------
% Abstract
% --------------------------------------------------------------------------------

\newenvironment{ABSTRACT}{
	\newpage %%cria nova pagina
    \thispagestyle{empty}%%limpa estilo da pagina
    \normalsize %Muda tamanho da fonte

    % \begin{center}
	   % \textbf{ABSTRACT}
    % \end{center}%Alinhamento centralizado
}{}

% --------------------------------------------------------------------------------
% Formatação das páginas
% --------------------------------------------------------------------------------

% Definicao das margens e espaçamentos
\setlrmarginsandblock{3cm}{2cm}{*} % externa / interna
\setulmarginsandblock{3cm}{2cm}{*} % superior / inferior
\checkandfixthelayout

% Recuo do paragrafo
\setlength{\parindent}{1.25cm} % normativo citatanto o valor de 1,25 qto 1,5cm
% sem espaco entre os paragrafos
\setlength{\parskip}{0cm}

% Espacamentos nos titulos:
% chapter
\setlength{\beforechapskip}{-\onelineskip} %com 0 nao funcionou
\setlength{\afterchapskip}{\onelineskip} % antes do titulo de capitulo

% --------------------------------------------------------------------------------
% Formatação das referências
% --------------------------------------------------------------------------------

\renewcommand*{\backreflastsep}{, }
\renewcommand*{\backreftwosep}{, }
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
  \ifcase #1 %
   \relax %
  \or
   \relax %
  \else
   \relax %
  \fi%
}