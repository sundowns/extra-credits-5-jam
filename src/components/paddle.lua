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
    e.timer_color = {1, 0, 0, 1}
    e.min_rowing_angle_offset = -math.pi / 16
    e.max_rowing_angle_offset = math.pi / 6
    e.rowing_angle_offset = e.min_rowing_angle_offset
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

  self.timer_color = {1 - self.percentage_ready, self.percentage_ready, 0, 1}
end

function paddle:row(instance)
  self.ready = false
  self.percentage_ready = 0
  self.timer:clear()

  self.timer:script(
    function(wait)
      local total_steps = 5
      local step = _constants.ROW_COOLDOWN / total_steps
      for _ = 1, total_steps do
        wait(step)
        self.percentage_ready = self.percentage_ready + 1 / total_steps
        self.timer_color = {1 - self.percentage_ready, self.percentage_ready, 0, 1}
      end
      self.ready = true
    end
  )

  self.timer:tween(_constants.ROW_COOLDOWN, self, {rowing_angle_offset = self.max_rowing_angle_offset})
  self.timer:after(
    _constants.ROW_COOLDOWN,
    function()
      self.rowing_angle_offset = self.min_rowing_angle_offset
    end
  )

  local has_broadcasted = false
  local time_elapsed = 0
  self.timer:every(
    _constants.ROW_COOLDOWN / 10,
    function()
      time_elapsed = time_elapsed + _constants.ROW_COOLDOWN / 10
      if has_broadcasted then
        return
      end
      if not love.keyboard.isDown("space") then -- yeee haw
        if time_elapsed < 0.3 then
          instance:emit("row", "little")
          has_broadcasted = true
        elseif time_elapsed <= 0.8 then
          instance:emit("row", "medium")
          has_broadcasted = true
        else
          instance:emit("row", "big")
          has_broadcasted = true
        end
      end
    end
  )

  return self.side
end

return paddle
