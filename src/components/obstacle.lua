local obstacle =
  Component(
  function(e, type, variant)
    assert(type)
    e.type = type
    e.variant = variant or 1
  end
)

return obstacle
