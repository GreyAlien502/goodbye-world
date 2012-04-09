# William Wu, 2012-04-01
# goodbye

# choice of compiler 
CC = gcc

# includes directory
INCLUDES = /usr/local/include

# library flags
LFLAGS = -L/usr/local/lib
LIBS =

# compiler flags -- command-line options are:
# make mode=release
# make mode=development
# make mode=debug (default)
ifeq ($(mode),release)
	CFLAGS = -O2 -Wall -I$(INCLUDEDIR)
else ifeq ($(mode),development)
	CFLAGS = -O2 -g -Wall -I$(INCLUDES)
else 
	CFLAGS = -O0 -g -Wall -Werror -I$(INCLUDES)
endif

# name of final program
OUTPUT = goodbye

# all -- build program and test it
all: $(OUTPUT)

# linking -- put object files together into machine-code
$(OUTPUT): goodbye.o
	$(CC) $(CFLAGS) -o $(OUTPUT) goodbye.o $(LFLAGS) $(LIBS)

# compilation -- create individual assembly-language object files
goodbye.o: goodbye.c
	$(CC) $(CFLAGS) -c goodbye.c

# clean -- remove object files and program
clean:
	-rm -rf *.o $(OUTPUT)