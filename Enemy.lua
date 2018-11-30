--[[
-- Class Enemy, it represent a single enemy. Only one type for now.
--]]

--we define the image externaly to lend the class a reference
local EnemyImg = love.graphics.newImage("assets/Images/Bum.png")


Enemy = Class{}

function Enemy:init(x, y, vel)
  self.x = x
  self.y = y
  self.vel = vel
  self.img = EnemyImg
  self.width = self.img:getWidth()
  self.height = self.img:getHeight() * 0.8
  self.health = 1
  self.isAlive = true
end


function Enemy:update()

  if self.health <= 0 then
    self.isAlive = false
  end

  self.y = self.y + self.vel * love.timer.getDelta()

end

function Enemy:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
