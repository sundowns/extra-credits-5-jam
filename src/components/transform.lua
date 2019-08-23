local transform =
  Component(
  function(e, position)
    assert(position and position.x and position.y, "Transform component received a non-vector position on creation")
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
