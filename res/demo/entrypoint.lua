-- Includes
local logger = require("logger")
local assets = require("assets")
local renderer = require("renderer")
local glm = require("glm")
local test_plugin = require("test_plugin")
local toml = require("toml")

require("universe")

local cameras = require("core:camera_util.lua")

-- Create some assets
local skybox = renderer.skybox.new(assets.get_cubemap("core:black_tex.png"):move())
local sunlight = renderer.sun_light.new(hgr.renderer.quality.sun_terrain_shadow_size, hgr.renderer.quality.sun_shadow_size)

local obj

-- Initialization

-- This function is only called in the entrypoint, and is used for setting up
-- the game state the first time it launches. Afterwards, a save will be loaded
-- and only load will be called
function first_load()
    -- Setup the planetary system
    logger.info("Setting up system")

    local system_toml = assets.get_config("system/system.toml")
    system_toml:get():push_pkg()
    hgr.universe.system:load(system_toml:get().root)
    system_toml:get():restore_pkg()


end

function load()
    logger.info("Hello from entrypoint")

    -- Create an object
    obj = hgr.universe:create_object("demo:test_object.lua")

    hgr.renderer.star_pos = glm.vec3.new(100000000000.0, 0.0, 0.0)
    -- Call a C++ plugin
    test_plugin.hello_plugin()


end

-- Updating

-- Rendering

function render()
    hgr.renderer:add_drawable(skybox)
    hgr.renderer:add_drawable(obj.lua)
    hgr.renderer:add_drawable(hgr.universe.system)
    hgr.renderer:add_light(sunlight)
    hgr.renderer:render()
end

function get_camera_uniforms(width, height)
    local pos = glm.vec3.new(0, 0, 0)
    local up = glm.vec3.new(0, 1, 0)
    local dir = glm.vec3.new(1, 0, 0)
    return cameras.from_pos_and_dir(pos, up, dir, 40.0, width, height)
end