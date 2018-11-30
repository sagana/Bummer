--[[
-- Class Bullet, it represent a single bullet. It move.
--]]

--we define the image externaly to lend the class a reference
local BulletImg = love.graphics.newImage("assets/Images/noteW.png")
local Bulletsound = love.audio.newSource("assets/sounds/note2.wav", "static")


Bullet = Class{}

function Bullet:init(x, y)
  self.x = x
  self.y = y
  self.vel = 300
  self.img = BulletImg
  self.width = self.img:getWidth()
  self.height = self.img:getHeight()
  self.isAlive = true
  Bulletsound:stop()
  Bulletsound:play()

end


function Bullet:update()
  self.y = self.y - self.vel * love.timer.getDelta()
end

function Bullet:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
