local rowing =
  System({_components.transform, _components.controlled, _components.paddle, _components.orientation, _components.boat})

function rowing.init(_)
end

-- Prepare the world
function rowing:start_game()
  self:getInstance():addEntity(_entities.boatboy(Vector(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)))
end

--[[ TODO: Idea for better gondolier control
    -- 5 different alignments (hard-left, regular-left, straight, right, hard-right)
    -- hard-right/left are stronger turn forces, but apply less motion to the boat
    -- left/right are essentially as they are now
    -- inputting 'a'&'d' shift the current alignment left or right one, so straight -> hard settings are a double tap, etc
    -- Use these hard-right effects in places currently using isDown('lshift', 'rshift')
]]
function rowing.action_held(_, action, entity)
  local paddle = entity:get(_components.paddle)
  if action == "left" then --boat controls are inverted, this feels more natural for the not-so-boaty
    paddle:set("right")
  elseif action == "right" then
    paddle:set("left")
  else
    paddle:set("none")
  end
end

function rowing:action_pressed(action, entity)
  assert(entity:has(_components.paddle) and entity:has(_components.orientation))

  if action == "row" then
    self:row(entity)
  end
end

-- TODO: can we invert the rowing motion if holding back/s (reverse)?
function rowing.row(_, entity)
  local paddle = entity:get(_components.paddle)
  if paddle.ready then
    local direction_rowed = paddle:row()
    local orientation = entity:get(_components.orientation)

    -- apply rowing force
    entity:get(_components.boat):push()

    local angle_delta = _constants.ROW_ANGLE_DELTA

    if love.keyboard.isDown("lshift", "rshift") then
      angle_delta = angle_delta + (0.075 * math.pi)
    end

    if direction_rowed == "left" then
      orientation:adjust(angle_delta)
    elseif direction_rowed == "right" then
      orientation:adjust(-angle_delta)
    end
  end
end

function rowing:update(dt)
  for i = 1, self.pool.size do
    local e = self.pool:get(i)
    e:get(_components.paddle):update(dt)
    local orientation = e:get(_components.orientation)
    local boat = e:get(_components.boat)
    local transform = e:get(_components.transform)

    orientation:update(dt)
    boat:update(dt)

    -- TODO: think this might be different behaviour with different fps (no dt component)?
    transform.velocity = transform.velocity + (Vector.fromPolar(orientation.angle - math.pi / 2, boat.force)) * dt

    -- apply water friction
    if transform.velocity:len() > 0 then
      transform.velocity =
        transform.velocity -
        transform.velocity:normalized() * (transform.velocity:len() * _constants.WATER_FRICTION * dt)
    end
  end
end

-- TODO:
-- function rowing.crash(_, entity)
--   -- on obstacle collison
--   -- choose a random direction (left/right)
--   -- rotate orientation for some random amount
-- end

function rowing:draw_ui()
  local ROW_BAR_WIDTH = love.graphics.getWidth() * _constants.ROW_BAR_WIDTH
  local ROW_BAR_HEIGHT = love.graphics.getHeight() * _constants.ROW_BAR_HEIGHT
  for i = 1, self.pool.size do
    local paddle = self.pool:get(i):get(_components.paddle)
    love.graphics.print(
      "paddle side: " .. paddle.side,
      love.graphics.getWidth() * 0.25,
      love.graphics.getHeight() * 0.5
    )
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.rectangle(
      "fill",
      (love.graphics.getWidth() / 2) - (ROW_BAR_WIDTH / 2),
      love.graphics.getHeight() - ROW_BAR_HEIGHT,
      (ROW_BAR_WIDTH) * paddle.percentage_ready,
      ROW_BAR_HEIGHT
    )
    _util.l.resetColour()
    love.graphics.rectangle(
      "line",
      (love.graphics.getWidth() / 2) - (ROW_BAR_WIDTH / 2),
      love.graphics.getHeight() - ROW_BAR_HEIGHT,
      ROW_BAR_WIDTH,
      ROW_BAR_HEIGHT
    )

    _util.l.resetColour()
  end
end

function rowing:draw()
  local rectangle_width = 30
  local rectangle_height = 150
  for i = 1, self.pool.size do
    local e = self.pool:get(i)
    local orientation = e:get(_components.orientation)
    local position = e:get(_components.transform).position

    love.graphics.setColor(1, 0.5, 0.5, 1)

    -- push matrix
    love.graphics.push()
    -- Move object to its final destination
    love.graphics.translate(position.x, position.y)
    -- Apply rotations
    love.graphics.rotate(orientation.angle)

    -- Draw with position relative to object's centre
    love.graphics.rectangle("fill", -rectangle_width / 2, -rectangle_height / 2, rectangle_width, rectangle_height)

    -- pop matrix
    love.graphics.pop()
    _util.l.resetColour()
  end
end

return rowing
