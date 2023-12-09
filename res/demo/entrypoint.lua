local logger = require("logger")
local assets = require("assets")
local renderer = require("renderer")
local glm = require("glm")
local test_plugin = require("test_plugin")
require("universe")

local skybox = renderer.skybox.new(assets.get_cubemap("core:notex.png"):move())
local sunlight = renderer.sun_light.new(hgr.renderer.quality.sun_terrain_shadow_size, hgr.renderer.quality.sun_shadow_size)

local cameras = require("core:camera_util.lua")

function load()
    logger.info("Hello from entrypoint")

    local ent = hgr.universe:create_object("demo:test_object.lua")
    hgr.renderer:add_drawable(skybox)
    hgr.renderer:add_table_as_drawable(ent.lua)
    hgr.renderer:add_light(sunlight)

    test_plugin.hello_plugin()

    -- Also add the skybox
end

function render()
    hgr.renderer:render()
end

function get_camera_uniforms(width, height)
    local pos = glm.vec3.new(0, 0, 0)
    local up = glm.vec3.new(0, 1, 0)
    local dir = glm.vec3.new(1, 0, 0)
    return cameras.from_pos_and_dir(pos, up, dir, 40.0, width, height)
end