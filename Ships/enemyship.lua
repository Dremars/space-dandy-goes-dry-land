Enemyship = Ship:new()

function Enemyship:load(t)
	self.tilesets = t
	self.boat = {
	{0,0,1,0},
	{0,1,1,1},
	{0,0,1,0}
	}
end

