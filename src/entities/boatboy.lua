return function(position)
  local BOAT_WIDTH = 26 -- 32
  local BOAT_HEIGHT = 56 -- 64
  local boatboy =
    Entity():give(_components.transform, position):give(_components.orientation):give(
    _components.controlled,
    {a = "left", d = "right", s = "reverse", space = "row"}
  ):give(_components.paddle):give(_components.boat):give(_components.camera_target):give(
    _components.collides,
    BOAT_WIDTH,
    BOAT_HEIGHT,
    Vector(3, 10)
  ):give(_components.dimensions, BOAT_WIDTH, BOAT_HEIGHT):apply()
  return boatboy
end
