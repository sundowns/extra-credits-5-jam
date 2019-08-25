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
    change_time = change_time * 1.35
  end
  self.timer:tween(change_time, self, {angle = self.angle + delta}, "out-expo")
end

function orientation:update(dt)
  self.timer:update(dt)
end

return orientation
