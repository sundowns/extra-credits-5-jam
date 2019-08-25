return {
  background_music = ripple.newSound(
    {source = love.audio.newSource("assets/audio/boat_theme.wav", "static"), volume = 1}
  ),
  ambience = ripple.newSound({source = love.audio.newSource("assets/audio/spooky_ambience.wav", "static"), volume = 1}),
  wind = ripple.newSound({source = love.audio.newSource("assets/audio/wind.wav", "static"), volume = 1}),
  victory = ripple.newSound({source = love.audio.newSource("assets/audio/victory.wav", "static"), volume = 1}),
  paddle_big = ripple.newSound({source = love.audio.newSource("assets/audio/paddle_big.wav", "static"), volume = 0.5}),
  paddle_med = ripple.newSound({source = love.audio.newSource("assets/audio/paddle_med.wav", "static"), volume = 0.8}),
  paddle_little = ripple.newSound(
    {source = love.audio.newSource("assets/audio/paddle_med.wav", "static"), volume = 0.25}
  )
}
