name = "Fist"

--[[ onSpawn = { //old outdated code
	angle = Math.random() * 2 * Math.PI
	radius = 300
    spawn(new Projectile("fistproj", owner, map.screen.width/2 + radius * Math.cos(angle), map.screen.height/2 + radius * Math.sin(angle)))
} --]]

type = "linear"
atk = 4
speed = 500
scale = 6/16

--[[ radius = 300
halfWidth = map.screen.width/2
halfHeight = map.screen.height/2 --]]
function onSpawn()
	--[[ angle = Math.random() * 2 * Math.PI
    spawnX = halfWidth + radius * Math.cos(angle)
	spawnY = halfHeight + radius * Math.sin(angle) --]]
	
	if math.random() < 0.5 then
		if math.random() < 0.5 then
			spawnX = map.screen.width * math.random()
			spawnY = 0
		else
			spawnX = map.screen.width * math.random()
			spawnY = map.screen.height
		end
	else
		if math.random() < 0.5 then
			spawnX = 0
			spawnY = map.screen.height * math.random()
		else
			spawnX = map.screen.width
			spawnY = map.screen.height * math.random()
		end
	end
	
	targetX = owner.enemy.x
	targetY = owner.enemy.y
end