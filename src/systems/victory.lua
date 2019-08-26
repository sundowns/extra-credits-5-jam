local victory = System({_components.controlled, _components.transform, "PLAYER"})

local GOAL_COLOUR = {153 / 255, 255 / 255, 50 / 255, 0.6}

function victory:init()
  self.victory = false
  self.victory_text = love.graphics.newText(_fonts["VICTORY"], {_constants.COLOURS.VICTORY_TEXT, "Thanks for playing!"})
  self.goal = nil

  self.talk_sound = love.audio.newSource("assets/audio/chat.wav", "static")
  self.protag_image = love.graphics.newImage("assets/protag.png")

  self.souls_collected = 0
  self.required_souls = 5
end

function victory:set_goal(goal)
  self.goal = goal
  self.goal.position.x = self.goal.position.x + 16
  self.goal.position.y = self.goal.position.y + 32
end

function victory:remove_soul()
  self.souls_collected = self.souls_collected + 1
  print(self.souls_collected)
end

function victory:update(_)
  for i = 1, self.PLAYER.size do
    local player = self.PLAYER:get(i)
    local position = player:get(_components.transform).position

    -- check if player is in the goal, if so, game over!
    if
      (position.x > self.goal.position.x and position.x < self.goal.position.x + self.goal.width) and
        (position.y > self.goal.position.y and position.y < self.goal.position.y + self.goal.height)
     then
      if self.souls_collected >= self.required_souls then
        self:player_wins()
      else
        if not Talkies.isOpen() then
          Talkies.say(
            "Charon",
            "I can't leave without those lost souls...",
            {image = self.protag_image, font = _fonts["DIALOGUE"], talkSound = self.talk_sound, textSpeed = "slow"}
          )

          Timer.after(
            8,
            function()
              Talkies.clearMessages() -- fucked up hack but it works
            end
          )
        end
      end
    end
  end
end

function victory:player_wins()
  self.victory = true
  self:getInstance():disable_updates()
  self:getInstance():emit("victory")
end

function victory:draw()
  if self.goal then
    love.graphics.setColor(GOAL_COLOUR)
    love.graphics.rectangle("fill", self.goal.position.x, self.goal.position.y, self.goal.width, self.goal.height)
    _util.l.resetColour()
  end
end

function victory:draw_ui()
  if self.victory then
    love.graphics.draw(self.victory_text, love.graphics.getWidth() / 2 - self.victory_text:getWidth() / 2, 100)
  end
end

return victory
