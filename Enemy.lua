--[[
-- Class Enemy, it represent a single enemy. Only one type for now.
--]]

--we define the image externaly to lend the class a reference
local EnemyImg = love.graphics.newImage("assets/Images/bum.png")


Enemy = Class{}

function Enemy:init(x, y, vel)
  self.x = x
  self.y = y
  self.vel = vel
  self.img = EnemyImg
end


function Enemy:update()
  self.y = self.y + self.vel * love.timer.getDelta()
end

function Enemy:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
