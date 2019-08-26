return function(position, index)
  local soul =
    Entity():give(_components.transform, position):give(_components.collides, 32, 32, Vector(32, 16)):give(
    _components.dimensions,
    "RECTANGLE",
    {width = 32, height = 32}
  ):give(_components.obstacle, "soul"):give(_components.dialogue, love.graphics.newImage("assets/soul.png"), index):apply(

  )
  return soul
end
