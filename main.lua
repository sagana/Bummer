--[[
-- Bummer is a vertical shooter born with the intention of learning how to make
-- a game with Love2D and the help of the github community.
-- @author Sagana
-- @version 0.1
-- @since 2018-11-26
]]--

--importing ext libraries, copyright can be checked in their specific files
Timer = require 'libs.timer'
push = require 'libs.push'
Class = require "libs.class"
gamestate = require "libs.gamestate"

--importing states
game = require 'states.game'

math.randomseed(os.time())

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

  gamestate.registerEvents{'init','enter','update', 'quit'} --draw is excluded to use push lib
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

function love.draw()
  push:start() --everything between will be resized into virtual dimensions

  gamestate:draw()

  push:finish()
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, WIN_HEIGHT-50)
end
