return {
  SOUL_1 = {
    function(boatImg, soulImg, inFont)
      Talkies.say("Lost Soul", "How do I talk?", {image = soulImg, font = inFont})
      Talkies.say("Charon", "You just did pal", {image = boatImg, font = inFont})
      Talkies.say("Lost Soul", "Oh..... Never mind then.....", {image = soulImg, font = inFont, textSpeed = "slow"})
      Talkies.say("Charon", "Okay bye.", {image = boatImg, font = inFont})
      return true
    end
  }
}
