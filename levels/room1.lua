map = {
	{0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 4, 0, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 4, 0, 2, 0, 0, 0, 0, 0, 0},
	{1, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 4, 0, 2, 0, 0, 0, 0, 0, 0}
}

connections = {
	{6, 3, 8, 4},
	{8, 2, 10, 4},
	{10, 2, 3, 5},
}

doors = {
	{ x = 5, y = 1, goesTo = 1 }
}

return {thisMap = map, thisConnections = connections, thisDoors = doors}