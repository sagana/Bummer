--importing ext libraries, copyright can be checked in their specific files
push = require 'libs.push'
Class = require "libs.class"
gamestate = require "libs.gamestate"
--importing states
game = require 'states.game'

math.randomseed(os.time()) -- create random seed

--actual window dimensions
WIN_WIDTH = 600
WIN_HEIGHT = 800

--virtual windows dimensions
VIR_WIDTH = 300
VIR_HEIGHT = 400


function love.load()


  love.graphics.setDefaultFilter('nearest', 'nearest', 1)

  love.window.setTitle('Bummer')

  push:setupScreen(VIR_WIDTH, VIR_HEIGHT, WIN_WIDTH, WIN_HEIGHT,
                  {vsync = true,
                   fullscreen = false,
                   resizable = true}
                  )

  gamestate.registerEvents{'init','enter','update', 'quit'}
  gamestate.push(game)
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

end

function love.draw()
  push:start()

  gamestate:draw()

  push:finish()
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
