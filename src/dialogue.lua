return {
  SOUL_1 = {
    function(boatImg, soulImg, inFont, sound)
      Talkies.say("...", "You there, Ferryman", {font = inFont, textSpeed = "medium"})
      Talkies.say("Charon", "...Me?", {image = boatImg, font = inFont, talkSound = sound})
      Talkies.say("...", "Yes, you. Listen, I need your help.", {font = inFont, textSpeed = "medium"})
      Talkies.say(
        "...",
        "Departed souls often get lost on their way to my domain, I want YOU to find them and grant them safe passage.",
        {font = inFont, textSpeed = "medium"}
      )
      Talkies.say("Charon", "Not interested, thanks.", {image = boatImg, font = inFont, talkSound = sound})
      Talkies.say("...", "There's coin in it for you.", {font = inFont, textSpeed = "medium"})
      Talkies.say("Charon", "I'm listening.", {image = boatImg, font = inFont, talkSound = sound})
      Talkies.say("...", "Excellent. In the area you'll find four lost souls.", {font = inFont, textSpeed = "medium"})
      Talkies.say("...", "Row close and press 'e' to talk to them.", {font = inFont, textSpeed = "medium"})
      Talkies.say("...", "Let them know you're there to give them safe passage.", {font = inFont, textSpeed = "medium"})
      Talkies.say(
        "...",
        "Once you've collected all four, bring them the rest of the way to the entrance of my domain",
        {font = inFont, textSpeed = "medium"}
      )
      Talkies.say(
        "Charon",
        "Collect four souls and bring them to your domain. Sounds easy enough.",
        {image = boatImg, font = inFont, talkSound = sound}
      )

      return true
    end
  },
  SOUL_2 = {
    function(boatImg, soulImg, inFont, sound)
      Talkies.say("Lost Soul", "Hello Mr. Skelington", {image = soulImg, font = inFont, talkSound = sound})
      Talkies.say("Charon", "Need a ride, bub?", {image = boatImg, font = inFont, talkSound = sound})
      Talkies.say("Lost Soul", "Y   E   S", {image = soulImg, font = inFont, textSpeed = "slow", talkSound = sound})
      Talkies.say("Charon", "Hop in.", {image = boatImg, font = inFont, talkSound = sound})
      return true
    end
  }
}
