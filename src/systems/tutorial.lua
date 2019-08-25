local tutorial = System()

function tutorial.init(_)
  love.graphics.setFont(_fonts["TUTORIAL"])
end

function tutorial.draw_ui(_)
  local y_offset = 20
  love.graphics.setColor(_constants.TEXT_COLOUR)
  local x, y = 8, love.graphics.getHeight() - 8 - y_offset
  love.graphics.print("[ s (hold) ] - reverse", x, y)
  y = y - y_offset
  love.graphics.print("[ shift (hold) ] - sharper turning", x, y)
  y = y - y_offset
  love.graphics.print("[ space (hold) ] - row stroke", x, y)
  y = y - y_offset
  love.graphics.print("[ a ] / [ d ] - move paddle right / left", x, y)
end

return tutorial
