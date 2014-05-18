Ship = {}

function Ship:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function Ship:draw()
	love.graphics.print("Hello from Ship!", 50, 50)
end

function Ship:update()

end
