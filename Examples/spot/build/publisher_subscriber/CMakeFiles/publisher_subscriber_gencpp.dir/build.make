# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/user1/nuitrack-sdk/Examples/spot/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/user1/nuitrack-sdk/Examples/spot/build

# Utility rule file for publisher_subscriber_gencpp.

# Include the progress variables for this target.
include publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/progress.make

publisher_subscriber_gencpp: publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/build.make

.PHONY : publisher_subscriber_gencpp

# Rule to build all files generated by this target.
publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/build: publisher_subscriber_gencpp

.PHONY : publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/build

publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/clean:
	cd /home/user1/nuitrack-sdk/Examples/spot/build/publisher_subscriber && $(CMAKE_COMMAND) -P CMakeFiles/publisher_subscriber_gencpp.dir/cmake_clean.cmake
.PHONY : publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/clean

publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/depend:
	cd /home/user1/nuitrack-sdk/Examples/spot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user1/nuitrack-sdk/Examples/spot/src /home/user1/nuitrack-sdk/Examples/spot/src/publisher_subscriber /home/user1/nuitrack-sdk/Examples/spot/build /home/user1/nuitrack-sdk/Examples/spot/build/publisher_subscriber /home/user1/nuitrack-sdk/Examples/spot/build/publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : publisher_subscriber/CMakeFiles/publisher_subscriber_gencpp.dir/depend

