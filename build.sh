#!/bin/sh


echo "####################################################################################################"
echo "##### Making build/master.pdf"
echo "####################################################################################################"


compile() {
	echo "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Compiling master.tex"
	echo "------------------------------------------------"
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=build master.tex
}


bibliography() {
	echo "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Building bibliography with bibtex"
	echo "------------------------------------------------"
	sh -c "cd build && bibtex master.aux"
}


glossaries() {
	echo "\n\n"
	echo "------------------------------------------------"
	echo ">>>>> Making glossaries"
	echo "------------------------------------------------"
	sh -c "cd build && makeglossaries master"
}



if [ ! -d "build" ]; then
  ./clean.sh
fi


# build chain
compile
bibliography
glossaries
compile
glossaries
compile
compile




echo "\n\n"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"
echo ">>>>> Finished"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"
