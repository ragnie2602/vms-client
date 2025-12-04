cmake_minimum_required(VERSION 3.14)

set(LIBRARY_NAME "ffmpeg_job_object")

# Create static library
add_library(${LIBRARY_NAME} STATIC "../ffmpeg_job_object.cpp")

apply_standard_settings(${LIBRARY_NAME})

target_include_directories(${LIBRARY_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/..")

target_link_libraries(${LIBRARY_NAME} PRIVATE flutter flutter_wrapper_plugin)