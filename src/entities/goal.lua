return function(position, width, height)
  local goal = Entity():give(_components.transform, position):give(_components.dimensions, width, height):apply()
  return goal
end
