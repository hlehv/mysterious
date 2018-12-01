--TILE INFORMATION

--External scripts
require('scripts.object')

--Table to be populated with tile data
local P = {}

--Tile object template
P.tile = Object:new{ name = "tile" }
function P.tile:getImage()
end
function P.tile:onEnter()
end
function P.tile:blocksMovement()
end
function P.tile:onLoad()
end

--FLOOR TILE
P.floor = P.tile:new {
	name = "floor"
}
function P.floor:getImage()
	return util.getImage("graphics/darkfloor.png")
end
function P.floor:onEnter()
end
function P.floor:blocksMovement()
	return false
end
function P.floor:onLoad()
end

--WALL TILE
P.wall = P.tile:new {
	name = "wall"
}
function P.wall:getImage()
	return util.getImage("graphics/wfrontwall.png")
end
function P.wall:blocksMovement()
	return true
end

--LAMP TILE
P.lamp = P.tile:new {
	name = "lamp",
	state = "on"
}
function P.lamp:getImage()
	if self.state == "on" then
		return util.getImage("graphics/lamp.png")
	elseif self.state == "off" then
		return util.getImage("graphics/lampoff.png")
	end
end
function P.lamp:onEnter()
	if self.state == "on" then
		print("You are dead!")
	end
end
function P.lamp:toggleState()
	if self.state == "on" then
		self.state = "off"
	elseif self.state == "off" then
		self.state = "on"
	end
end

--DOOR TILE
P.door = P.tile:new {
	name = "door"
}
function P.door:getImage()
	return util.getImage("graphics/door.png")
end

--SWITCH TILE
P.switch = P.tile:new {
	name = "switch",
	state = "off",
	lampCoords = { 0, 0 }
}
function P.switch:getImage()
	if self.state == "off" then
		return util.getImage("graphics/leveroff.png")
	elseif self.state == "on" then
		return util.getImage("graphics/leveron.png")
	end
end
function P.switch:onEnter()
	self:toggleState()
end
function P.switch:toggleState()
	tileMap[self.lampCoords[1]][self.lampCoords[2]]:toggleState()

	if self.state == "on" then
		self.state = "off"
	elseif self.state == "off" then
		self.state = "on"
	end
end
function P.switch:onLoad(y, x)
	self.lampCoords = {y, x}
end

--TILE INDICES
P[0] = P.floor
P[1] = P.wall
P[2] = P.lamp
P[3] = P.door
P[4] = P.switch

--Return tiles table
return P