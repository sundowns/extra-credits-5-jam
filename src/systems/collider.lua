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
  _util.l.resetColour()
end

-- Used to moving tiles & hazards (only hazards are used)
function collider.update_entity(_, e)
  local position = e:get(_components.transform).position
  local collides = e:get(_components.collides)
  local dimensions = e:get(_components.dimensions)

  if collides.hitbox then
    collides.hitbox:moveTo(position.x + dimensions.width / 2, position.y + dimensions.height / 2)
    -- collider.hitbox:move() -- translate it first
    if e:has(_components.orientation) then
      collides.hitbox:setRotation(e:get(_components.orientation).angle, dimensions.width / 2, dimensions.height / 2)

    -- collides.hitbox:rotate(math.pi / 2, position.x, position.y)
    end
  end
end

-- function calculateProjectileHitbox(x1, y1, velocity, width, height)
--   local angle = velocity:angleTo()
--   local perpendicularAngle = velocity:perpendicular():angleTo()
--   local x2 = x1 + (width * math.cos(angle))
--   local y2 = y1 + (width * math.sin(angle))
--   local x3 = x1 + (height * math.cos(perpendicularAngle)) --idk why +1.5 radians is the perpendicular but hey, it works
--   local y3 = y1 + (height * math.sin(perpendicularAngle))
--   local x4 = x3 + (x2 - x1) -- x3 + the difference between x1 and x2
--   local y4 = y3 + (y2 - y1)

--   return x1, y1, x2, y2, x4, y4, x3, y3 -- vertices in clockwise order
-- end

return collider
