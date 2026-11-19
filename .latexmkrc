# =====================================================================
# .latexmkrc
# PT: Configuração do latexmk. Com este ficheiro, basta correr
#         latexmk main.tex
#     e o latexmk executa pdflatex, biber e makeglossaries as vezes
#     necessárias. O Overleaf também lê este ficheiro.
# EN: latexmk configuration. With this file, just run
#         latexmk main.tex
#     and latexmk runs pdflatex, biber and makeglossaries as many times as
#     needed. Overleaf also reads this file.
# =====================================================================

# PT: Ficheiro principal e PDF com pdfLaTeX.
# EN: Main file and PDF output with pdfLaTeX.
@default_files = ('main.tex');
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# PT: Bibliografia: corre o biber quando o .bcf existe (biblatex).
# EN: Bibliography: runs biber when the .bcf file exists (biblatex).
$bibtex_use = 2;

# PT: Acrónimos e glossário: corre o makeglossaries quando os ficheiros
#     .acn (acrónimos) ou .glo (glossário) mudam.
# EN: Acronyms and glossary: runs makeglossaries when the .acn (acronyms)
#     or .glo (glossary) files change.
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    my @args = ('-d', $path, $base_name);
    if ($silent) { unshift @args, '-q'; }
    return system('makeglossaries', @args);
}

# PT: Ficheiros extra apagados por "latexmk -c".
# EN: Extra files removed by "latexmk -c".
push @generated_exts, 'acn', 'acr', 'alg', 'glo', 'gls', 'glg', 'ist', 'run.xml', 'synctex.gz';
$clean_ext .= ' %R.bbl';
