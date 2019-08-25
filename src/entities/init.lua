local PATH = (...):gsub("%.init$", "")

return {
  boatboy = require(PATH .. ".boatboy"),
  obstacle = require(PATH .. ".obstacle")
}
