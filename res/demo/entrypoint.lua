local logger = require("logger")
require("universe")
require("renderer")

function load()
    logger.info("Hello from entrypoint")

    local ent = osp.universe:create_entity("demo:test_entity.lua")
    osp.renderer:add_table_as_drawable(ent.lua)

    -- Also add the skybox
end