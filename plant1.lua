function onCreate(self)
	self:setSkin('plant1.tsx')
end

function talk(self)
	map:say("Plant1: \"Don't touch the rock! He will destroy us all!\"")
	if player:hasItem('coolhat') == 0 then
		map:say("Plant1: \"Don't go alone! Take this!\"")
		map:delay(0, function()
		player:addItem('coolhat.lua')
		map.plant2.trigger = map.plant2.afterP1
		end)
		map:say("You got the Cool Hat!")
	else
		map:say("Plant1: \"Sorry, but I don't have anything else to help you.\"")
	end
end