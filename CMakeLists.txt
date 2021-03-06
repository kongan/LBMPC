# This project uses CMake
# To build ('out-of-place' build):
#   cd lbmpc
#   mkdir build
#   cd build
#   cmake ../
#   make VERBOSE=1
project(lbmpc)
cmake_minimum_required(VERSION 2.4.6)
set(CMAKE_BUILD_TYPE Release)
#include(cmake/check_sse.cmake)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

FIND_PACKAGE(Eigen3 REQUIRED)

include_directories(${EIGEN3_INCLUDE_DIR})
include_directories(${PROJECT_SOURCE_DIR}/include)

add_definitions(-DMAX_PREDICTION_HORIZON=$ENV{N_MPC_STEPS})
add_definitions(-DN_MPC_STEPS=$ENV{N_MPC_STEPS})

add_executable(example0 src/example0.cpp)
add_executable(qr_example_N$ENV{N_MPC_STEPS} src/qr_example.cpp)

add_executable(qr_example_decoupled_N$ENV{N_MPC_STEPS} src/qr_example_decoupled.cpp)
target_link_libraries(qr_example_decoupled_N$ENV{N_MPC_STEPS} rt)

include(cmake/log_cmake_variables.cmake)