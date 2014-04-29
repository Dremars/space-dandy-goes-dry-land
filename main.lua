grid = {}

function foreach(f, t)
	for k,v in pairs(t) do
		f(v)
	end
end

function calculate_grid()
	screen_width = love.graphics.getWidth()
	screen_height = love.graphics.getHeight()
	mid_line = { {screen_width / 2, 0}, {screen_width / 2, screen_height} }
	mid_to_right = { {screen_width / 2, screen_height / 2,}, {screen_width, screen_height / 2} }
	return {mid_line, mid_to_right }
end

function window_size(n)
	love.graphics.setMode(love.graphics.getWidth() + n, love.graphics.getHeight() + n, false, true, 0)
end

function inc_window_size()
	window_size(200)
end
function dec_window_size()
	window_size(-200)
end



function love.load()
	love.graphics.setMode(600, 400, false, true, 0)
	grid = calculate_grid()
end

function love.update(dt)

end

function draw_line(t)
	love.graphics.line(t[1][1],t[1][2],t[2][1],t[2][2])
end

function love.draw()
	love.graphics.print("Brace yourselves, winter is coming.", 250, 40)
	foreach(draw_line, grid)
end

function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end
	if k == '+' then
		inc_window_size()
		grid = calculate_grid()
	end
	if k == '-' then
		dec_window_size()
		grid = calculate_grid()
	end
end
