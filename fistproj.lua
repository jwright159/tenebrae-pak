veloX, veloY = 0.0, 0.0
speed = 10.0

function fistproj(user, startX, startY)
	super.owner = user
	x = startX
	y = startY
	
	veloX = owner.enemy.x - x
	veloY = owner.enemy.y - y
	mag = ((veloX ^ 2) + (veloY ^ 2)) ^ (1/2)
	veloX = veloX / mag * speed
	veloY = veloY / mag * speed
end

function update()
	x = x + veloX
	y = y + veloY
end

function onHit(hitter)
	hitter.hurt(1)
end