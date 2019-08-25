return function(position)
  local whirlpool =
    Entity():give(_components.transform, position):give(_components.collides, 32, 32, Vector(32, 16)):give(
    _components.dimensions,
    "CIRCLE",
    {radius = 8}
  ):give(_components.obstacle, "whirlpool"):apply()
  return whirlpool
end
