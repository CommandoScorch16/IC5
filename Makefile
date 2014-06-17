#IC5 Makefile
#Samuel Horton
#06//16//2014 


#For future reference:
#$@ refers to the name of the target
#$^ refers to all dependencies
#$< refers to the first dependency


#These are variable declarations, they help shrink the size of the code
CC = gcc
CFLAGS = -c -Wall -Wextra
LFLAGS = -Wall -Wextra -Werror


#Says that the things bearing these names will not actually be created
.PHONY: all libs clean 



all: facts1 facts2 libArchive



facts1: facts.o libfunnyfacts1.a
	$(CC) $(LFLAGS) $^ -o $@


facts2: facts.o libfunnyfacts2.a
	$(CC) $(LFLAGS) $^ -o $@





facts.o: facts.c FunnyFacts.h
	$(CC) $(CFLAGS) $< -o $@


object1.o: object1.c 
	$(CC) $(CFLAGS) $^ -o $@

object2.o: object2.c
	$(CC) $(CFLAGS) $^ -o $@


subject1.o: subject1.c
	$(CC) $(CFLAGS) $^ -o $@

subject2.o: subject2.c
	$(CC) $(CFLAGS) $^ -o $@


verb1.o: verb1.c
	$(CC) $(CFLAGS) $^ -o $@

verb2.o: verb2.c
	$(CC) $(CFLAGS) $^ -o $@



libs: libfunnyfacts1.a libfunnyfacts2.a


libfunnyfacts1.a: object1.o subject1.o verb1.o
	ar -r $@ $^


libfunnyfacts2.a: object2.o subject2.o verb2.o
	ar -r $@ $^



#This creates a .tar containing the two libraries
libArchive:
	tar -cf facts.tar libfunnyfacts1.a libfunnyfacts2.a



#This will delete everything created by running make on this makefile
clean:
	rm -rf *.o facts1 facts2 facts object1 object2 subject1 subject2 libfunnyfacts1.a libfunnyfacts2.a libArchive.tar