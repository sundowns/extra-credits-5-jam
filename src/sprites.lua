local sheet = love.graphics.newImage("assets/SpriteSheet.png")
local CELL_SIZE = 32
return {
  sheet = sheet,
  quads = {
    ["boat"] = love.graphics.newQuad(
      1 + (1 * CELL_SIZE),
      1,
      CELL_SIZE,
      (2 * CELL_SIZE),
      sheet:getWidth(),
      sheet:getHeight()
    ),
    ["obstacle"] = {
      [1] = love.graphics.newQuad(
        4 * CELL_SIZE,
        (CELL_SIZE * 2),
        CELL_SIZE,
        (CELL_SIZE),
        sheet:getWidth(),
        sheet:getHeight()
      ),
      [2] = love.graphics.newQuad(
        4 * CELL_SIZE,
        1 + (3 * CELL_SIZE),
        CELL_SIZE,
        (CELL_SIZE),
        sheet:getWidth(),
        sheet:getHeight()
      ),
      [3] = love.graphics.newQuad(
        4 * CELL_SIZE,
        (4 * CELL_SIZE),
        CELL_SIZE,
        (CELL_SIZE),
        sheet:getWidth(),
        sheet:getHeight()
      )
    },
    ["whirlpool"] = {
      [1] = love.graphics.newQuad(0, (5 * CELL_SIZE), CELL_SIZE, CELL_SIZE, sheet:getWidth(), sheet:getHeight()),
      [2] = love.graphics.newQuad(
        (CELL_SIZE),
        (5 * CELL_SIZE),
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      ),
      [3] = love.graphics.newQuad(
        (2 * CELL_SIZE),
        (5 * CELL_SIZE),
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      ),
      [4] = love.graphics.newQuad(
        (3 * CELL_SIZE),
        (5 * CELL_SIZE),
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      )
    },
    ["ferryman_neutral"] = love.graphics.newQuad(
      CELL_SIZE * 2,
      CELL_SIZE * 1,
      CELL_SIZE,
      CELL_SIZE,
      sheet:getWidth(),
      sheet:getHeight()
    ),
    ["ferryman_left"] = {
      [1] = love.graphics.newQuad(0, CELL_SIZE * 3, CELL_SIZE, CELL_SIZE, sheet:getWidth(), sheet:getHeight()),
      [2] = love.graphics.newQuad(CELL_SIZE, CELL_SIZE * 3, CELL_SIZE, CELL_SIZE, sheet:getWidth(), sheet:getHeight()),
      [3] = love.graphics.newQuad(
        CELL_SIZE * 2,
        CELL_SIZE * 3,
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      ),
      [4] = love.graphics.newQuad(
        CELL_SIZE * 3,
        CELL_SIZE * 3,
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      )
    },
    ["ferryman_right"] = {
      [1] = love.graphics.newQuad(0, CELL_SIZE * 2, CELL_SIZE, CELL_SIZE, sheet:getWidth(), sheet:getHeight()),
      [2] = love.graphics.newQuad(CELL_SIZE, CELL_SIZE * 2, CELL_SIZE, CELL_SIZE, sheet:getWidth(), sheet:getHeight()),
      [3] = love.graphics.newQuad(
        CELL_SIZE * 2,
        CELL_SIZE * 2,
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      ),
      [4] = love.graphics.newQuad(
        CELL_SIZE * 3,
        CELL_SIZE * 2,
        CELL_SIZE,
        CELL_SIZE,
        sheet:getWidth(),
        sheet:getHeight()
      )
    },
    ["paddle_left"] = love.graphics.newQuad(
      1 + (2 * CELL_SIZE),
      1,
      CELL_SIZE,
      CELL_SIZE,
      sheet:getWidth(),
      sheet:getHeight()
    ),
    ["paddle_right"] = love.graphics.newQuad(
      1 + (3 * CELL_SIZE),
      1,
      CELL_SIZE,
      CELL_SIZE,
      sheet:getWidth(),
      sheet:getHeight()
    )
  }
}
