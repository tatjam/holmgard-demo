local logger = require("logger")
require("universe")
require("renderer")

function load()
    logger.info("Hello from entrypoint")

    local ent = hgr.universe:create_entity("demo:test_entity.lua")
    hgr.renderer:add_table_as_drawable(ent.lua)

    -- Also add the skybox
end