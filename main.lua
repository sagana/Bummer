--First test

math.randomseed(os.time())
push = require 'push'
Class = require 'class'
require 'MBG'
require 'Player'
WIN_WIDTH = 600
WIN_HEIGHT = 800

VIR_WIDTH = 300
VIR_HEIGHT = 400

STAR_NUM = 500

local background = {}
local player = {}

function love.load()


  player = Player()
  --Inizializziamo il background stellato
  for i = 1,STAR_NUM do
    background[i] = MBG()
  end

  love.graphics.setDefaultFilter('nearest', 'nearest', 1)

  love.window.setTitle('Bummer')

  push:setupScreen(VIR_WIDTH, VIR_HEIGHT, WIN_WIDTH, WIN_HEIGHT,
                  {vsync = false,
                   fullscreen = false,
                   resizable = true}
                  )

end

function love.resize(w, h)
  push:resize(w, h)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end


end

function love.update(dt)

  if player:input() == 'up' then
    for i = 1, STAR_NUM do
      background[i]:setVel(300*dt,'add')
      love.graphics.setColor(255, 0, 0, 255)
    end
  elseif player:input() == 'down' then
    for i = 1, STAR_NUM do
      background[i]:setVel(100*dt,'sub')
      love.graphics.setColor(255, 0, 0, 255)
    end
  end


  for i = 1, STAR_NUM do
    background[i]:update()
  end
end

function love.draw()
  push:start()

  for i = 1, STAR_NUM do
    background[i]:draw()
  end

  player:draw()

  push:finish()
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
