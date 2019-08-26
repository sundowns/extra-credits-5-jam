love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";lib/?.lua;lib/;")
_debug = false

local _instances = nil -- should not have visbility of each other...

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest", 4)
  -- Globals
  Vector = require("libs.vector")
  _dialogue = require("src.dialogue")
  _constants = require("src.constants")
  _util = require("libs.util")
  ripple = require("libs.ripple")
  HC = require("libs.hardoncollider")
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
  Camera = require("libs.camera")
  Mappy = require("libs.mappy")
  Talkies = require("libs.talkies")

  _fonts = {
    ["VICTORY"] = love.graphics.newFont("assets/Needleteeth Psycho.ttf", 100),
    ["DIALOGUE"] = love.graphics.newFont("assets/TravelingTypewriter.ttf", 32),
    ["TUTORIAL"] = love.graphics.newFont("assets/TravelingTypewriter.ttf", 16)
  }

  _components = require("src.components")
  _entities = require("src.entities")
  _systems = require("src.systems")
  _instances = require("src.instances")

  _sprites = require("src.sprites")

  love.graphics.setBackgroundColor(0.1, 0.1, 0.1)

  --https://hc.readthedocs.io/en/latest/MainModule.html#initialization
  _instances.world:emit("set_collision_world", HC.new(48))

  _instances.world:emit("load_world")
end

function love.update(dt)
  _instances.world:emit("update", dt)
  Timer.update(dt)
end

function love.draw()
  _instances.world:emit("attach")
  _instances.world:emit("draw_background")
  _instances.world:emit("draw")
  _instances.world:emit("detach")
  _instances.world:emit("draw_ui")

  if _debug then
    _util.l.renderStats(0, 0)
  end
end

function love.keypressed(key)
  if key == "f1" then
    _debug = not _debug
  elseif key == "escape" then
    love.event.quit() -- TODO: remove
  elseif key == "r" then
    love.event.quit("restart") -- TODO: remove
  elseif key == "return" then
    if love.keyboard.isDown("lalt", "ralt") then
      _instances.world:emit("toggle_fullscreen", not love.window.getFullscreen())
    end
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
