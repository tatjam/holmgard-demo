local logger = require("logger")
require("universe")
require("renderer")
local test_plugin = require("test_plugin")

function load()
    logger.info("Hello from entrypoint")

    local ent = hgr.universe:create_object("demo:test_object.lua")
    hgr.renderer:add_table_as_drawable(ent.lua)

    test_plugin.hello_plugin()

    -- Also add the skybox
end