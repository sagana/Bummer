--[[
-- Class Bullet, it represent a single bullet. It move.
--]]

--we define the image externaly to lend the class a reference
local BulletImg = love.graphics.newImage("assets/Images/noteW.png")



Bullet = Class{}

function Bullet:init(x, y)
  self.x = x
  self.y = y
  self.vel = 200
  self.img = BulletImg
end


function Bullet:update()
  self.y = self.y - self.vel * love.timer.getDelta()
end

function Bullet:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
