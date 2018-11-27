--[[
-- Where all the actual game logic is.
]]--
require 'Starfield'
require 'Player'

local game = {}

function game:init()
  self.player = Player()
  self.starfield = Starfield()
end

function game:enter()

  print("Entered game state")--for debug
end

function game:update(dt)

    --when the player move up or down the stars change their vel accordingly
    if self.player:input() == 'up' then
      self.starfield:setVel(self.player:getSpeed(),'add')
    elseif self.player:input() == 'down' then
      self.starfield:setVel(self.player:getSpeed(),'sub')
    end

    self.starfield:update()
end

function game:draw()

  self.starfield:draw()
  self.player:draw()
end

return game
