local collider =
  System(
  {_components.collides, _components.transform, _components.dimensions, "ALL"},
  {_components.collides, _components.transform, _components.dimensions, _components.controlled, "PLAYER"}
)

function collider:init()
  self.collision_world = nil
end

function collider:set_collision_world(collision_world)
  self.collision_world = collision_world
end

function collider:entityAdded(e)
  local position = e:get(_components.transform).position
  local collides = e:get(_components.collides)
  -- TODO: just rectangles for now (do we need anything else?)

  collides:set_hitbox(
    self.collision_world:rectangle(
      position.x + collides.offset.x,
      position.y + collides.offset.y,
      collides.width,
      collides.height
    )
  )
end

function collider:entityRemoved(e)
  self.collision_world:remove(e:get(_components.collides))
end

function collider:update(_)
  for i = 1, self.ALL.size do
    self:update_entity(self.ALL:get(i))
  end

  for i = 1, self.PLAYER.size do
    local player = self.PLAYER:get(i)
    local collides = player:get(_components.collides)
    local transform = player:get(_components.transform)
    for shape, delta in pairs(self.collision_world:collisions(collides.hitbox)) do
      if shape.type then
        print(shape.type)
      end
      collides.hitbox:move(delta.x, delta.y)
      transform:translate(delta.x, delta.y)
    end
  end
end

function collider:draw()
  if not _debug then
    return
  end

  love.graphics.setColor(1, 0, 0)
  for i = 1, self.ALL.size do
    local collides = self.ALL:get(i):get(_components.collides)
    if collides.hitbox then
      collides.hitbox:draw()

      local position = self.ALL:get(i):get(_components.transform).position
      love.graphics.circle("fill", position.x + collides.offset.x, position.y + collides.offset.y, 3)
    end
  end
  _util.l.resetColour()
end

-- Used to moving tiles & hazards (only hazards are used)
function collider.update_entity(_, e)
  local position = e:get(_components.transform).position
  local collides = e:get(_components.collides)
  local dimensions = e:get(_components.dimensions)

  if collides.hitbox then
    collides.hitbox:moveTo(position.x + collides.offset.x, position.y + collides.offset.y)
    if e:has(_components.orientation) then
      collides.hitbox:move(-dimensions.width, -dimensions.height) -- translate by origin
      collides.hitbox:setRotation(e:get(_components.orientation).angle, 0, 0) -- rotate
      collides.hitbox:move(dimensions.width, dimensions.height) -- translate back
    end
  end
end

return collider
