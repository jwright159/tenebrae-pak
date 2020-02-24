type = "linear"
atk = -4
speed = 300
scale = 6.0/16

function onSpawn()
	x = map.screen.width * math.random()
    spawnX = x
	spawnY = map.screen.height
	targetX = x
	targetY = 0
end