map = {
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 4, 0, 4, 0, 4, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

connections = {
	{9, 4, 4, 6},
	{9, 4, 5, 6},
	{9, 6, 4, 6},
	{9, 8, 6, 6},
	{9, 8, 4, 6}
}

doors = {
	{ x = 4, y = 11, goesTo = "", entersFrom = {"room1"} },
	{ x = 6, y = 2, goesTo = "room3", entersFrom = {} }
}

return {thisMap = map, thisConnections = connections, thisDoors = doors}