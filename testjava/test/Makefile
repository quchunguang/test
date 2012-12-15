all: 		TestJava jar

clean:
	@find bin/ -name *.class -exec rm -f {} \;
	@rm -f TestJava.jar
TestJava:
	@javac -classpath src/ src/com/grazestar/kevin/TestJava.java -d bin/
run: 		TestJava
	@java -classpath bin/ com.grazestar.kevin.TestJava
jar:
	@cd bin && $(MAKE) jar
runjar: 	jar
	@java -jar TestJava.jar
