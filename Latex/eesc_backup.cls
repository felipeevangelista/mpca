%% eesc.cls, v1.0 athila
%% Copyright 2013 by Athila e Monaro
%%
%% Este trabalho � uma adequa��o das normas de disserta��es e teses
%% da Universidade de S�o Paulo - USP de acordo com a Norma ABNT
%%
%%
%% Quaisquer d�vidas favor enviar e-mail para:
%%
%% athila.uno@gmail.com ou
%% renato.monaro@gmail.com
%%

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% eesc: Modelo de Trabalho Acad�mico (tese de doutorado, disserta��o de
% mestrado e trabalhos monogr�ficos em geral) em conformidade com 
% ABNT NBR 14724:2011. Esta classe estende as funcionalidades da classe
% abnTeX2 elaborada de forma a adequar os par�metros exigidos pelas 
% normas USP e do departamento de el�trica da Escola de Engenharia 
% de S�o Carlos - USP.
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

%========================================================================
% Identifica��o
%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eesc}[2013/02/18 v1.0 Classe Tese EESC - Teses Escola de Engenharia de S�o Carlos]



%========================================================================
% Declara��o de op��es
%========================================================================
% Op��es:
% 	tesedr:     Formata documento para tese de doutorado
%	qualidr:    Formata documento para qualifica��o de doutorado
% 	dissertmst: Formata documento para disserta��o de mestrado
% 	qualimst:   Formata documento para qualifica��o de mestrado
% -----------------------------------------------------------------------
\DeclareOption{tesedr}{
\def\@tipotrabalho{Tese de doutorado}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{qualidr}{
\def\@tipotrabalho{Pr�-Projeto de Doutorado}
\def\@worktype{Ph.D. Qualifying}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{dissertmst}{
\def\@tipotrabalho{Tese de mestrado}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{disserta��o}
}

\DeclareOption{qualimst}{
\def\@tipotrabalho{Qualifica��o de mestrado}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{disserta��o}
}

\ProcessOptions\relax

%=========================================================================
% Heran�a da classe `abntex2' e inclus�o de pacotes e arquivos necess�rios
%=========================================================================
\LoadClass[a4paper,12pt,oneside]{abntex2}

%=========================================================================
% Heran�a da classe `abntex2' e inclus�o de pacotes e arquivos necess�rios
%=========================================================================
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[num,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	% Cita��es padr�o ABNT
\RequirePackage{color}	% Controle das cores
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}

%\renewcommand{\citebrackets}[2]{\def\citeopen{#1}\def\citeclose{#2}}
%\renewcommand{\setcitebrackets}{\citebrackets[]}

\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

\newsubfloat{figure}






% ---
% Configura��es de apar�ncia do PDF final

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informa��es do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
		%bookmarks=true,         		% show bookmarks bar?
		pdftitle={\imprimirtitulo}, 
		pdfauthor={\imprimirautor},
    	pdfsubject={\imprimirpreambulo},
		pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	    pdfproducer={LaTeX with abnTeX2}, 	% producer of the document
	    pdfcreator={\imprimirautor},
    	colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=black,
		bookmarksdepth=4
}
% ---
\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

% Comandos de dados - t�tulo do documento em portugu�s e ingl�s
\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

% Comandos de dados - autor e autorbib
\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
\renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}}

% --------------------------------
% Defini��o Geral

\newcommand{\arquivofichacatalografica}{}
\newcommand{\inserirfichacatalografica}[1]{\renewcommand{\arquivofichacatalografica}{#1}}

\newcommand{\arquivofolhaaprovacao}{}
\newcommand{\inserirfolhaaprovacao}[1]{\renewcommand{\arquivofolhaaprovacao}{#1}}

\renewcommand{\maketitle}{%
	% Capa
	\imprimircapa

	% Ficha catalogr�fica
	\ifthenelse{\not\equal{\arquivofichacatalografica}{}}
	{
		\imprimirfolhaderosto*{} 
		\begin{fichacatalografica}
			\includepdf[pages={1}]{\arquivofichacatalografica}
		\end{fichacatalografica}
	}
	{
		\imprimirfolhaderosto{}
	}
	
	% Folha de aprova��o
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
	{
		\begin{folhadeaprovacao}
		 	\includepdf[pages={1}]{\arquivofolhaaprovacao}
		\end{folhadeaprovacao}
	}
	{
	}
}

%========================================================================
% Defini��o da capa, folha de rosto e folha de aprova��o.
%========================================================================
% --- Defini��es de comprimento
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}

\instituicao
{%
	Universidade de Bras�lia--UnB
	\par
	Instituto de Ci�ncias Exatas
	\par
	Departamento de Engenharia El�trica
	\par
	Programa de P�s-Gradua��o em Engenharia El�trica
}

\preambulo{
	\@tipotrabalho~apresentado ao Programa de P�s-Gradua��o em Engenharia El�trica do Departamento de Engenharia El�trica da Universidade de Bras�lia.
}

% ---
% Impress�o da Capa
\renewcommand{\imprimircapa}{%
	\thispagestyle{empty}
	\noindent
  	\begin{capa}%
    	\center
    	\parbox[b]{\textwidth}
	{
		\centering
		\vbox to \titlepagewinvoffset
		{
			\scshape\imprimirinstituicao
			\vfill
			\@formataautorcapa
			\@formatatitulocapa
		}
	}
	
	\vfill
  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
    
  	\end{capa}
}

\def\@formataautorcapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
				{\Large\textbf{\imprimirautor}}
      		\vspace*{\fill}
    		}
   	}

}

\def\@formatatitulocapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
      			{\Large{\textbf{\imprimirtitulo}}\par}
			\vspace*{\fill}
    		}
   	}

}
% ---

% ---
% Conteudo padrao da Folha de Rosto

% Comandos de dados - �rea de concentra��o
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}{Linha de Pesquisa: #1}}

\makeatletter

\renewcommand{\folhaderostocontent}{


\newlength{\tampar}
\setlength{\tampar}{0.5\textwidth}
\newlength{\tamconcetracao}
\settowidth{\tamconcetracao}{\imprimirareaconcentracao}
\newlength{\tamorientador}
\settowidth{\tamorientador}{\imprimirorientadorRotulo~\imprimirorientador}
\newlength{\tamcoorientador}
\settowidth{\tamcoorientador}{\imprimircoorientadorRotulo~\imprimircoorientador}

\ifthenelse{\lengthtest{\tamconcetracao > \tampar}}{\setlength{\tampar}{\the\tamconcetracao}}{}
\ifthenelse{\lengthtest{\tamorientador>\tampar}}{\setlength{\tampar}{\the\tamorientador}}{}
\ifthenelse{\lengthtest{\tamcoorientador>\tampar}}{\setlength{\tampar}{\the\tamcoorientador}}{}


  \begin{center}

	
    \@formataautorcapa

    \@formatatitulocapa

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
  		\hspace*{\fill}
  		\makebox[\tampar][l]
  		{%
    			\parbox[b]{\tampar}
    			{
    				\imprimirpreambulo\\
    				\par\imprimirareaconcentracao\\

    {\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    			}
    		}
    		\vfill
    }%

  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
	% Folha de aprova��o
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
	{
		\scriptsize\textbf{}
	}
	{
	}
  \end{center}
}
% ---


% ---
% Dedicat�ria
% ---
\newcommand{\imprimirdedicatoria}[1]{
	\begin{dedicatoria}
   		\vspace*{\fill}
   		\centering
   		\noindent
   		\textit{#1}
   		\vspace*{\fill}
	\end{dedicatoria}
}
% ---

% ---
% Agradecimentos
% ---
\newcommand{\imprimiragradecimentos}[1]{
	\begin{agradecimentos}
		#1
	\end{agradecimentos}
}
% ---

% ---
% Ep�grafe
% ---
\newcommand{\imprimirepigrafe}[1]{
\begin{epigrafe}
    \vspace*{\fill}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
\end{epigrafe}
}
% ---


%========================================================================
% Listas e Sum�rio
%========================================================================

% ---
% Lista de ilustra��es
% ---
\newcommand{\listailustracoes}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}
% ---

% ---
% Lista de tabelas
% ---
\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}
% ---

% ---
% Lista de abreviaturas
% ---
\newcommand{\listasiglas}[1]{
	\thispagestyle{empty}
	\pagestyle{empty}
	\pdfbookmark[0]{Lista de siglas}{Lista de siglas} 
	\chapter*{Lista de siglas}
	\input{#1}
	\cleardoublepage
}

\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de algoritmos}
\newcommand{\cftalgorithmname}{\algorithmname\space} 
\newcommand{\listaalgoritmos}{
	\pdfbookmark[0]{\listalgorithmname}{loa}
	\thispagestyle{empty}
	\pagestyle{empty}
	\listofalgorithms
	\cleardoublepage
}

\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de s�mbolos}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}
% ---

% ---
% Sum�rio
% ---
\newcommand{\sumario}{%
	\chapter*{\contentsname}
	\pdfbookmark[0]{\contentsname}{toc}
	\thispagestyle{empty}
	\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage}
% ---

%========================================================================
% Resumo e Abstract
%========================================================================

% ---
% Resumo
% ---
\renewenvironment{resumo}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Resumo}\par%
	\pdfbookmark[0]{Resumo}{Resumo} 
	\@authorbib~ \textbf{\imprimirtitulo}. \pageref{LastPage}~p.~\@tipotrabalho~ -- ~Departamento de Engenharia El�trica, Universidade de Bras�lia, \imprimirdata.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}

% ---

% ---
% Abstract
% ---
\renewenvironment{abstract}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Abstract}\par%
	\pdfbookmark[0]{Abstract}{Abstract} 
	\@authorbib~ \textbf{\@engtitle}. \pageref{LastPage}~p.~\@worktype~ -- ~S�o Carlos School of Engineering, University of S�o Paulo, \imprimirdata.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}
% ---

%=======================================================================
% Ajuste do cabe�alho e rodap�
%=======================================================================

\makepagestyle{eescchaplast}
\makeevenhead{eescchaplast}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{eescchaplast}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{eescchaplast}{\textwidth}{\normalrulethickness}


\makepagestyle{eescpartlast}
\makeoddhead{eescpartlast}{}{}{\ABNTEXfontereduzida\thepage}
\makeevenhead{eescpartlast}{\ABNTEXfontereduzida\thepage}{}{}


\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 


\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  \aliaspagestyle{cleared}{eescchaplast}
  \aliaspagestyle{part}{eescchaplast}
  \nouppercaseheads
}% Configura layout para elementos p�s-textuais

\renewcommand{\postextual}{
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{eescchaplast}
  \aliaspagestyle{part}{eescpartlast}
\aliaspagestyle{afterpart}{eescpartlast}

}
\renewcommand{\backmatter}{\postextual}

% ---

%=========================================================================
% Nomes Constantes
%=========================================================================
%\renewcommand{\chaptername}{Cap�tulo}
%\renewcommand{\partname}{Parte}

%=========================================================================
% Configura��es
%=========================================================================
% --- 
\chapterstyle{madsen}

% --- 
\renewcommand*{\figureautorefname}{Figura}
\renewcommand*\footnoteautorefname{Nota de Rodap�}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{Tabela}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Ap�ndice}%
\renewcommand*\chapterautorefname{Cap�tulo}%
\renewcommand*\sectionautorefname{Se��o}%
\renewcommand*\subsectionautorefname{Subse��o}%
\renewcommand*\subsubsectionautorefname{Subse��o}%
\renewcommand*\paragraphautorefname{Par�grafo}%
\renewcommand*\subparagraphautorefname{Subpar�grafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{P�gina}%
% --- 


% ---
% Fonte padr�o section, subsection e subsubsection
\renewcommand{\ABNTEXchapterfont}{\huge\bfseries}

% Tipo de trabalho para classe abntex2 (ficha catalogr�fica)
% ---
\tipotrabalho{\@tipotrabalho}

% --- 
% Espa�amentos entre linhas e par�grafos 
% --- 

%%% O tamanho do par�grafo � dado por:
%\setlength{\parindent}{0.5cm}

% Controle do espa�amento entre um par�grafo e outro:
%\setlength{\parskip}{0.2cm}  % tente tamb�m \onelineskip