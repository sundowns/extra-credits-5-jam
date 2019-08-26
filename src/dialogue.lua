return {
  SOUL = {
    function(boatImg, soulImg, inFont)
      Talkies.say("Lost Soul", "How do I talk?", {image = soulImg, font = inFont})
      Talkies.say("Cheron", "You just did pal", {image = boatImg, font = inFont})
      Talkies.say("Lost Soul", "Oh..... Never mind then.....", {image = soulImg, font = inFont, textSpeed = "slow"})
      Talkies.say("Cheron", "Okay bye.", {image = boatImg, font = inFont})
      return true
    end
  }
}
