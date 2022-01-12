#!/bin/sh
CONTENTDIR="content"
BUILDDIR="build"
FILENAME="index"
ASSETSDIR="assets"

download_csl() {
    mkdir "${ASSETSDIR}" -p
    wget -O "${ASSETSDIR}/citation-style.csl" \
        "https://raw.githubusercontent.com/citation-style-language/styles/master/harvard-anglia-ruskin-university.csl"
}

pdf_print() {
    mkdir -p "${BUILDDIR}" 
    echo "Creating PDF print output"
    pandoc "${CONTENTDIR}/${FILENAME}.md" \
        --resource-path="${CONTENTDIR}" \
        --citeproc \
        --csl="${ASSETSDIR}/citation-style.csl" \
        --from="markdown+tex_math_single_backslash+tex_math_dollars+raw_tex" \
        --to="latex" \
        --output="${BUILDDIR}/reading_schedule.pdf" \
        --pdf-engine="xelatex" \
        --include-in-header="layouts/print.tex"
}

pdf_ereader() {
    mkdir "${BUILDDIR}" -p
    echo "Creating PDF ereader output"
    pandoc "${CONTENTDIR}/${FILENAME}.md" \
        --resource-path="${CONTENTDIR}" \
        --citeproc \
        --csl="${ASSETSDIR}/citation-style.csl" \
        --from="markdown+tex_math_single_backslash+tex_math_dollars+raw_tex" \
        --to="latex" \
        --output="${BUILDDIR}/output_ereader.pdf" \
        --pdf-engine="xelatex" \
        --include-in-header="layouts/ereader.tex"
}

clean() {
    rm -r "${BUILDDIR}"
}

# Allows to call a function based on arguments passed to the script
# Example: `./build.sh pdf_print`
$*