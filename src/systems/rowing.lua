local rowing = System({_components.transform, _components.controlled, _components.paddle, _components.orientation})

function rowing.init(_)
end

function rowing:update(dt)
  for i = 1, self.pool.size do
    self.pool:get(i):get(_components.paddle):update(dt)
  end
end

function rowing:start_game()
  -- local boatboy = _entities.boatboy(Vector(love.graphics.getWidth() / 4, love.graphics.getHeight() / 3))
  self:getInstance():addEntity(
    _entities.boatboy(Vector(love.graphics.getWidth() / 2, love.graphics.getHeight() * 3 / 4))
  )
end

function rowing.action_held(_, _, _)
end

function rowing:action_pressed(action, entity)
  assert(entity:has(_components.paddle) and entity:has(_components.orientation))

  local paddle = entity:get(_components.paddle)
  if action == "left" or action == "right" then
    paddle:set(action)
  elseif action == "row" then
    self:row(entity)
  end
end

function rowing:row(entity)
  local paddle = entity:get(_components.paddle)
  if paddle.ready then
    paddle:row()
  end
end

function rowing:draw()
  local ROW_BAR_WIDTH = love.graphics.getWidth() * _constants.ROW_BAR_WIDTH
  local ROW_BAR_HEIGHT = love.graphics.getHeight() * _constants.ROW_BAR_HEIGHT
  for i = 1, self.pool.size do
    local paddle = self.pool:get(i):get(_components.paddle)
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

return rowing
