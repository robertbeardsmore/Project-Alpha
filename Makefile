CC = gcc
CFLAGS = 

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin


SOURCES := $(wildcard src/*.c)
OBJECTS := $(patsubst src/%.c, obj/%.o, $(SOURCES))
EXECUTABLE := main

all: $(EXECUTABLE)

run: $(EXECUTABLE)
	./$(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) -c $(CFLAGS) -o $@ $<

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

clean:
	del /q $(OBJ_DIR)\*
	rmdir /q $(OBJ_DIR)

