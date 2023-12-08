cmake_minimum_required (VERSION 3.2.3)

add_compile_definitions(HOLMGARD_ENTRYPOINT="demo:entrypoint.lua")
add_compile_definitions(HOLMGARD_CORERES_LOCATION="holmgard/coreres/")
add_compile_definitions(HOLMGARD_CRASH_LEVEL=3)

add_subdirectory(holmgard)
