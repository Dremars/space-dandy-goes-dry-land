require "helpers"
require "keys"
require "ship"

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
	Ship.load()
end

function love.update(dt)
	-- check if window resized and calculate scale
	if (love.graphics.getHeight ~= DIMENSIONS.h) or (love.graphics.getWidth ~= DIMENSIONS.w) then
		calc_scale()
	end
end

function love.draw()
	love.graphics.scale(RENDER_SCALE.x,RENDER_SCALE.y) -- scale the game
	foreach(draw_line, grid)
	Ship.draw(grid)
end
