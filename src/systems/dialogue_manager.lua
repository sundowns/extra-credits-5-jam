local dialogue_manager = System({_components.dialogue})

function dialogue_manager:init()
  self.isActive = false
  self.font = (_fonts["DIALOGUE"])
  self.boatboy_image = love.graphics.newImage("assets/protag.png")
end

function dialogue_manager:start_dialogue(entity)
  if not self.isActive then
    local soulImage = entity:get(_components.dialogue).image
    _dialogue.SOUL[1](self.boatboy_image, soulImage, self.font)
    self.isActive = Talkies.isOpen()
  end
end

function dialogue_manager:action_released(action, entity)
  --local controlled = entity:get(_components.controlled)

  if action == "next" and self.isActive then
    Talkies.onAction()
    self.isActive = Talkies.isOpen()
    if not Talkies.isOpen() then
    --controlled.canMove = true
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
