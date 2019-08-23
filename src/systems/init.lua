local PATH = (...):gsub("%.init$", "")

return {
  input = require(PATH .. ".input")
}
