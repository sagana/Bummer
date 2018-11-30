--[[
-- Where all the actual game logic is.
]]--
require 'Starfield'
require 'Player'
require 'Bullets'

local game = {}

function game:init()
  self.player = Player()
  self.starfield = Starfield()
  self.bullets = Bullets()
end

function game:enter()

  print("Entered game state")--for debug
end

function game:update(dt)


    if self.player:input() == 'space' and self.bullets.shoot == true then
      self.bullets:addBullet(self.player.x, self.player.y)
      self.bullets.shoot = false
    end
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
end

return game
