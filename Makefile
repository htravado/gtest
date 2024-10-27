# Variables
CXX = g++
CXXFLAGS = -Wall -g $(INCLUDE)
INCLUDE = -I lib/include
LIB_SRC = lib/source/LibraryCode.cpp
LIB_HEADER = lib/include/LibraryCode.h
MAIN_SRC = source/main.cpp
LIB_NAME = libLibrary.a
EXECUTABLE = main

# Regla principal
all: $(EXECUTABLE)

# Compila el programa principal
$(EXECUTABLE): $(MAIN_SRC) $(LIB_NAME)
	$(CXX) $(CXXFLAGS) -o $@ $< -L. -lLibrary

# Compila la librería estática
$(LIB_NAME): $(LIB_SRC)
	$(CXX) $(CXXFLAGS) -c $< -o LibraryCode.o
	ar rcs $@ LibraryCode.o
	rm LibraryCode.o

# Limpia los archivos generados
clean:
	rm -f $(EXECUTABLE) $(LIB_NAME)

.PHONY: all clean