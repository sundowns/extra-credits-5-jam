return {
  SOUL_1 = {
    function(boatImg, soulImg, inFont, sound)
      Talkies.say("Lost Soul", "How do I talk?", {image = soulImg, font = inFont, talkSound = sound})
      Talkies.say("Charon", "You just did pal", {image = boatImg, font = inFont, talkSound = sound})
      Talkies.say(
        "Lost Soul",
        "Oh..... Never mind then.....",
        {image = soulImg, font = inFont, textSpeed = "slow", talkSound = sound}
      )
      Talkies.say("Charon", "Okay bye.", {image = boatImg, font = inFont, talkSound = sound})
      return true
    end
  }
}
