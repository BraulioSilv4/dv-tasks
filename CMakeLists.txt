cmake_minimum_required(VERSION 3.8)
project(recrutas_tarefa)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

# add executable
add_executable(hello_world src/hello_world.cpp)

# link executable to libraries
ament_target_dependencies(
  hello_world 
  rclcpp
  std_msgs
)

install(TARGETS hello_world
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()
