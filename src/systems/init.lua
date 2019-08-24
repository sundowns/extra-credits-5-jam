local PATH = (...):gsub("%.init$", "")

return {
  input = require(PATH .. ".input"),
  rowing = require(PATH .. ".rowing"),
  motion = require(PATH .. ".motion"),
  camera = require(PATH .. ".camera"),
  sprite_renderer = require(PATH .. ".sprite_renderer")
}
