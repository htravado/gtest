cmake_minimum_required(VERSION 3.13)
project(TuProyecto)

# Especificar que se usará C++11
set(CMAKE_CXX_STANDARD 11)

# Incluir Google Test
enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(include_directories(${CMAKE_SOURCE_DIR}/include))
include_directories(include_directories(${CMAKE_SOURCE_DIR}/lib/include))

# Añadir la biblioteca
add_library(library_code STATIC lib/source/LibraryCode.cpp)

# Añadir el ejecutable principal
add_executable(main source/main.cpp)
target_link_libraries(main library_code)

# Añadir el ejecutable de pruebas
add_executable(testRunner test/test.cpp)
target_link_libraries(testRunner library_code ${GTEST_LIBRARIES})

# Registrar las pruebas
add_test(NAME MyTests COMMAND testRunner)