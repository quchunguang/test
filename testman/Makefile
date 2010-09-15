# create ~/.manpath like this,
#   MANDATORY_MANPATH			/home/qcg/man
#   MANPATH_MAP	/home/qcg/bin		/home/qcg/man
# $ manpath
# to show if it worked, and then `man this`
# See
#   http://anaturb.net/create_man_p.htm

MAN_PATH=/home/qcg/man

all: 		this
clean:
	rm -f this.tmp $(MAN_PATH)/man3/this.3.bz2
.PHONY: 	all clean

this: 		this.txt this.sed
	sed -f this.sed this.txt > this.3
	nroff -e -mandoc this.3
	mkdir -p $(MAN_PATH)/man3
	bzip2 this.3
	mv this.3.bz2 $(MAN_PATH)/man3/
