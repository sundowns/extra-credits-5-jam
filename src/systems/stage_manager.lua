local stage_manager = System()

function stage_manager:init()
  -- https://love2d.org/wiki/love.graphics.newParticleSystem
  -- self.particle_system = love.graphics.newParticleSystem()

  local TILE_SIZE = 32
  self.ARENA_WIDTH = TILE_SIZE * 20
  self.ARENA_HEIGHT = TILE_SIZE * 40
end

function stage_manager:update(dt)
  self.particle_system:update(dt)

  -- for i = 1, self.pool.size do

  -- end
end

function stage_manager:load_world()
  self:getInstance():emit("start_game", Vector(self.ARENA_WIDTH / 2, self.ARENA_HEIGHT / 2))
end

function stage_manager:draw()
  love.graphics.rectangle()
  -- draw the water tiles then particle effect on top
end

return stage_manager
