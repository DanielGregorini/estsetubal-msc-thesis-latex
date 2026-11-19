# unips-estsetubal-msc-thesis-template

LaTeX template for MSc dissertations at Escola Superior de Tecnologia de Setúbal (UNIPS), following the official ESTSetúbal cover and jury page layout.

**[English](#english)** · **[Português](#portugues)**

---

<a id="english"></a>

## English

- [What this template is](#en-what)
- [Folder structure](#en-structure)
- [How to compile](#en-compile)
- [Using Overleaf](#en-overleaf)
- [Filling in `config/metadata.tex`](#en-metadata)
- [Adding chapters, appendices, acronyms and references](#en-adding)
- [Writing the dissertation in Portuguese](#en-portuguese)
- [Common problems](#en-problems)
- [Disclaimer](#en-disclaimer)
- [Credits](#en-credits)
- [License](#en-license)

<a id="en-what"></a>

### What this template is

A LaTeX template for master's dissertations (and project or internship reports) at the Escola Superior de Tecnologia de Setúbal, Universidade Politécnica de Setúbal (ESTSetúbal / UNIPS). It is meant for students who want to write in LaTeX instead of Word and still hand in a document with the school's look:

- the **cover** and the **jury page** reproduce, to the point, the official Word model `TrabalhoUNIPS_TecnologiaSetubal_Mestrado_definitiva.docx`;
- body text in Times, headings in Arial (Helvetica), 1.5 line spacing, A4 with 3 cm margins;
- IEEE-style references with `biblatex` + `biber`, and an automatic list of acronyms with `glossaries`;
- short example chapters, in English and in Portuguese, that show how to cite, cross-reference, and add figures, tables, equations, lists, acronyms, units and footnotes.

Every `.tex` file is commented in Portuguese and English.

<a id="en-structure"></a>

### Folder structure

```
.
├── main.tex                      Main file: sets the order of the parts of the document
├── config/
│   ├── packages.tex              Packages, fonts, margins, headings, bibliography style
│   ├── metadata.tex              Your data: title, name, supervisors, jury, dates
│   └── commands.tex              Your own helper commands
├── frontmatter/
│   ├── cover.tex                 Cover (page 1), official ESTSetúbal/UNIPS layout
│   ├── folha-rosto.tex           Jury page (page 2), official layout
│   ├── acknowledgements.tex      Acknowledgements
│   ├── abstract.tex              Abstract in English and keywords
│   ├── resumo.tex                Abstract in Portuguese and palavras-chave
│   └── acronyms.tex              Acronym definitions
├── chapters/
│   ├── 01-introduction.tex       Example: sections, lists, footnote, acronyms
│   ├── 02-literature-review.tex  Example: \cite and \textcite
│   ├── 03-methodology.tex        Example: TikZ figure, numbered equation, siunitx
│   ├── 04-results.tex            Example: booktabs table, figure from a file
│   ├── 05-discussion.tex         Example: cross-references, acronym variants
│   └── 06-conclusion.tex         Example: conclusion and future work
├── backmatter/
│   ├── apendice-a.tex            Appendix A (material you produced)
│   └── anexos.tex                Annexes (third-party documents)
├── bibliography/
│   └── references.bib            Bibliography database (four example entries)
├── figures/
│   ├── estsetubal_logo.pdf       ESTSetúbal/UNIPS logo used on the cover
│   └── example-figure.pdf        Example chart used in chapter 4
├── .latexmkrc                    latexmk settings (pdfLaTeX + biber + makeglossaries)
├── Makefile                      make, make manual, make clean, make distclean
├── .gitignore                    Ignores LaTeX build files and .DS_Store
├── LICENSE                       MIT license
└── README.md                     This file
```

<a id="en-compile"></a>

### How to compile

You need a TeX distribution (TeX Live, MacTeX or MiKTeX) with `pdflatex`, `biber` and `makeglossaries`.

**With latexmk (recommended).** The `.latexmkrc` file tells latexmk to run biber and makeglossaries as many times as needed:

```bash
latexmk
```

or, with the Makefile:

```bash
make
```

**By hand.** The equivalent manual sequence is:

```bash
pdflatex main
```

```bash
biber main
```

```bash
makeglossaries main
```

```bash
pdflatex main
```

```bash
pdflatex main
```

`make manual` runs the same five steps. `make clean` removes the auxiliary files and keeps `main.pdf`; `make distclean` also removes the PDF.

<a id="en-overleaf"></a>

### Using Overleaf

1. Download this repository as a ZIP (on GitHub: **Code → Download ZIP**).
2. In Overleaf: **New Project → Upload Project** and select the ZIP.
3. Open **Menu** and set **Compiler** to `pdfLaTeX`, **Main document** to `main.tex`, and **TeX Live version** to the most recent one.
4. Click **Recompile**. Overleaf runs latexmk, which runs biber and makeglossaries for you.

If the acronym list or the references are empty, use **Recompile → Recompile from scratch**.

<a id="en-metadata"></a>

### Filling in `config/metadata.tex`

`config/metadata.tex` is the only file you need to edit to get the cover, the jury page and the PDF properties right. Replace only the text inside the last pair of braces. Leave `\cosupervisorname{}` empty if you have no co-supervisor (the COORIENTADOR block disappears from the cover), and fill in `\jurysecondvogal` only if the jury has two examiners.

A complete example (all names are fictional):

```latex
\newcommand{\thesistitle}{Deteção de Anomalias em Redes Industriais com Aprendizagem Automática}
\newcommand{\thesissubtitle}{}
\newcommand{\thesiskeywords}{Anomaly Detection, Machine Learning, Industrial Networks}

\newcommand{\authorname}{Ana Exemplo Ferreira}
\newcommand{\coursename}{Mestrado em Engenharia de Software}
\newcommand{\coverdegree}{Relatório de Dissertação do Mestrado em}
\newcommand{\coursefield}{Engenharia de Software}
\newcommand{\institutionname}{Universidade Politécnica de Setúbal}
\newcommand{\schoolname}{Escola Superior de Tecnologia de Setúbal}
\newcommand{\cityname}{Setúbal}

\newcommand{\supervisorname}{Prof. Doutor João Exemplo Almeida}
\newcommand{\cosupervisorname}{Prof.ª Doutora Maria Exemplo Sousa}
\newcommand{\supervisorlabel}{ORIENTADOR}
\newcommand{\cosupervisorlabel}{COORIENTADORA}
\newcommand{\juryadvisorlabel}{Orientador}

\newcommand{\submissionmonth}{novembro}
\newcommand{\submissionyear}{2026}
\newcommand{\defencemonth}{janeiro}
\newcommand{\defenceyear}{2027}

\newcommand{\jurypresident}{Prof. Doutor Rui Exemplo Lopes, Universidade Politécnica de Setúbal}
\newcommand{\juryadvisor}{Prof. Doutor João Exemplo Almeida, Universidade Politécnica de Setúbal}
\newcommand{\juryvogal}{Prof.ª Doutora Carla Exemplo Pinto, Universidade de Lisboa}
\newcommand{\jurysecondvogal}{}
```

<a id="en-adding"></a>

### Adding chapters, appendices, acronyms and references

**Chapter.** Create `chapters/07-my-chapter.tex` starting with

```latex
\chapter{My Chapter}
\label{chap:my-chapter}
```

and add `\input{chapters/07-my-chapter}` to `main.tex`, after the other chapters. To remove a chapter, delete its `\input` line. Refer to it with `\cref{chap:my-chapter}`.

**Appendix.** Copy `backmatter/apendice-a.tex` to `backmatter/apendice-b.tex`, change the title and the label, and add `\input{backmatter/apendice-b}` to `main.tex` after `\appendix`. Appendices are lettered automatically (A, B, …). Use appendices for material you produced and annexes (`anexos.tex`) for third-party documents.

**Acronym.** Add a line to `frontmatter/acronyms.tex`:

```latex
\newacronym{gpu}{GPU}{Graphics Processing Unit}
```

and write `\gls{gpu}` in the text: the first use prints "Graphics Processing Unit (GPU)", the following ones "GPU". `\glspl{gpu}` gives the plural, `\acrshort`, `\acrlong` and `\acrfull` force a form. Do not use `\gls` inside `\caption`; use `\acrshort` there.

**Reference.** Add an entry to `bibliography/references.bib` with a unique key:

```bibtex
@article{Silva2024,
  author  = {Silva, Ana and Costa, Rui},
  title   = {Title of the Article},
  journal = {Journal Name},
  volume  = {12},
  pages   = {1--10},
  year    = {2024},
  doi     = {10.xxxx/xxxxx}
}
```

and cite it with `\cite{Silva2024}` ("[5]") or `\textcite{Silva2024}` ("Silva and Costa [5]"). Only cited entries appear in the reference list. Copy BibTeX from the DOI, the publisher or Google Scholar, and always check it.

<a id="en-portuguese"></a>

### Writing the dissertation in Portuguese

1. In `config/packages.tex`, change the babel line to `\usepackage[english,portuguese]{babel}` (the last language is the main one) and uncomment the `\addto\captionsportuguese` block.
2. In `main.tex`, translate the titles of the lists and the bibliography ("Índice", "Lista de Figuras", "Lista de Tabelas", "Lista de Siglas e Acrónimos", "Referências Bibliográficas") and remove `\selectlanguage{english}`.
3. `cleveref` has no European Portuguese names, so write references as `Figura~\ref{fig:x}`, `Tabela~\ref{tab:x}`, `Secção~\ref{sec:x}` and `Equação~\eqref{eq:x}`, as in the Portuguese examples.
4. For numbers with a decimal comma, set `\sisetup{output-decimal-marker={,}, group-separator={\,}}` in `config/packages.tex` (see chapter 4).

<a id="en-problems"></a>

### Common problems

**`File 'ieee.bbx' not found` (biblatex-ieee missing).** The IEEE style is a separate package that minimal TeX installations (for example TeX Live "basic" or a small MiKTeX) do not include. Install it:

```bash
tlmgr install biblatex-ieee
```

Use `sudo tlmgr install biblatex-ieee` if TeX Live was installed for all users, or, without administrator rights, `tlmgr init-usertree` followed by `tlmgr --usermode install biblatex-ieee`. On MiKTeX, install `biblatex-ieee` in the MiKTeX Console. Alternatively, in `config/packages.tex`, comment out the `style=ieee` line and uncomment the `style=numeric-comp` line, which only needs biblatex. Overleaf already has biblatex-ieee.

**The body font is not Times from newtx.** If `newtx` is not installed, the template falls back to `mathptmx` (also Times) without an error. To get newtx: `tlmgr install newtx kastrup`.

**The list of acronyms is empty or missing.** `makeglossaries` was not run. Use `latexmk` (or `make`), or run the manual sequence above. On Windows, `makeglossaries` needs Perl; without Perl, run `makeglossaries-lite main` instead. On Overleaf, use **Recompile from scratch**.

**`??` instead of numbers, or "There were undefined references".** LaTeX needs more than one pass. latexmk does this for you; by hand, run the full sequence above.

**The title is too long for the cover.** The cover title is 16 pt bold capitals in a fixed-width column. At most **10 lines** (about 220 characters) fit; an 11th line overlaps the "Relatório de Dissertação…" block. Keep the title within about 8 lines, count the subtitle as part of it, and shorten it if needed. You can force line breaks with `\\` inside `\thesistitle`. The jury page fits up to 12 lines. Do not change the positions in `cover.tex`: they reproduce the official model.

<a id="en-disclaimer"></a>

### Disclaimer

This is **not an official template** of UNIPS or ESTSetúbal. It reproduces the layout of the school's official Word model, but rules change: before submitting, confirm the current regulations (cover, structure, formatting, word limits, language) with the school and with your supervisor.

<a id="en-credits"></a>

### Credits

- **Logo.** `figures/estsetubal_logo.pdf` is an unmodified copy of `novathesisFiles/Schools/unips/estsetubal/Images/unips-estsetubal-logo.pdf` from [VisionXAiRy/novathesis](https://github.com/VisionXAiRy/novathesis) (added by Pedro Albuquerque Santos in commit `cfcee3d`, "add UNIPS and all schools support", October 2026). That repository is a fork of [novathesis](https://github.com/joaomlourenco/novathesis) by João M. Lourenço and is distributed under the [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl/lppl-1-3c/). The complete, unmodified novathesis work can be obtained from those repositories. The logo itself belongs to ESTSetúbal / UNIPS, and the MIT license of this template does not apply to it.
- **Cover and jury page.** Positions and sizes were measured from the school's official Word model `TrabalhoUNIPS_TecnologiaSetubal_Mestrado_definitiva.docx`.
- **Bibliography style.** [biblatex-ieee](https://ctan.org/pkg/biblatex-ieee), maintained by Joseph Wright.

<a id="en-license"></a>

### License

The template source is released under the [MIT License](LICENSE). The logo is excluded; see [Credits](#en-credits).

---

<a id="portugues"></a>

## Português

- [O que é este template](#pt-o-que-e)
- [Estrutura de pastas](#pt-estrutura)
- [Como compilar](#pt-compilar)
- [Usar no Overleaf](#pt-overleaf)
- [Preencher o `config/metadata.tex`](#pt-metadata)
- [Acrescentar capítulos, apêndices, acrónimos e referências](#pt-acrescentar)
- [Escrever a dissertação em português](#pt-portugues)
- [Problemas comuns](#pt-problemas)
- [Aviso](#pt-aviso)
- [Créditos](#pt-creditos)
- [Licença](#pt-licenca)

<a id="pt-o-que-e"></a>

### O que é este template

Um template LaTeX para dissertações de mestrado (e relatórios de projeto ou de estágio) da Escola Superior de Tecnologia de Setúbal, Universidade Politécnica de Setúbal (ESTSetúbal / UNIPS). Destina-se a alunos que querem escrever em LaTeX em vez de Word e entregar um documento com o aspeto da escola:

- a **capa** e a **folha do júri** reproduzem ao pormenor o modelo oficial em Word `TrabalhoUNIPS_TecnologiaSetubal_Mestrado_definitiva.docx`;
- texto em Times, títulos em Arial (Helvetica), entrelinha de 1,5, A4 com margens de 3 cm;
- referências no estilo IEEE com `biblatex` + `biber`, e lista de acrónimos automática com `glossaries`;
- capítulos de exemplo curtos, em inglês e em português, que mostram como citar, fazer referências cruzadas e acrescentar figuras, tabelas, equações, listas, acrónimos, unidades e notas de rodapé.

Todos os ficheiros `.tex` estão comentados em português e em inglês.

<a id="pt-estrutura"></a>

### Estrutura de pastas

```
.
├── main.tex                      Ficheiro principal: define a ordem das partes do documento
├── config/
│   ├── packages.tex              Pacotes, fontes, margens, títulos, estilo da bibliografia
│   ├── metadata.tex              Os seus dados: título, nome, orientadores, júri, datas
│   └── commands.tex              Comandos auxiliares próprios
├── frontmatter/
│   ├── cover.tex                 Capa (página 1), layout oficial ESTSetúbal/UNIPS
│   ├── folha-rosto.tex           Folha do júri (página 2), layout oficial
│   ├── acknowledgements.tex      Agradecimentos
│   ├── abstract.tex              Resumo em inglês e keywords
│   ├── resumo.tex                Resumo em português e palavras-chave
│   └── acronyms.tex              Definição dos acrónimos
├── chapters/
│   ├── 01-introduction.tex       Exemplo: secções, listas, nota de rodapé, acrónimos
│   ├── 02-literature-review.tex  Exemplo: \cite e \textcite
│   ├── 03-methodology.tex        Exemplo: figura TikZ, equação numerada, siunitx
│   ├── 04-results.tex            Exemplo: tabela booktabs, figura a partir de ficheiro
│   ├── 05-discussion.tex         Exemplo: referências cruzadas, variantes dos acrónimos
│   └── 06-conclusion.tex         Exemplo: conclusão e trabalho futuro
├── backmatter/
│   ├── apendice-a.tex            Apêndice A (material produzido por si)
│   └── anexos.tex                Anexos (documentos de terceiros)
├── bibliography/
│   └── references.bib            Base de dados bibliográfica (quatro entradas de exemplo)
├── figures/
│   ├── estsetubal_logo.pdf       Logotipo ESTSetúbal/UNIPS usado na capa
│   └── example-figure.pdf        Gráfico de exemplo usado no capítulo 4
├── .latexmkrc                    Configuração do latexmk (pdfLaTeX + biber + makeglossaries)
├── Makefile                      make, make manual, make clean, make distclean
├── .gitignore                    Ignora os ficheiros gerados pelo LaTeX e o .DS_Store
├── LICENSE                       Licença MIT
└── README.md                     Este ficheiro
```

<a id="pt-compilar"></a>

### Como compilar

Precisa de uma distribuição TeX (TeX Live, MacTeX ou MiKTeX) com `pdflatex`, `biber` e `makeglossaries`.

**Com o latexmk (recomendado).** O ficheiro `.latexmkrc` faz o latexmk correr o biber e o makeglossaries as vezes necessárias:

```bash
latexmk
```

ou, com o Makefile:

```bash
make
```

**À mão.** A sequência manual equivalente é:

```bash
pdflatex main
```

```bash
biber main
```

```bash
makeglossaries main
```

```bash
pdflatex main
```

```bash
pdflatex main
```

O `make manual` corre os mesmos cinco passos. O `make clean` apaga os ficheiros auxiliares e mantém o `main.pdf`; o `make distclean` apaga também o PDF.

<a id="pt-overleaf"></a>

### Usar no Overleaf

1. Descarregue este repositório em ZIP (no GitHub: **Code → Download ZIP**).
2. No Overleaf: **New Project → Upload Project** e escolha o ZIP.
3. Abra o **Menu** e defina **Compiler** como `pdfLaTeX`, **Main document** como `main.tex` e **TeX Live version** como a mais recente.
4. Carregue em **Recompile**. O Overleaf corre o latexmk, que corre o biber e o makeglossaries.

Se a lista de acrónimos ou as referências aparecerem vazias, use **Recompile → Recompile from scratch**.

<a id="pt-metadata"></a>

### Preencher o `config/metadata.tex`

O `config/metadata.tex` é o único ficheiro que precisa de editar para a capa, a folha do júri e as propriedades do PDF. Substitua apenas o texto dentro do último par de chavetas. Deixe `\cosupervisorname{}` vazio se não tiver coorientador (o bloco COORIENTADOR desaparece da capa) e preencha `\jurysecondvogal` só se o júri tiver dois vogais. Use os rótulos `\supervisorlabel`, `\cosupervisorlabel` e `\juryadvisorlabel` para a forma feminina (ORIENTADORA, COORIENTADORA, Orientadora).

Exemplo completo (todos os nomes são fictícios):

```latex
\newcommand{\thesistitle}{Deteção de Anomalias em Redes Industriais com Aprendizagem Automática}
\newcommand{\thesissubtitle}{}
\newcommand{\thesiskeywords}{Anomaly Detection, Machine Learning, Industrial Networks}

\newcommand{\authorname}{Ana Exemplo Ferreira}
\newcommand{\coursename}{Mestrado em Engenharia de Software}
\newcommand{\coverdegree}{Relatório de Dissertação do Mestrado em}
\newcommand{\coursefield}{Engenharia de Software}
\newcommand{\institutionname}{Universidade Politécnica de Setúbal}
\newcommand{\schoolname}{Escola Superior de Tecnologia de Setúbal}
\newcommand{\cityname}{Setúbal}

\newcommand{\supervisorname}{Prof. Doutor João Exemplo Almeida}
\newcommand{\cosupervisorname}{Prof.ª Doutora Maria Exemplo Sousa}
\newcommand{\supervisorlabel}{ORIENTADOR}
\newcommand{\cosupervisorlabel}{COORIENTADORA}
\newcommand{\juryadvisorlabel}{Orientador}

\newcommand{\submissionmonth}{novembro}
\newcommand{\submissionyear}{2026}
\newcommand{\defencemonth}{janeiro}
\newcommand{\defenceyear}{2027}

\newcommand{\jurypresident}{Prof. Doutor Rui Exemplo Lopes, Universidade Politécnica de Setúbal}
\newcommand{\juryadvisor}{Prof. Doutor João Exemplo Almeida, Universidade Politécnica de Setúbal}
\newcommand{\juryvogal}{Prof.ª Doutora Carla Exemplo Pinto, Universidade de Lisboa}
\newcommand{\jurysecondvogal}{}
```

<a id="pt-acrescentar"></a>

### Acrescentar capítulos, apêndices, acrónimos e referências

**Capítulo.** Crie `chapters/07-meu-capitulo.tex` a começar por

```latex
\chapter{O Meu Capítulo}
\label{chap:meu-capitulo}
```

e junte `\input{chapters/07-meu-capitulo}` ao `main.tex`, depois dos outros capítulos. Para retirar um capítulo, apague a linha `\input` correspondente.

**Apêndice.** Copie `backmatter/apendice-a.tex` para `backmatter/apendice-b.tex`, mude o título e o rótulo, e junte `\input{backmatter/apendice-b}` ao `main.tex` depois de `\appendix`. Os apêndices são numerados com letras (A, B, …). Use apêndices para material produzido por si e anexos (`anexos.tex`) para documentos de terceiros.

**Acrónimo.** Acrescente uma linha a `frontmatter/acronyms.tex`:

```latex
\newacronym{gpu}{GPU}{Graphics Processing Unit}
```

e escreva `\gls{gpu}` no texto: o primeiro uso dá "Graphics Processing Unit (GPU)" e os seguintes "GPU". `\glspl{gpu}` dá o plural; `\acrshort`, `\acrlong` e `\acrfull` forçam uma forma. Não use `\gls` dentro de `\caption`; use `\acrshort`.

**Referência.** Acrescente uma entrada a `bibliography/references.bib` com uma chave única:

```bibtex
@article{Silva2024,
  author  = {Silva, Ana and Costa, Rui},
  title   = {Título do Artigo},
  journal = {Nome da Revista},
  volume  = {12},
  pages   = {1--10},
  year    = {2024},
  doi     = {10.xxxx/xxxxx}
}
```

e cite-a com `\cite{Silva2024}` ("[5]") ou `\textcite{Silva2024}` ("Silva and Costa [5]"). Só as entradas citadas aparecem na lista de referências. Copie o BibTeX a partir do DOI, da editora ou do Google Scholar e confirme sempre os dados.

<a id="pt-portugues"></a>

### Escrever a dissertação em português

1. Em `config/packages.tex`, mude a linha do babel para `\usepackage[english,portuguese]{babel}` (a última língua é a principal) e descomente o bloco `\addto\captionsportuguese`.
2. Em `main.tex`, traduza os títulos das listas e da bibliografia ("Índice", "Lista de Figuras", "Lista de Tabelas", "Lista de Siglas e Acrónimos", "Referências Bibliográficas") e apague `\selectlanguage{english}`.
3. O `cleveref` não tem nomes em português europeu: escreva as referências como `Figura~\ref{fig:x}`, `Tabela~\ref{tab:x}`, `Secção~\ref{sec:x}` e `Equação~\eqref{eq:x}`, como nos exemplos em português.
4. Para números com vírgula decimal, defina `\sisetup{output-decimal-marker={,}, group-separator={\,}}` em `config/packages.tex` (ver capítulo 4).

<a id="pt-problemas"></a>

### Problemas comuns

**`File 'ieee.bbx' not found` (falta o biblatex-ieee).** O estilo IEEE é um pacote à parte que as instalações TeX mínimas (por exemplo, o TeX Live "basic" ou um MiKTeX pequeno) não incluem. Instale-o:

```bash
tlmgr install biblatex-ieee
```

Use `sudo tlmgr install biblatex-ieee` se o TeX Live foi instalado para todos os utilizadores ou, sem permissões de administrador, `tlmgr init-usertree` seguido de `tlmgr --usermode install biblatex-ieee`. No MiKTeX, instale `biblatex-ieee` no MiKTeX Console. Em alternativa, em `config/packages.tex`, comente a linha com `style=ieee` e descomente a linha com `style=numeric-comp`, que só precisa do biblatex. O Overleaf já tem o biblatex-ieee.

**O texto não está em Times do newtx.** Se o `newtx` não estiver instalado, o template usa o `mathptmx` (também Times) sem dar erro. Para ter o newtx: `tlmgr install newtx kastrup`.

**A lista de acrónimos está vazia ou não aparece.** O `makeglossaries` não foi executado. Use o `latexmk` (ou `make`) ou corra a sequência manual acima. No Windows, o `makeglossaries` precisa de Perl; sem Perl, use `makeglossaries-lite main`. No Overleaf, use **Recompile from scratch**.

**Aparece `??` em vez de números, ou "There were undefined references".** O LaTeX precisa de mais do que uma passagem. O latexmk trata disso; à mão, corra a sequência completa acima.

**O título é demasiado longo para a capa.** O título da capa é escrito a 16 pt, negrito, em maiúsculas, numa coluna de largura fixa. Cabem no máximo **10 linhas** (uns 220 caracteres); a 11.ª linha sobrepõe-se ao bloco "Relatório de Dissertação…". Mantenha o título até cerca de 8 linhas, conte o subtítulo como parte dele e encurte-o se for preciso. Pode forçar quebras de linha com `\\` dentro de `\thesistitle`. A folha do júri aceita até 12 linhas. Não altere as posições em `cover.tex`: reproduzem o modelo oficial.

<a id="pt-aviso"></a>

### Aviso

Este **não é um template oficial** da UNIPS nem da ESTSetúbal. Reproduz o layout do modelo oficial em Word da escola, mas as regras mudam: antes de entregar, confirme o regulamento em vigor (capa, estrutura, formatação, limites de palavras, língua) junto da escola e do seu orientador.

<a id="pt-creditos"></a>

### Créditos

- **Logotipo.** `figures/estsetubal_logo.pdf` é uma cópia não modificada de `novathesisFiles/Schools/unips/estsetubal/Images/unips-estsetubal-logo.pdf` do repositório [VisionXAiRy/novathesis](https://github.com/VisionXAiRy/novathesis) (acrescentado por Pedro Albuquerque Santos no commit `cfcee3d`, "add UNIPS and all schools support", outubro de 2026). Esse repositório é um fork do [novathesis](https://github.com/joaomlourenco/novathesis) de João M. Lourenço e é distribuído sob a [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl/lppl-1-3c/). A obra novathesis completa e não modificada pode ser obtida nesses repositórios. O logotipo pertence à ESTSetúbal / UNIPS e a licença MIT deste template não se aplica a ele.
- **Capa e folha do júri.** As posições e medidas foram tiradas do modelo oficial em Word da escola, `TrabalhoUNIPS_TecnologiaSetubal_Mestrado_definitiva.docx`.
- **Estilo bibliográfico.** [biblatex-ieee](https://ctan.org/pkg/biblatex-ieee), mantido por Joseph Wright.

<a id="pt-licenca"></a>

### Licença

O código do template é distribuído sob a [licença MIT](LICENSE). O logotipo fica excluído; ver [Créditos](#pt-creditos).
