CC = gcc
CFLAGS = 

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

SOURCES := $(wildcard src/*.c)
OBJECTS := $(patsubst src/%.c, obj/%.o, $(SOURCES))
EXECUTABLE := $(BIN_DIR)/main

all: $(EXECUTABLE)

run: $(EXECUTABLE)
	./$(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $@ $^

obj/%.o: src/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	del /q $(OBJ_DIR)\*
	del /q $(BIN_DIR)\*
