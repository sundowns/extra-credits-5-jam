local paddle =
  Component(
  function(e)
    e.last_side = "none"
    e.side = "none"
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
end

function paddle:row()
  self.ready = false
  self.percentage_ready = 0
  self.timer:clear()

  self.timer:script(
    function(wait)
      local total_steps = 20
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
