Ship = {canvas = nil, tilesets = nil, boat = {{1}} }

function Ship:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function Ship:draw()
	love.graphics.setCanvas(self.canvas)
		for i=1, #self.boat do
			for j=1, #self.boat[i] do
				if self.boat[i][j] == 1 then
					love.graphics.draw(self.tilesets[1],i*50,j*50)
				end
			end
		end
	love.graphics.setCanvas()
	return self.canvas
end

function Ship:update()

end

