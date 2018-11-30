--[[
-- Class HUD, it represent the information displayed on the screen
--]]



HUD = Class{}

function HUD:init(healthMax, shieldMax)
  self.healthMax = healthMax
  self.shieldMax = shieldMax
  self.health = healthMax
  self.shield = shieldMax
  self.score = 0

end


function HUD:update(health, shield, score)
  self.health = health
  self.shield = shield
  self.score = score
end

function HUD:draw()
  love.graphics.setColor(0.3, 0.1, 0.1, 1)
  for i = 1, self.healthMax, 1 do
    love.graphics.rectangle('fill', (5*i) +(5*i), 5, 5, 10)
  end

  love.graphics.setColor(0.9, 0.1, 0.1, 1)
  for i = 1, self.health, 1 do
    love.graphics.rectangle('fill', (5*i) +(5*i), 5, 5, 10)
  end

  love.graphics.setColor(0.1, 0.1, 0.3, 1)
  for i = 1, self.shieldMax, 1 do
    love.graphics.rectangle('fill', (5*i) +(5*i), 20, 5, 10)
  end

  love.graphics.setColor(0.1, 0.1, 0.9, 1)
  for i = 1, self.shield, 1 do
    love.graphics.rectangle('fill', (5*i) +(5*i), 20, 5, 10)
  end
end
