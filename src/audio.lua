return {
  background_music = ripple.newSound(
    {source = love.audio.newSource("assets/audio/boat_theme.wav", "static"), volume = 1}
  ),
  ambience = ripple.newSound({source = love.audio.newSource("assets/audio/spooky_ambience.wav", "static"), volume = 1}),
  wind = ripple.newSound({source = love.audio.newSource("assets/audio/wind.wav", "static"), volume = 1}),
  victory = ripple.newSound({source = love.audio.newSource("assets/audio/victory.wav", "static"), volume = 1})
}
