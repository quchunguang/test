all: 		imagerotate
clean:
	rm -f imagerotate *.o
imagerotate: 	imagerotate.c
	gcc -lm -lcvaux -o $@ $<

test: 		imagerotate.py
	./$< me.jpeg
	#imagerotate me.jpeg
