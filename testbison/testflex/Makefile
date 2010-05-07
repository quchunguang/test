# Make file for common use of flex
#  By Kevin Qu at quchunguang@gmail.com
#  Copyright under GPL

PRJS=replace nl pascalscan replacecommet colorcat
all: 		$(PRJS)
	
clean: 		
	rm -f $(PRJS) *.tab.c

$(PRJS): \
%: 	%.tab.c
#$(CC) -lfl -o $@ $<  <if no main file>
	$(CC) -o $@ $<
%.tab.c: %.l
# -i: ignore case
	flex -o $(@:%.o=%.d) $<

test: 	replace replacecommet colorcat
	@logecho "[INFO] test replace ..."
	@cat replace.data
	@echo "---------------------------------------------"
	@./replace < replace.data
	@logecho "[INFO] test replacecommet ..."
	@cat replacecommet.data
	@echo "---------------------------------------------"
	@./replacecommet < replacecommet.data
	@logecho "[INFO] test colorcat ..."
	@cat colorcat.data
	@echo "---------------------------------------------"
	@./colorcat < colorcat.data
