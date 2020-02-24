function onCreate(self)
	rabbit:setupMap(rabbit.talk, nil, nil, rabbit.walk)
	rock:setupMap(rock.talk, nil, nil, nil)
	plant1:setupMap(plant1.talk, nil, nil, nil)
	plant2:setupMap(plant2.talk, nil, nil, nil)
	
	for i = 1, 0 do
		local ent = Entity()
		ent.x, ent.y, ent.width, ent.height = 0, i, 1, 1
		function ent:act(delta)
			self.x, self.y = Entity.closeOn(self.x, self.y, player.x, player.y, 2, delta)
		end
		Entity.add(ent)
	end
	
	if not didLoad then
		self:say("Welcome to the Tenebrae Role-Playing Game Engine!\nTap the screen to gain control!\nDrag yourself over to an object and tap to use it!")
		self:say("Try talking to the bush in the lower left corner!")
		didLoad = true
	end
end

function onDestroy()
	
end

function justLoadTheNextMapAlready(self)
	self:setMap(mappair('tenebrae_2'))
end