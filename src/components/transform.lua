local transform =
  Component(
  function(e, position, velocity)
    assert(position and position.x and position.y, "Transform component received a non-vector position on creation")
    if not velocity then
      e.velocity = Vector(0, 0)
    else
      assert(velocity.x and velocity.y, "Transform component received a non-vector velocity on creation")
      e.velocity = velocity
    end
    e.position = position
  end
)

function transform:setPosition(position)
  assert(position.x and position.y, "Transform component received a non-vector position when setting position")
  self.position = position
end

function transform:translate(dx, dy)
  self.position = Vector(self.position.x + dx, self.position.y + dy)
end

return transform
