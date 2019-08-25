local PATH = (...):gsub("%.init$", "")

return {
  boatboy = require(PATH .. ".boatboy"),
  obstacle = require(PATH .. ".obstacle"),
  goal = require(PATH .. ".goal"),
  whirlpool = require(PATH .. ".whirlpool")
}
