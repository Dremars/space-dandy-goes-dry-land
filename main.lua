require "helpers"
require "keys"
require "Ships/ship"
require "Ships/playership"
require "Ships/enemyship"

function love.load()
	love.graphics.setBackgroundColor(3,86,197)
	playership = Playership:new({canvas = love.graphics.newCanvas(640,720)})
	enemyship = Enemyship:new({canvas = love.graphics.newCanvas(640,360)})
	tile = love.graphics.newImage("tiles/panel.png")
	playership:load({tile})
	enemyship:load({tile})
	playerShipCanvas = playership:draw()
	enemyShipCanvas = enemyship:draw()
end

function love.update(dt)
end

function love.draw()
	love.graphics.line(640,0,640,720)
	love.graphics.line(640,360,1280,360)
	love.graphics.draw(playerShipCanvas)
	love.graphics.draw(enemyShipCanvas,640,360)
	love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
end
