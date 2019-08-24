return function(position)
  local boatboy =
    Entity():give(_components.transform, position):give(_components.orientation):give(
    _components.controlled,
    {a = "left", d = "right", space = "row"}
  ):give(_components.paddle):give(_components.boat):give(_components.camera_target):apply()
  return boatboy
end
