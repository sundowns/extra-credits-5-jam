local obstacle =
  Component(
  function(e, type, variant)
    assert(type)
    assert(variant)
    e.type = type
    e.variant = variant
  end
)

return obstacle
