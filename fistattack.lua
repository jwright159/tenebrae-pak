type = "linear"
touch = true
atk = 5
speed = 300
scale = 12.0/16

function onSpawn()
	x = map.screen.width * math.random()
    spawnX = x
	spawnY = 0
	targetX = x
	targetY = map.screen.height
end