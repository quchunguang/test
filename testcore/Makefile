# options
CFLAGS 		= -Wall -ansi -g
SOURCES 	= myprog.c 
OBJECTS 	= $(SOURCES:.c=.o)
MODULES 	= myproc.so ddlltest.so

.PHONY: 	all clean

all: 		myprog $(MODULES)

clean: 		
	rm -f $(OBJECTS) $(MODULES) myprog *~

# link DSO using -W1,-rpath,.
# link DSO using -Wl,export-dynamic
myprog: 	$(OBJECTS) myproc.so
	$(CC) $(CFLAGS) -Wl,-rpath,.,-rpath,$(HOME)/lib -o $@ $^ -ldl

# if these modules depends on some .h file write below
$(OBJECTS):


$(MODULES): \
%.so: 		%.c
	$(CC) $(CFLAGS) -fPIC -shared -o $@ $<
