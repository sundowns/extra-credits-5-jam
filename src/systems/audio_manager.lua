local audio_manager = System()

function audio_manager:init()
  self.audio = require("src.audio")
  self.audio.background_music:setLooping(true)
  self.audio.background_music:play()

  self.ambience_timer = Timer.new()
  self:sprinkle_in_ambience()
end

function audio_manager:sprinkle_in_ambience()
  self.ambience_timer:clear()
  local base_time = 20 -- seconds
  local random_component = 15 * love.math.random()
  local final_time
  if love.math.random() > 0.5 then
    final_time = base_time + random_component
  else
    final_time = base_time - random_component
  end

  self.ambience_timer:after(
    final_time,
    function()
      self.audio.ambience:play()
      self:sprinkle_in_ambience()
    end
  )
end

function audio_manager:update(dt)
  self.ambience_timer:update(dt)
end

return audio_manager
