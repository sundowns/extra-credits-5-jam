local PATH = (...):gsub("%.init$", "")

return {
  transform = require(PATH .. ".transform"),
  controlled = require(PATH .. ".controlled"),
  orientation = require(PATH .. ".orientation"),
  paddle = require(PATH .. ".paddle"),
  boat = require(PATH .. ".boat"),
  dialogue = require(PATH .. ".dialogue"),
  camera_target = require(PATH .. ".camera_target"),
  collides = require(PATH .. ".collides"),
  dimensions = require(PATH .. ".dimensions"),
  inventory = require(PATH .. ".inventory"),
  obstacle = require(PATH .. ".obstacle")
}
