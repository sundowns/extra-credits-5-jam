local dialogue_manager = System({_components.dialogue, _components.controlled})

function dialogue_manager:init()
  self.isActive = false
  self.font = (_fonts["DIALOGUE"])
  self.text = {}
end

function dialogue_manager:action_released(action, entity)
  local controlled = entity:get(_components.controlled)

  if action == "next" and self.isActive then
    Talkies.onAction()
    self.isActive = Talkies.isOpen()
    if not Talkies.isOpen() then
      controlled.canMove = true
    end
  elseif action == "use" and not self.isActive then
    local newImage = entity:get(_components.dialogue).image
    Talkies.say("Ferryman", "Another day another dollar, ain't that right Fray?", {image = newImage, font = self.font})
    self.isActive = Talkies.isOpen()
    if Talkies.isOpen() then
      controlled.canMove = false
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
