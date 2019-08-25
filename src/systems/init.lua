local PATH = (...):gsub("%.init$", "")

return {
  input = require(PATH .. ".input"),
  rowing = require(PATH .. ".rowing"),
  motion = require(PATH .. ".motion"),
  camera = require(PATH .. ".camera"),
  collider = require(PATH .. ".collider"),
  stage_manager = require(PATH .. ".stage_manager"),
  audio_manager = require(PATH .. ".audio_manager"),
  victory = require(PATH .. ".victory")
}
