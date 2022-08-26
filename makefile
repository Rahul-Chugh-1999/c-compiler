flexFile = preprocessor
bisonFile= parser
headFile = translator
targetFile= target_translator


compiler.out: y.tab.o lex.yy.o ${headFile}.o ${headFile}.h ${targetFile}.o
	g++ -g lex.yy.o y.tab.o $(headFile).o ${targetFile}.o -lfl -o compiler.out

${targetFile}.o: ${targetFile}.cxx ${headFile}.h
	g++ -c -g ${targetFile}.cxx 

y.tab.o: ${bisonFile}.y ${headFile}.h
	yacc -dtv ${bisonFile}.y
	g++ -c y.tab.c

lex.yy.o: ${flexFile}.l ${headFile}.h
	flex ${flexFile}.l
	g++ -c lex.yy.c

${headFile}.o: ${headFile}.cxx
	g++ -g -c ${headFile}.cxx

clean:
	rm lex.yy.c lex.yy.o y.tab.c y.tab.h y.output 
	rm y.tab.o ${headFile}.o ${targetFile}.o compiler.out
