local orientation =
  Component(
  function(e)
    e.angle = 0
  end
)

function orientation:adjust(delta)
  self.angle = self.angle + delta
end

return orientation
