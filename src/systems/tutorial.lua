local tutorial = System()

function tutorial.init(_)
end

function tutorial.draw_ui(_)
  love.graphics.setFont(_fonts["TUTORIAL"])
  local y_offset = -20
  love.graphics.setColor(0.2, 0.2, 0.2, 0.8)
  love.graphics.rectangle("fill", 0, 0, 335, 160)
  love.graphics.setColor(_constants.COLOURS.TUTORIAL_TEXT)
  local x, y = 6, 6
  love.graphics.print("[ a ] / [ d ] - move paddle right / left", x, y)
  y = y - y_offset
  love.graphics.print("[ s (hold) ] - reverse", x, y)
  y = y - y_offset
  love.graphics.print("[ shift (hold) ] - turn sharply", x, y)
  y = y - y_offset
  love.graphics.print("[ space (hold) ] - row stroke", x, y)
  y = y - y_offset
  love.graphics.print("[ e ] - collect soul", x, y)
  y = y - y_offset
  love.graphics.print("[ enter ] - next", x, y)
end

return tutorial
