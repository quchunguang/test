PRJS=replace nl pascalscan replacecommit
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
