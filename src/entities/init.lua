local PATH = (...):gsub("%.init$", "")

return {
  boatboy = require(PATH .. ".boatboy"),
  obstacle = require(PATH .. ".obstacle"),
  goal = require(PATH .. ".goal"),
  soul = require(PATH .. ".soul"),
  whirlpool = require(PATH .. ".whirlpool")
}
