--[[
-- Where all the actual game logic is.
]]--
require 'Starfield'
require 'Player'
require 'Bullets'
require 'Enemies'
require 'Collision'
require 'HUD'

local game = {}

function game:init()
  self.player = Player()
  self.starfield = Starfield()
  self.bullets = Bullets()
  self.enemies = Enemies()
  self.HUD = HUD(self.player.health, self.player.shield)
end

function game:enter()

  print("Entered game state")--for debug
end

function game:update(dt)

  for i1,v1 in ipairs(self.bullets.bullets) do
    for i2, v2 in ipairs(self.enemies.enemies) do
      if checkCollision(v1,v2) then
        v1.isAlive = false
        v2.health = v2.health -1
        break
      end
    end
  end
  for i1,v1 in ipairs(self.enemies.enemies) do
      if checkCollision(v1,self.player) then
        v1.isAlive = false
        self.player.health = self.player.health - 1
        break
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
  self.HUD:update(self.player.health, self.player.shield, 0)

end

function game:draw()

  self.starfield:draw()
  self.player:draw()
  self.bullets:draw()
  self.enemies:draw()
  self.HUD:draw()
end

return game
