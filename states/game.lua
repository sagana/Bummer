
require 'MBG'
require 'Player'


local STAR_NUM = 150

local game = {}

function game:init()
  self.background = {}
  self.player = Player()
  --Fill background with stars
  for i = 1,STAR_NUM do
    self.background[i] = MBG()
  end
end

function game:enter()

  print("entered game state")
end

function game:update(dt)

    if self.player:input() == 'up' then
      for i = 1, STAR_NUM do
        self.background[i]:setVel(300*dt,'add')
        love.graphics.setColor(255, 0, 0, 255)
      end
    elseif self.player:input() == 'down' then
      for i = 1, STAR_NUM do
        self.background[i]:setVel(100*dt,'sub')
        love.graphics.setColor(255, 0, 0, 255)
      end
    end


    for i = 1, STAR_NUM do
      self.background[i]:update()
    end

end

function game:draw()

  for i = 1, STAR_NUM do
    self.background[i]:draw()
  end

  self.player:draw()
end

return game
