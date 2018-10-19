--line that makes graphics look better
love.graphics.setDefaultFilter( "nearest" )
--not sure what this is
io.stdout:setvbuf("no")

--syntax for including/accessing another script
util = require("scripts.util")

--global num variable
num = 0

--Write comments with "--"

--local num = 0

--[[ Write multi-line comments with --[[ "my comment" ]]
--[[
By default, variables in Lua are global and can be accessed from any file at any time.
Use the keyword "local" when you don't want a global variable (i.e., most of the time)
]]


--function that is called automatically on program load
function love.load()
	--love.window.setMode(100, 100, {})

	player = {
		xCoord = 0,
		yCoord = 0,
		inventory = {}
	}

end


--update function called every frame
function love.update(dt)
	--print with print function (like System.out.print, print in Python, etc.)
	--print(num)

	--[[

	An example of variables in Lua:

	local table = {}
	table["asdf"] = 1
	table["qwer"] = {1, 2, 3}

	local example = {}
	table[-1] = example


	]]

 
	local slowVelX = 80
	local slowVelY = 80
	local fastVelX = 190
	local fastVelY = 190
	local velX = 0;
	local velX = 0;
   
   	--speed up if shift is down
	if love.keyboard.isDown("lshift") then 
		velX = fastVelX
		velY = fastVelY
	else
		velX = slowVelX
		velY = slowVelY
	end
	
	if  love.keyboard.isDown("up") then
		player.yCoord = player.yCoord - (velY * dt)
	end
	if  love.keyboard.isDown("down") then
		player.yCoord = player.yCoord + (velY * dt)
	end
	if love.keyboard.isDown("left") then
		player.xCoord = player.xCoord - (velX * dt)
	end
	if love.keyboard.isDown("right") then
		player.xCoord = player.xCoord + (velX * dt)
	end
end


--draw function called every frame
function love.draw()
	--set background color
	
	local tileWidth = 50
	local tileHeight = 50
	local roomWidth = 10
	local roomHeight = 10

	local tile = util.getImage("graphics/woodfloor.png")

	local wall = util.getImage("graphics/wfrontwall.png")

	--draw takes parameters: image, x, y, rotation, scaleX, scaleY
	--can take two more at end, but these are pretty irrelevant

	--[[ eventual room matrix:
	room = {
		{tile1, tile2, tile3},
		{tile4, tile5, tile6}
	}
	]]

	-- equivalent of (for int row = 0; row < roomHeight; row++)
	for row = 1, roomHeight do
		for col = 1, roomWidth do
			love.graphics.draw(tile, row*tileWidth, col*tileHeight, 0,
				tileWidth/tile:getWidth(), tileHeight/tile:getHeight())
		end
	end

	map = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{1, 1, 1, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 1, 1, 1, 1},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},

	}

	for row = 1, roomHeight do
		for col = 1, roomWidth do
			if map[row][col] == 1 then
			love.graphics.draw(wall, col*tileWidth, row*tileHeight, 0,
				tileWidth/tile:getWidth(), tileHeight/tile:getHeight())
			elseif map[row][col]== 0 then 
			love.graphics.draw(tile, col*tileWidth, row*tileHeight, 0,
				tileWidth/tile:getWidth(), tileHeight/tile:getHeight())
			end
		end
	end


	--draw player
	local playerSprite = util.getImage("graphics/ghost.png")
	love.graphics.draw(playerSprite, player.xCoord, player.yCoord, 0,
		100/playerSprite:getWidth(), 100/playerSprite:getHeight())
end
