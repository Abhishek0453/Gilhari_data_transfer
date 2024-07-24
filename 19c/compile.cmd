set JX_HOME= <path to root directory of Gilhari SDK installation>
javac -d .\bin -target 1.8 -cp .;%JX_HOME%\libs\jxclasses.jar;%JX_HOME%\external_libs\json-20160212.jar @sources.txt
