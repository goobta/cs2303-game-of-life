# Set CFLAGS to activate all warnings and enable debugger
CFLAGS = -Wall -g

# Default rule is to build the executable called life
all: life

# Rule for building the executable.
life: life.o config.o game.o
	gcc $(CFLAGS) life.o config.o game.o -o life

# Rules for building each object file.
life.o: life.c config.h
	gcc $(CFLAGS) -c life.c

config.o: config.c config.h
	gcc $(CFLAGS) -c config.c

# Give command "make clean" to remove object files,
#  executable, and documentation.
clean:
	rm -f *.o life
	rm -f -r html latex

# Give command "make docs" to create documentation.	
docs:
	doxygen
