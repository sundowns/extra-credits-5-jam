local world = Instance()

local input = _systems.input()
local rowing = _systems.rowing()
local motion = _systems.motion()
local camera = _systems.camera()
local collider = _systems.collider()
local stage_manager = _systems.stage_manager()
local audio_manager = _systems.audio_manager()
local dialogue_manager = _systems.dialogue_manager()
local victory = _systems.victory()
local tutorial = _systems.tutorial()

-- ADD SYSTEMS

world:addSystem(input, "keypressed")
world:addSystem(input, "keyreleased")
world:addSystem(input, "mousepressed")
world:addSystem(input, "mousereleased")
world:addSystem(input, "update")

world:addSystem(rowing, "start_game")
world:addSystem(rowing, "action_pressed")
world:addSystem(rowing, "action_released")
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
world:addSystem(collider, "action_released")
world:addSystem(collider, "checkForSoul")

world:addSystem(stage_manager, "load_world")
world:addSystem(stage_manager, "draw_background")
world:addSystem(stage_manager, "update")
world:addSystem(stage_manager, "set_collision_world")
world:addSystem(stage_manager, "remove_soul")
world:addSystem(stage_manager, "draw")

world:addSystem(audio_manager, "update")
world:addSystem(audio_manager, "victory")
world:addSystem(audio_manager, "row")

world:addSystem(dialogue_manager, "update")
world:addSystem(dialogue_manager, "draw_ui")
world:addSystem(dialogue_manager, "action_released")
world:addSystem(dialogue_manager, "start_dialogue")

world:addSystem(victory, "update")
world:addSystem(victory, "draw_ui")
world:addSystem(victory, "set_goal")
world:addSystem(victory, "draw")
world:addSystem(victory, "remove_soul")

world:addSystem(tutorial, "draw_ui")

-- ENABLE SYSTEMS

world:enableSystem(input, "keypressed")
world:enableSystem(input, "keyreleased")
world:enableSystem(input, "mousepressed")
world:enableSystem(input, "mousereleased")

world:enableSystem(rowing, "start_game")
world:enableSystem(rowing, "action_pressed")
world:enableSystem(rowing, "action_released")
world:enableSystem(rowing, "action_held")
world:enableSystem(rowing, "draw")
world:enableSystem(rowing, "draw_ui")

world:enableSystem(camera, "attach")
world:enableSystem(camera, "detach")
world:enableSystem(camera, "toggle_fullscreen")

world:enableSystem(collider, "set_collision_world")
world:enableSystem(collider, "draw")
world:enableSystem(collider, "action_released")
world:enableSystem(collider, "checkForSoul")

world:enableSystem(stage_manager, "load_world")
world:enableSystem(stage_manager, "draw_background")
world:enableSystem(stage_manager, "set_collision_world")
world:enableSystem(stage_manager, "remove_soul")
world:enableSystem(stage_manager, "draw")

world:enableSystem(audio_manager, "victory")
world:enableSystem(audio_manager, "row")

world:enableSystem(dialogue_manager, "update")
world:enableSystem(dialogue_manager, "draw_ui")
world:enableSystem(dialogue_manager, "action_released")
world:enableSystem(dialogue_manager, "start_dialogue")

world:enableSystem(victory, "draw_ui")
world:enableSystem(victory, "draw")
world:enableSystem(victory, "set_goal")
world:enableSystem(victory, "remove_soul")

world:enableSystem(tutorial, "draw_ui")

function world.enable_updates()
  world:enableSystem(rowing, "update")
  world:enableSystem(motion, "update")
  world:enableSystem(camera, "update")
  world:enableSystem(collider, "update")
  world:enableSystem(stage_manager, "update")
  world:enableSystem(audio_manager, "update")
  world:enableSystem(dialogue_manager, "update")
  world:enableSystem(victory, "update")
end

function world.disable_updates()
  world:disableSystem(rowing, "update")
  world:disableSystem(motion, "update")
  world:disableSystem(camera, "update")
  world:disableSystem(collider, "update")
  world:disableSystem(stage_manager, "update")
  world:disableSystem(audio_manager, "update")
  world:disableSystem(dialogue_manager, "update")
  world:disableSystem(victory, "update")
end

world.enable_updates()

return world
