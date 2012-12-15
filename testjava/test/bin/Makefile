all: 	jar
jar:
	@echo "Main-Class: com.grazestar.kevin.TestJava" > manifest.mf
	@jar cmf manifest.mf TestJava.jar com/
	@mv TestJava.jar ../
	@rm -f manifest.mf
