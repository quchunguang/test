# Make file for common use of flex
#  By Kevin Qu at quchunguang@gmail.com
#  Copyright under GPL

PRJS=replace nl pascalscan replacecommet
all: 		$(PRJS)
	
clean: 		
	rm -f $(PRJS) *.tab.c *~

$(PRJS): \
%: 	%.tab.c
#$(CC) -lfl -o $@ $<  <if no main file>
	$(CC) -o $@ $<
%.tab.c: %.l
# -i: ignore case
	flex -o $(@:%.o=%.d) $<

test: 	replace replacecommet
	@logecho "[INFO] test replace..."
	@cat replace.data
	@echo "---------------------------------------------"
	@./replace < replace.data
	@logecho "[INFO] test replace..."
	@cat replacecommet.data
	@echo "---------------------------------------------"
	@./replacecommet < replacecommet.data
