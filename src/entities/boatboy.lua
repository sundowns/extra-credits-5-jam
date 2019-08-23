return function(position)
  local player =
    Entity():give(_components.transform, position):give(_components.orientation):give(
    _components.controlled,
    {a = "left", d = "right", space = "row"}
  ):apply()
  return player
end
