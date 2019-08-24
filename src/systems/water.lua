local water = System()

function water:init()
  -- https://love2d.org/wiki/love.graphics.newParticleSystem
  self.particle_system = love.graphics.newParticleSystem()
end

function water:update(dt)
  self.particle_system:update(dt)

  -- for i = 1, self.pool.size do
  --   local e = self.pool:get(i)
  --   local transform = e:get(_components.transform)

  --   transform.position = transform.position + transform.velocity * dt
  -- end
end

function water:draw()
  -- draw the water tiles then particle effect on top
end

return water
