local collider = System({_components.collides, _components.transform, _components.dimensions, "ALL"})

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
  -- self.collision_world:add(collides, position.x, position.y, collides.width, collides.height)

  collides:set_hitbox(self.collision_world:rectangle(position.x, position.y, collides.width, collides.height))
end

function collider:entityRemoved(e)
  self.collision_world:remove(e:get(_components.collides))
end

function collider:update(_)
  for i = 1, self.ALL.size do
    local e = self.ALL:get(i)
    self:update_entity(e)
  end
end

function collider:draw()
  love.graphics.setColor(1, 0, 0)
  for i = 1, self.ALL.size do
    local collides = self.ALL:get(i):get(_components.collides)
    if collides.hitbox then
      collides.hitbox:draw()
      local position = self.ALL:get(i):get(_components.transform).position
      love.graphics.points(position.x, position.y)
    end
  end
  -- love.graphics.setLineWidth(1)
  -- local items, _ = self.collision_world:getItems()
  -- for i = #items, 1, -1 do
  --   love.graphics.rectangle("line", self.collision_world:getRect(items[i]))
  -- end
  _util.l.resetColour()
end

-- Used to moving tiles & hazards (only hazards are used)
function collider.update_entity(_, e)
  local position = e:get(_components.transform).position
  local collides = e:get(_components.collides)
  -- local dimensions = e:get(_components.dimensions)

  if collides.hitbox then
    collides.hitbox:moveTo(position.x, position.y)
    if e:has(_components.orientation) then
      collides.hitbox:setRotation(e:get(_components.orientation).angle)
    end
  end
end

return collider
