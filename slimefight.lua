function onCreate(self)
	width, height = 3, 3
	player.width, player.height = 0.5, 0.5
	
	Entity.add(plant2)
	--plant2.x, plant2.y = 2.5-plant2.width, 5.5
	plant2.y = height+0.5
	function plant2:act(delta)
		self.x = (-math.sin(self.lifetime)+1)*0.5 * (3-self.width)
	end
	function plant2:onDie(selff)
		selff.act = nil
		music:stop()
		self:say("Slime!Plant2: \"Oh noes! I've been killed.\"")
		self:delay(0, function()
		self:setMap('tenebrae_1.tmx', 'tenebrae_1.lua')
		player:moveTo(player.px, player.py, 0)
		selff:disable()
		end)
	end
	
	
	quit = Entity(0, 0, 0.5, 0.5)
	Entity.add(quit)
	function quit:onTrigger(selff)
		self:setMap('tenebrae_1.tmx', 'tenebrae1.lua')
	end
	
	hurt = Entity(0, 2.5, 0.5, 0.5)
	Entity.add(hurt)
	hurt:setColor(1, 0, 0)
	function hurt:onTouch()
		player:affect(-1, 0)
	end
	
	attack = Entity(2.5, 0, 0.5, 0.5)
	Entity.add(attack)
	attack:setColor(0, 1, 1)
	function attack:onTap()
		player:getItem('fist'):attack(plant2)
		if not music.isPlaying then
			music0:pause()
			music:play()
		else
			music:pause()
			music0:play()
		end
	end
	
	music0 = Music('encounter.wav')
	
	music = Music('Stronger Monsters.wav', 'Stronger Monsters Tnb many better one.mid')
	music.ents = {}
	function music:onNote(event)
		println("on", event.channel, event.tick)
		local ent = Entity(math.random()*(width-1), math.random()*(height-1), (event.note-50)/30.0, (event.note-50)/30.0)
		Entity.add(ent)
		ent:setTexture('rect')
		ent:setColor(0, event.channel/5.0, event.velocity/100.0)
		
		if self.ents[event.channel] == nil then
			self.ents[event.channel] = {}
		end
		self.ents[event.channel][event.tick] = ent
	end
	function music:offNote(event)
		println("off", event.channel, event.tick)
		Entity.remove(self.ents[event.channel][event.tick])
		self.ents[event.channel][event.tick] = nil
	end
	music0:play()
end

function onDestroy()
	music:dispose()
	music0:dispose()
end