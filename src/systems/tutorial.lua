local tutorial = System()

function tutorial:init()
  self.font = love.graphics.newFont(16)
  love.graphics.setFont(self.font)
end

function tutorial.draw_ui(_)
  local y_offset = 20
  love.graphics.setColor(_constants.TEXT_COLOUR)
  local x, y = 8, love.graphics.getHeight() - 8 - y_offset
  love.graphics.print("[shift (held)] - sharper turning", x, y)
  y = y - y_offset
  love.graphics.print("[space] - row (hold for power)", x, y)
  y = y - y_offset
  love.graphics.print("[a] - move paddle left", x, y)
  y = y - y_offset
  love.graphics.print("[d] - move paddle right", x, y)
end

return tutorial
