local dimensions =
  Component(
  function(e, type, details)
    assert(type)
    assert(details)
    e.type = type
    if type == "RECTANGLE" then
      assert(details.width and details.height, "Received invalid rectangle dimensions")
      e.height = details.height
      e.width = details.width
    elseif type == "CIRCLE" then
      assert(details.radius, "Received invalid circle dimensions")
      e.radius = details.radius
    else
      assert(false, "Received unknown dimension type: " .. type)
    end
  end
)

return dimensions
