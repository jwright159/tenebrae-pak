function onCreate(self)
	tenebrae_1 = mappair('tenebrae_1')
	startMap = tenebrae_1
	self:setResolution(4,3)
	
	--for k,v in pairs(player) do println(k,v) end
	player.name = "Jay"
	player.gold = 50
	player:setStatLv(000,4,4,4,10,20,20)
	player:setStatLv(010,6,6,4,20,30,30)
	player:setStatLv(020,30,30,30,30,40,40)
	player:setStatLv(040,50,50,50,50,50,50)
	player:setSkin('newchar02-2.tsx')
	player:addItem('fist.lua')
	player:addItem('emcee.lua')
	
	rabbit = NPC('rabbit.lua')
	rock = NPC('rock.lua')
	plant1 = NPC('plant1.lua')
	plant2 = NPC('plant2.lua')
	
	if savestate.ii then
		println(savestate.ii+1)
	end
end

function mappair(name)
	return {name..'.tmx', name..'.lua'}
end