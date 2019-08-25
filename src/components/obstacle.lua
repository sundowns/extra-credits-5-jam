local obstacle =
  Component(
  function(e, type)
    assert(type)
    e.type = type
  end
)

return obstacle
