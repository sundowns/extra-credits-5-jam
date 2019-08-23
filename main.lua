love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";lib/?.lua;lib/;")
_debug = false

local _instances = nil -- should not have visbility of each other...

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest", 0)
  -- Globals
  Vector = require("libs.vector")
  _constants = require("src.constants")
  _util = require("libs.util")
  resources = require("libs.cargo").init("resources")
  ECS =
    require("libs.concord").init(
    {
      useEvents = false
    }
  )
  Component = require("libs.concord.component")
  Entity = require("libs.concord.entity")
  Instance = require("libs.concord.instance")
  System = require("libs.concord.system")
  Timer = require("libs.timer")

  _components = require("src.components")
  _entities = require("src.entities")
  _systems = require("src.systems")
  _instances = require("src.instances")

  _instances.world:emit("start_game")
end

function love.update(dt)
  _instances.world:emit("update", dt)
end

function love.draw()
  _instances.world:emit("attach_lighting")
  _instances.world:emit("attach")
  _instances.world:emit("draw")
  _instances.world:emit("detach")
  _instances.world:emit("detach_lighting")
  _instances.world:emit("draw_debug")
  _instances.world:emit("draw_ui")
end

function love.keypressed(key)
  if key == "f1" then
    _debug = not _debug
  elseif key == "escape" then
    love.event.quit()
  elseif key == "r" then
    love.event.quit("restart")
  end

  _instances.world:emit("keypressed", key)
end

function love.keyreleased(key)
  _instances.world:emit("keyreleased", key)
end

function love.mousepressed(x, y, button, _, _)
  _instances.world:emit("mousepressed", x, y, button)
end

function love.mousereleased(x, y, button, _, _)
  _instances.world:emit("mousereleased", x, y, button)
end
