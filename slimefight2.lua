function onCreate(self)
	width, height = 5, 5
	
	entity1 = Entity(5, 5, 1, 1)
	Entity.add(entity1)
	entity1:setTexture("newchar02-2", 1)
	function entity1:act(delta, time)
		self.rotation = time*90
		self.originX, self.originY = 16, 16
	end
	function entity1:onTouch(self)
		player:affect(5, 0)
	end
	
	entity2 = Entity(5, 4, 0.1, 0.1)
	Entity.add(entity2)
	entity2:setTexture("wrect")
	function entity2:act(delta)
		self.x, self.y = Entity.closeOn(self.x, self.y, player.x, player.y, 2, delta)
	end
	
	local function ent3act(self, delta)
		self.lifetime = self.lifetime - self.index*0.02
		self.x = (1-(math.cos(self.lifetime/5.462)+1)/2) * (width - self.width)
		self.y = (1-(math.cos(self.lifetime)+1)/2) * (height - self.height)
		if time > 20 then
			Entity.remove(self)
		end
	end
	local function hurtPlayer(self)
		player:affect(-1, 0)
	end
	local function makeNewE3(i)
		e = Entity(6, 4, 0.2, 0.2)
		Entity.add(e)
		e.index = i
		e.act = ent3act
		e.onTouch = hurtPlayer
		
		if i < 500 then
			makeNewE3(i+1)
		end
	end
	makeNewE3(0)
end