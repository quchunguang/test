# create ~/.manpath like this,
#   MANDATORY_MANPATH			/home/qcg/share/man
#   MANPATH_MAP	/home/qcg/bin		/home/qcg/share/man
# $ manpath
# to show if it worked, and then `man this`
# See
#   http://anaturb.net/create_man_p.htm

NAME=this
MAN_LEVEL=3
MAN_FILE=$(NAME).$(MAN_LEVEL)
MAN_PATH=${HOME}/share/man/man$(MAN_LEVEL)

all: 		this
clean:
	rm -f $(NAME).tmp $(MAN_PATH)/$(MAN_FILE).gz
.PHONY: 	all clean

$(NAME): 		$(NAME).txt $(NAME).sed
	sed -f $(NAME).sed $(NAME).txt > $(MAN_FILE)
	nroff -e -mandoc $(MAN_FILE)
	mkdir -p $(MAN_PATH)
	gzip $(MAN_FILE)
	mv $(MAN_FILE).gz $(MAN_PATH)
