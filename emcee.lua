function onCreate(self)
	name = "Emcee Hammer (o heck)"
	
	self:addFunc("Use", function(self)
		map:say("You realize something.\nIt's Hammertime.")
		map:delay(0, function()
		self:attack(map.enemy, 99,99,99,99,99,99)
		end)
	end)
end