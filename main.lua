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
	playership:set_tilesets({tile})
	enemyship:set_tilesets({tile})

	-- hahmotellaan pelaajan laiva
	pl = {
		{0,1,1,0},
		{1,1,1,1},
		{0,1,1,0}
	}
	-- hahmotellaan vihun laiva
	el = {
		{0,0,1,0},
		{0,1,1,1},
		{0,0,1,0}
	}
	playership:setboat(pl)
	enemyship:setboat(el)
end

function love.update(dt)
end

function love.draw()
	love.graphics.line(640,0,640,720)
	love.graphics.line(640,360,1280,360)
	love.graphics.draw(playership:draw())
	love.graphics.draw(enemyship:draw(),640,360)
	love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
end
