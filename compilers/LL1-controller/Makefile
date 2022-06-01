default: controller
	gcc controller.lex.c -o controller -lfl

controller: controller.l
	flex -o controller.lex.c controller.l

clean:
	rm -f controller
	rm -f controller.lex.c
