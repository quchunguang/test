all: 		senseCrypt hellotest
clean:
	rm -f senseCrypt *.o
	rm -f hellotest libhello.so

senseCrypt: 	senseCrypt.c
	gcc -g -I. $< libsenseCrypt.a -o $@

######################## test dso  ##############################
libhello.so: 	hello.c
	gcc -O -c -fPIC -o hello.o $<
	gcc -shared -o $@ hello.o
hellotest: 	libhello.so hellotest.c
	#gcc -o $@ -L. -lhello hellotest.c
	gcc -Wl,-rpath,.,-rpath,$(HOME)/lib -o $@ $^ -ldl

test: 		senseCrypt hellotest
	#gdb --args ./senseCrypt "00010203040506070809f0f1f2f3f4f5" "1234567890123456" "Cd9Za6Xgq0SfGbi8"
	./senseCrypt "0F032EBDB34AF3FF6D7ABCAEB59A6415" "7gio49f023rkgfdr" "vasse4sdf034tf43"
	#./hellotest
