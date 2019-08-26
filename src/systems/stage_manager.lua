local stage_manager = System({_components.transform, _components.obstacle, _components.dimensions, "OBSTACLES"})

function stage_manager:init()
  self.stage = nil
  self.collision_world = nil
  self.player_spawn_point = Vector(0, 0)

  self.animation_timer = Timer.new()
  self.current_whirlpool_frame = 1
  self.animation_timer:every(
    0.075,
    function()
      self.current_whirlpool_frame = self.current_whirlpool_frame + 1
      if self.current_whirlpool_frame > 4 then
        self.current_whirlpool_frame = 1
      end
    end
  )
end

function stage_manager:load_world()
  self.stage = Mappy.load("assets/stage/map1.lua")
  assert(self.collision_world, "stage_manager attempted to load stage with collision world unset")
  assert(self.stage.layers["World"], "attempted to load map without 'World' tile layer")

  if self.stage.layers["Obstacles"] then
    local object_data = self:read_object_layer(self.stage.layers["Obstacles"])
    for _, object in pairs(object_data.objects) do
      self:add_object(object)
    end
  end

  self:getInstance():addEntity(_entities.whirlpool(Vector(-256 - 64, -512)))
  self:getInstance():addEntity(_entities.soul(Vector(-256 + 64, -512)))

  self:getInstance():emit("start_game", self.player_spawn_point)
end

function stage_manager:add_object(object)
  assert(object, "stage_manager received object with no type defined")
  local position = Vector(object.x - _constants.TILE_SIZE, object.y - _constants.TILE_SIZE)

  if object.type == "goal" then
    self:getInstance():emit("set_goal", {position = position, width = object.width, height = object.height})
  elseif object.type == "spawn" then
    self.player_spawn_point = position
  elseif object.type == "whirlpool" then
    self:getInstance():addEntity(_entities.whirlpool(position))
  elseif object.type == "soul" then
    -- add lil soul mans
    print("new soul")
  else
    -- add obstacle
    self:getInstance():addEntity(_entities.obstacle(position, love.math.random(1, 3)))
  end
end

function stage_manager:update(dt)
  if self.stage then
    self.stage:update(dt)
  end

  self.animation_timer:update(dt)
end

function stage_manager:draw_background()
  if self.stage then
    _util.l.resetColour()
    self.stage.layers["World"]:draw()

    for i = 1, self.OBSTACLES.size do
      local e = self.OBSTACLES:get(i)
      local transform = e:get(_components.transform)
      local obstacle = e:get(_components.obstacle)
      local dimensions = e:get(_components.dimensions)
      if obstacle.type == "default" then
        love.graphics.draw(
          _sprites.sheet,
          _sprites.quads["obstacle"][obstacle.variant],
          transform.position.x + dimensions.width / 2,
          transform.position.y
        )
      elseif obstacle.type == "whirlpool" then
        love.graphics.draw(
          _sprites.sheet,
          _sprites.quads["whirlpool"][self.current_whirlpool_frame],
          transform.position.x + dimensions.radius,
          transform.position.y
        )
      elseif obstacle.type == "soul" then
        love.graphics.draw(
          _sprites.sheet,
          _sprites.quads["obstacle_1"],
          transform.position.x + dimensions.width / 2,
          transform.position.y
        )
      end
    end
  end
end

function stage_manager.read_tile_layer(_, layer)
  assert(layer.data)
  return {
    columns = layer.width,
    rows = layer.height,
    tiles = layer.data
  }
end

function stage_manager.read_object_layer(_, layer)
  assert(layer and layer.objects, "Received nil object layer")
  return {
    objects = layer.objects
  }
end

function stage_manager:set_collision_world(collision_world)
  self.collision_world = collision_world
end

return stage_manager
