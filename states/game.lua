--[[
-- Where all the actual game logic is.
]]--
require 'Starfield'
require 'Player'
require 'Bullets'
require 'Enemies'
require 'Collision'

local game = {}

function game:init()
  self.player = Player()
  self.starfield = Starfield()
  self.bullets = Bullets()
  self.enemies = Enemies()
end

function game:enter()

  print("Entered game state")--for debug
end

function game:update(dt)

  for i1,v1 in ipairs(self.bullets.bullets) do
    for i2, v2 in ipairs(self.enemies.enemies) do
      if checkCollision(v1,v2) then
        v1.isAlive = false
        v2.isAlive = false
        break
      end
    end
  end

  if self.player:input() == 'space' and self.bullets.shoot == true then
    self.bullets:addBullet(self.player.x, self.player.y)
      self.bullets.shoot = false
  end
  self.enemies:update()
  self.bullets:update()
  --when the player move up or down the stars change their vel accordingly
  if self.player:input() == 'up' then
    self.starfield:setVel(self.player:getSpeed()*5,'add') --magic number, just for test
  elseif self.player:input() == 'down' then
    self.starfield:setVel(self.player:getSpeed()*2,'sub') --magic number, just for test
  end

  self.starfield:update()


end

function game:draw()

  self.starfield:draw()
  self.player:draw()
  self.bullets:draw()
  self.enemies:draw()
end

return game
