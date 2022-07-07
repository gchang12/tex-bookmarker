mkdir 2>/dev/null appendix chapters front-matter src output;
if [ -n "$1" ]; then
    if [ ! -e "output/$1.pdf" ]; then
        touch {appendix,chapters,front-matter}/$1.csv;
        vi {appendix,chapters,front-matter}/$1.csv;
    fi;
    echo $1 > tex/bookname.tex;
    pdflatex -jobname=$1 main;
    mv $1.pdf output;
    rm $1.*;
else
    ls src | sed s/.pdf//;
fi;
