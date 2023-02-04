cmake_minimum_required(VERSION 3.14)

project(mica-de
VERSION 0.1
LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 REQUIRED Core Gui Quick)
find_package(KF5WindowSystem)

set(PROJECT_SOURCES
	src/main.cpp
	src/taskbar.cpp
        src/taskbar.h
        src/resources.qrc
        src/kickermenu.h src/kickermenu.cpp
)

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::Gui KF5::WindowSystem)
