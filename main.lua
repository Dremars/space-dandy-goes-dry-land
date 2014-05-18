require "helpers"
require "keys"
require "Ships/ship"
require "Ships/playership"
require "Ships/enemyship"

RENDER_SCALE = {}
DIMENSIONS = {}
grid = {}

function calculate_grid()
	mid_line = { {DIMENSIONS.w / 1.8, 0}, {DIMENSIONS.w / 1.8, DIMENSIONS.h} }
	mid_to_right = { {DIMENSIONS.w / 1.8, DIMENSIONS.h / 2,}, {DIMENSIONS.w, DIMENSIONS.h / 2} }
	return {mid_line, mid_to_right }
end

function calc_scale()
	RENDER_SCALE.x = love.graphics.getWidth()/DIMENSIONS.w
	RENDER_SCALE.y = love.graphics.getHeight()/DIMENSIONS.h
end

function draw_line(t)
	love.graphics.line(t[1][1],t[1][2],t[2][1],t[2][2])
end

function love.load()
	-- get window dimensions
	DIMENSIONS.w = love.graphics.getWidth() 
	DIMENSIONS.h = love.graphics.getHeight()
	
	grid = calculate_grid()
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
	-- check if window resized and calculate scale
	if (love.graphics.getHeight ~= DIMENSIONS.h) or (love.graphics.getWidth ~= DIMENSIONS.w) then
		calc_scale()
	end
end

function love.draw()
--	love.graphics.scale(RENDER_SCALE.x,RENDER_SCALE.y) -- scale the game
--	foreach(draw_line, grid)
	love.graphics.line(640,0,640,720)
	love.graphics.line(640,360,1280,360)
	love.graphics.draw(playership:draw())
	love.graphics.draw(enemyship:draw(),640,360)
	love.graphics.print("FPS: "..love.timer.getFPS(), 10, 20)
end
