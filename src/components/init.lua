local PATH = (...):gsub("%.init$", "")

return {
  transform = require(PATH .. ".transform"),
  player = require(PATH .. ".player")
}
