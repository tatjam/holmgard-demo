cmake_minimum_required (VERSION 3.2.3)

add_compile_definitions(HOLMGARD_ENTRYPOINT="demo:entrypoint.lua")
add_compile_definitions(HOLMGARD_CORERES_LOCATION="holmgard/coreres/")
add_compile_definitions(HOLMGARD_CRASH_LEVEL=3)

# Enable plugin support
add_compile_definitions(HOLMGARD_USE_PLUGINS)
include_directories(plugin)

add_subdirectory(holmgard)

# Don't forget to add the plugin sources to holmgard!
target_sources(holmgard PRIVATE "../plugin/TestPlugin.cpp")
