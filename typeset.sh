if [ -n "$1" ]; then
    if [ ! -e "output/$1.pdf" ]; then
    # Append list of comma-separated pairs of page numbers and chapter titles
        touch "{appendix,chapters,front-matter}/$1.csv";
        vi "{appendix,chapters,front-matter}/$1.csv";
    fi;
    # For TeX to process
    echo "$1" > tex/bookname.tex;
    pdflatex -jobname="$1" main;
    # This is where your output will be stored
    mv "$1.pdf" output;
    # Cleanup
    rm "$1.*";
else
    # Shows the user the list of possible choices.
    ls src | sed s/.pdf//;
fi;
