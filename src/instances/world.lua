local world = Instance()

-- ADD SYSTEMS

-- world:addSystem(input, "keypressed")
-- world:addSystem(input, "keyreleased")
-- world:addSystem(input, "mousepressed")
-- world:addSystem(input, "mousereleased")
-- world:addSystem(input, "update")

-- ENABLE SYSTEMS

-- world:enableSystem(input, "keypressed")
-- world:enableSystem(input, "keyreleased")
-- world:enableSystem(input, "mousepressed")
-- world:enableSystem(input, "mousereleased")

function world.enable_updates()
  -- world:enableSystem(input, "update")
end

function world.disable_updates()
  -- world:disableSystem(input, "update")
end

world.enable_updates()

return world
