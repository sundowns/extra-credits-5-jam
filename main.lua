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
end

function love.update(dt)
end

function love.draw()
  love.graphics.print("Extra credits jam!")
end

function love.keypressed(key)
  if key == "f1" then
    _debug = not _debug
  elseif key == "escape" then
    love.event.quit()
  elseif key == "r" then
    love.event.quit("restart")
  end
end

function love.resize(w, h)
  _instances.world:emit("resize", w, h)
end
