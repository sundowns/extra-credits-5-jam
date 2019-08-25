local paddle =
  Component(
  function(e)
    e.last_side = "none"
    e.side = "none"
    e.reverse = false
    e.rowing = false
    e.percentage_rowed = 0
    e.percentage_at_press = 0
  end
)

function paddle:set(new_side)
  self.last_side = self.side
  self.side = new_side
end

function paddle:update(dt)
  if not self.rowing and self.percentage_rowed > 0 then
    self.percentage_rowed = self.percentage_rowed - 1 / _constants.PADDLE_MAX_STEPS
  elseif self.rowing and self.percentage_rowed < 1 then
    self.percentage_rowed = self.percentage_rowed + 1 / _constants.PADDLE_MAX_STEPS
  elseif self.percentage_rowed < 0 then
    self.percentage_rowed = 0
  end
end

function paddle:row()
  return self.side
end

return paddle
