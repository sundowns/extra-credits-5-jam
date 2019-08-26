local orientation =
  Component(
  function(e)
    e.angle = 0
    e.timer = Timer.new()
  end
)

function orientation:adjust(delta)
  -- https://hump.readthedocs.io/en/latest/timer.html#tweening-methods

  local change_time = _constants.ORIENTATION_CHANGE_TIME
  if love.keyboard.isDown("lshift", "rshift") then
    change_time = change_time * 1.5
  end
  self.timer:tween(change_time, self, {angle = self.angle + delta}, "out-expo")
end

function orientation:spin()
  local base_rotation = math.pi
  local random_component = love.math.random() * (2 * math.pi)
  self:adjust(base_rotation + random_component)
end

function orientation:update(dt)
  self.timer:update(dt)
  if self.angle > math.pi * 2 then
    self.angle = self.angle - math.pi * 2
  elseif self.angle < -math.pi * 2 then
    self.angle = self.angle + math.pi * 2
  end
end

return orientation
