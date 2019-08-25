local paddle =
  Component(
  function(e)
    e.last_side = "none"
    e.side = "none"
    e.reverse = false
    e.rowing = false
    e.percentage_rowed = 0
    e.percentage_at_press = 0
    e.ready = true
    e.percentage_ready = 1
    e.timer = Timer.new()
  end
)

function paddle:set(new_side)
  self.last_side = self.side
  self.side = new_side
end

function paddle:update(dt)
  self.timer:update(dt)
  if not self.rowing and self.percentage_rowed > 0 then
    self.percentage_rowed = self.percentage_rowed - 1 / _constants.PADDLE_MAX_STEPS
  elseif self.rowing and self.percentage_rowed < 1 then
    self.percentage_rowed = self.percentage_rowed + 1 / _constants.PADDLE_MAX_STEPS
  end

  if self.percentage_rowed >= 1 then
    self.rowing = false
  elseif self.percentage_rowed < 0 then
    self.percentage_rowed = 0
  end
end

function paddle:row()
  self.ready = false
  self.percentage_ready = 0
  self.timer:clear()

  self.timer:script(
    function(wait)
      local total_steps = 2
      local step = _constants.ROW_COOLDOWN / total_steps
      for _ = 1, total_steps do
        wait(step)
        self.percentage_ready = self.percentage_ready + 1 / total_steps
      end
      self.ready = true
    end
  )

  return self.side
end

return paddle
