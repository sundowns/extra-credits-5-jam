local boat =
  Component(
  function(e)
    e.force = 0
    e.timer = Timer.new()
  end
)

function boat:push()
  self.timer:clear()
  self.force = _constants.BOAT_ROW_FORCE
  local base_time = 0.5
  if love.keyboard.isDown("lshift", "rshift") then
    base_time = 0.3
  end

  local random_distance_component = 0.025
  self.timer:tween(base_time + love.math.random(-1, 1) * random_distance_component, self, {force = 0})
end

function boat:update(dt)
  self.timer:update(dt)
end

return boat
