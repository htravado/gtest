# Variables
CXX = g++
CXXFLAGS = -Wall -g $(INCLUDE)
INCLUDE = -I lib/include
LIB_SRC = lib/source/LibraryCode.cpp
LIB_HEADER = lib/include/LibraryCode.h
MAIN_SRC = source/main.cpp
LIB_NAME = libLibrary.a
EXECUTABLE = main
TEST_SRC = test/test.cpp
TEST_EXECUTABLE = testRunner

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

# Compila los tests
$(TEST_EXECUTABLE): $(TEST_SRC) $(LIB_NAME)
	$(CXX) $(CXXFLAGS) -o $@ $< -L. -lLibrary -lgtest -lgtest_main -lgmock -lpthread

# Regla para ejecutar los tests
test: $(TEST_EXECUTABLE)

runtest: test
	./$(TEST_EXECUTABLE)

# Limpia los archivos generados
clean:
	rm -f $(EXECUTABLE) $(LIB_NAME)

.PHONY: all clean