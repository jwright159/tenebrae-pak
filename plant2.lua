function onCreate(self)
	self:setSkin('plant2.tsx')
	self:setStats(nil, 5, 5, 5, 5, 10, 10)
end

function talk(self)
	map:say("Plant2: \"I think the other plant wants to talk to you.\"")
	map:say("Plant2: \"But just between us, though, I think he's a bit insane.\"")
end
function afterP1(self)
	map:say("Plant2: \"Ignore that other plant. He is rediculous.\"")
	map:say("Plant2: \"On a completely unrelated note, I'm a slime now.\"")
	map:delay(0, function()
	player.px, player.py = player.x, player.y
	map:println(player.px, player.py)
	map:setMap('slimefight.lua')
	end)
end