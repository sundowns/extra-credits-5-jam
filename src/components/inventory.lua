local inventory =
  Component(
  function(e)
    e.souls = {}
  end
)

function inventory:addSoul(e)
  table.insert(self.souls, e)
end

function inventory:removeSoul(index)
  return table.remove(self.souls, index)
end

return inventory
