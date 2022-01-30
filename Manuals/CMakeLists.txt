cmake_minimum_required(VERSION 3.5)
project(Programming NONE)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules/cmake-pandocology")
include(pandocology)

add_subdirectory(Programming)
