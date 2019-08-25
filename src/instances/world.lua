local world = Instance()

local input = _systems.input()
local rowing = _systems.rowing()
local motion = _systems.motion()
local camera = _systems.camera()
local collider = _systems.collider()
local stage_manager = _systems.stage_manager()

-- ADD SYSTEMS

world:addSystem(input, "keypressed")
world:addSystem(input, "keyreleased")
world:addSystem(input, "mousepressed")
world:addSystem(input, "mousereleased")
world:addSystem(input, "update")

world:addSystem(rowing, "start_game")
world:addSystem(rowing, "action_pressed")
world:addSystem(rowing, "action_held")
world:addSystem(rowing, "update")
world:addSystem(rowing, "draw")
world:addSystem(rowing, "draw_ui")

world:addSystem(motion, "update")

world:addSystem(camera, "attach")
world:addSystem(camera, "detach")
world:addSystem(camera, "update")
world:addSystem(camera, "toggle_fullscreen")

world:addSystem(collider, "update")
world:addSystem(collider, "set_collision_world")
world:addSystem(collider, "draw")

world:addSystem(stage_manager, "load_world")

-- ENABLE SYSTEMS

world:enableSystem(input, "keypressed")
world:enableSystem(input, "keyreleased")
world:enableSystem(input, "mousepressed")
world:enableSystem(input, "mousereleased")

world:enableSystem(rowing, "start_game")
world:enableSystem(rowing, "action_pressed")
world:enableSystem(rowing, "action_held")
world:enableSystem(rowing, "draw")
world:enableSystem(rowing, "draw_ui")

world:enableSystem(camera, "attach")
world:enableSystem(camera, "detach")
world:enableSystem(camera, "toggle_fullscreen")

world:enableSystem(collider, "set_collision_world")
world:enableSystem(collider, "draw")

world:enableSystem(stage_manager, "load_world")

function world.enable_updates()
  world:enableSystem(rowing, "update")
  world:enableSystem(motion, "update")
  world:enableSystem(camera, "update")
  world:enableSystem(collider, "update")
end

function world.disable_updates()
  world:disableSystem(rowing, "update")
  world:disableSystem(motion, "update")
  world:disableSystem(camera, "update")
  world:disableSystem(collider, "update")
end

world.enable_updates()

return world
