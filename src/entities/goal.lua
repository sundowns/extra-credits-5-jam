return function(position, width, height)
  local goal =
    Entity({}):give(_components.transform, position):give(
    _components.dimensions,
    "RECTANGLE",
    {width = width, height = height}
  ):apply()
  return goal
end
