# Makefile for Sorting Algorithms Project
# Author: Professional C Developer
# Date: 2024

# Compiler and flags
CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -O2 -g
LDFLAGS = 

# Project name
TARGET = sorting_demo

# Source files
SOURCES = main.c array_sorting.c list_sorting.c matrix_sorting.c utils.c
OBJECTS = $(SOURCES:.c=.o)

# Header files
HEADERS = sorting_algorithms.h

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)
	@echo "Build successful! Run with: ./$(TARGET)"

# Compile source files to object files
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean completed"

# Install dependencies (if any)
install:
	@echo "No external dependencies required"

# Run the program
run: $(TARGET)
	./$(TARGET)

# Debug build
debug: CFLAGS += -DDEBUG -O0
debug: $(TARGET)

# Release build
release: CFLAGS += -DNDEBUG -O3
release: $(TARGET)

# Check for memory leaks with valgrind
memcheck: $(TARGET)
	valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET)

# Format code using clang-format (if available)
format:
	@if command -v clang-format >/dev/null 2>&1; then \
		clang-format -i *.c *.h; \
		echo "Code formatted successfully"; \
	else \
		echo "clang-format not found. Please install it to format code."; \
	fi

# Static analysis with cppcheck (if available)
analyze:
	@if command -v cppcheck >/dev/null 2>&1; then \
		cppcheck --enable=all --inconclusive --std=c11 *.c; \
	else \
		echo "cppcheck not found. Please install it for static analysis."; \
	fi

# Help target
help:
	@echo "Available targets:"
	@echo "  all       - Build the project (default)"
	@echo "  clean     - Remove build artifacts"
	@echo "  run       - Build and run the program"
	@echo "  debug     - Build with debug flags"
	@echo "  release   - Build with optimization flags"
	@echo "  memcheck  - Run with valgrind memory checker"
	@echo "  format    - Format code with clang-format"
	@echo "  analyze   - Run static analysis with cppcheck"
	@echo "  help      - Show this help message"

# Phony targets
.PHONY: all clean install run debug release memcheck format analyze help

# Default target
.DEFAULT_GOAL := all
