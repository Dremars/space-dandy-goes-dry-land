Ship = {
	tiles = {},
	GRID_WIDTH = 30,
	GRID_HEIGHT = 20
}

function Ship.load()
	for i=1,Ship.GRID_WIDTH do
		Ship.tiles[i] = {}
		for j=1,Ship.GRID_HEIGHT do
			Ship.tiles[i][j] = 0
		end
	end
	-- some test mess to try out
	midx = Ship.GRID_WIDTH / 2
	midy = Ship.GRID_HEIGHT / 2
	Ship.tiles[midx][midy] = 1
	Ship.tiles[midx-1][midy] = 1
	Ship.tiles[midx+1][midy] = 1
	Ship.tiles[midx-2][midy] = 1
	Ship.tiles[midx+2][midy] = 1
	Ship.tiles[midx][midy+1] = 1
	Ship.tiles[midx][midy-1] = 1
	Ship.tiles[midx+1][midy+1] = 1
	Ship.tiles[midx+1][midy-1] = 1
	Ship.tiles[midx-1][midy+1] = 1
	Ship.tiles[midx-1][midy-1] = 1
end

function Ship.draw(grid)
	a = grid[1] -- line that splits the screen
	max_x = a[1][1]
	max_y = a[2][2]
	tile_width = max_x / Ship.GRID_WIDTH
	tile_height = max_y / Ship.GRID_HEIGHT
	for k,v in pairs(Ship.tiles) do
		for i,j in pairs(v) do
			if j == 1 then
				love.graphics.setColor(205,133,63,255)
				love.graphics.rectangle("fill", k*tile_width, i*tile_height, tile_width, tile_height)
			end
		end
	end
end

function Ship.update()

end
