local dialogue_manager = System({_components.dialogue, _components.controlled})

function dialogue_manager:init()
  self.isActive = false
  self.font = (_fonts["DIALOGUE"])
  self.boatboy_image = love.graphics.newImage("assets/protag.png")
end

function dialogue_manager:start_dialogue(entity)
  if not self.isActive then
    local soulImage = entity:get(_components.dialogue).image
    self.isActive = true
    for i = 1, self.pool.size do
      if self.pool:get(i):has(_components.controlled) then
        self.pool:get(i):get(_components.controlled).canMove = false
      end
    end

    _dialogue.SOUL[1](self.boatboy_image, soulImage, self.font)
    self.isActive = Talkies.isOpen()
  end
end

function dialogue_manager:action_released(action, entity)
  local controlled = entity:get(_components.controlled)

  if action == "next" and self.isActive then
    Talkies.onAction()
    self.isActive = Talkies.isOpen()
    if not Talkies.isOpen() then
      controlled.canMove = true
    end
  end
end

function dialogue_manager:update(dt)
  Talkies.update(dt)
end

function dialogue_manager:draw_ui()
  Talkies.draw()
end

return dialogue_manager
