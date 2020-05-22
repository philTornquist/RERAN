cmake_minimum_required(VERSION 2.8)
find_package(Java REQUIRED)
include(UseJava)

project(src)
add_executable( replay src/replay.c )
add_jar( RERANTranslate src/Translate.java OUTPUT_DIR ${PROJECT_BINARY_DIR} )