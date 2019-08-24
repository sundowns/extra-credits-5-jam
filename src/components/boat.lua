local boat =
  Component(
  function(e)
    e.force = 0
    e.is_reversing = false
    e.timer = Timer.new()
  end
)

function boat:push()
  self.timer:clear()
  self.force = _constants.BOAT_ROW_FORCE
  if self.is_reversing then
    self.force = -self.force
  end
  local base_time = 0.5
  if love.keyboard.isDown("lshift", "rshift") then
    base_time = 0.3
  end

  local random_distance_component = 0.025
  self.timer:tween(base_time + love.math.random(-1, 1) * random_distance_component, self, {force = 0})
end

function boat:update(dt)
  self.timer:update(dt)

  if not love.keyboard.isDown("s") then -- filthy hack :D
    self.is_reversing = false
  end
end

function boat:reverse()
  self.is_reversing = true
end

return boat
