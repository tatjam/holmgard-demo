local glm = require("glm")

function generate(tile, out)
    for i = 1, #tile do
        local info = tile[i]

        out[i].height = 100.0
        out[i].color = glm.vec3.new(0.8, 0.8, 0.8)
    end
end