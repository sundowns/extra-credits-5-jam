local rowing =
  System({_components.transform, _components.controlled, _components.paddle, _components.orientation, _components.boat})

function rowing:init()
  local CELL_SIZE = 16
  self.sprite_sheet = love.graphics.newImage("assets/SpriteSheet.png")
  self.quads = {
    ["boat"] = love.graphics.newQuad(
      1 + (2 * CELL_SIZE),
      1,
      2 * CELL_SIZE,
      4 * CELL_SIZE,
      self.sprite_sheet:getWidth(),
      self.sprite_sheet:getHeight()
    )
  }
end

-- Prepare the world
function rowing:start_game()
  self:getInstance():addEntity(_entities.boatboy(Vector(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)))
end

--[[ TODO: Idea for better gondolier control
    -- 4 different alignments (hard-left, left, right, hard-right)
    -- hard-right/left are stronger turn forces, but apply less motion to the boat
    -- left/right are essentially as they are now
    -- inputting 'a'&'d' shift the current alignment left or right one, so right -> hard-left settings are a double tap, etc
    -- Use these hard-right effects in places currently using isDown('lshift', 'rshift')
]]
function rowing.action_held(_, action, entity)
  local paddle = entity:get(_components.paddle)
  local boat = entity:get(_components.boat)
  if action == "left" then --boat controls are inverted, this feels more natural for the not-so-boaty
    paddle:set("right")
  elseif action == "right" then
    paddle:set("left")
  elseif action == "reverse" then
    boat:reverse()
  elseif action == "row" then
    assert(entity:has(_components.orientation))
    if (paddle.rowing) and paddle.side ~= "none" then
      boat:push(entity)
    else
      paddle.rowing = false
    end
  end
end

function rowing:action_released(action, entity)
  if action == "row" then
    entity:get(_components.paddle).rowing = false
    entity:get(_components.paddle).percentage_at_press = 0
  end
end

function rowing:action_pressed(action, entity)
  assert(entity:has(_components.paddle) and entity:has(_components.orientation))
  local paddle = entity:get(_components.paddle)

  if action == "row" then
    paddle.percentage_at_press = paddle.percentage_rowed
    paddle.rowing = true
    self:row(entity)
  end
end

-- TODO: can we invert the rowing motion if holding back/s (reverse)?
function rowing.row(_, entity)
  local paddle = entity:get(_components.paddle)
  local boat = entity:get(_components.boat)
  if paddle.rowing and paddle.side ~= "none" then
    local direction_rowed = paddle:row()
    local orientation = entity:get(_components.orientation)

    -- apply rowing force
    entity:get(_components.boat):push(entity)

    local angle_delta = _constants.ROW_ANGLE_DELTA

    if love.keyboard.isDown("lshift", "rshift") then
      angle_delta = angle_delta + (0.15 * math.pi)
    end

    if direction_rowed == "left" then
      if boat.is_reversing then
        orientation:adjust(-angle_delta)
      else
        orientation:adjust(angle_delta)
      end
    elseif direction_rowed == "right" then
      if boat.is_reversing then
        orientation:adjust(angle_delta)
      else
        orientation:adjust(-angle_delta)
      end
    end
  end
end

function rowing:update(dt)
  for i = 1, self.pool.size do
    local e = self.pool:get(i)
    e:get(_components.paddle):update(dt)
    local orientation = e:get(_components.orientation)
    local boat = e:get(_components.boat)
    local paddle = e:get(_components.paddle)
    local transform = e:get(_components.transform)

    orientation:update(dt)
    boat:update(dt)

    -- think this might be different behaviour with different fps (no dt component)?
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
    local e = self.pool:get(i)
    local paddle = e:get(_components.paddle)
    local boat = e:get(_components.boat)
    love.graphics.print(
      "paddle side: " .. paddle.side,
      love.graphics.getWidth() * 0.25,
      love.graphics.getHeight() * 0.5
    )
    if boat.is_reversing then
      love.graphics.print("reversing", love.graphics.getWidth() * 0.25, love.graphics.getHeight() * 0.6)
    end
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.rectangle(
      "fill",
      (love.graphics.getWidth() / 2) - (ROW_BAR_WIDTH / 2),
      love.graphics.getHeight() - ROW_BAR_HEIGHT,
      (ROW_BAR_WIDTH) * paddle.percentage_rowed,
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
  for i = 1, self.pool.size do
    local e = self.pool:get(i)
    local orientation = e:get(_components.orientation)
    local position = e:get(_components.transform).position

    _util.l.resetColour()
    -- push matrix
    love.graphics.push()
    -- Move object to its final destination
    love.graphics.translate(position.x, position.y)
    -- Apply rotations
    love.graphics.rotate(orientation.angle)

    -- Draw with position relative to object's centre
    local scale = 2
    love.graphics.draw(self.sprite_sheet, self.quads["boat"], 0, 0, 0, scale, scale)
    -- love.graphics.draw
    -- love.graphics.dr

    -- pop matrix
    love.graphics.pop()
  end
end

return rowing
