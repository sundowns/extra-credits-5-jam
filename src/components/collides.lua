local collides =
  Component(
  function(e, width, height, offset)
    assert(type, "missing type for collides component")
    e.width = width
    e.height = height
    e.offset = offset or Vector(0, 0)
    e.hitbox = nil
  end
)

function collides:set_hitbox(hitbox)
  assert(hitbox)
  self.hitbox = hitbox
end

return collides
