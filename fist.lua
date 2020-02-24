function onCreate(self)
	name = "Fist"
	category = "Weapons"
	
	self:addFunc("Use", function()
		self:attack()
	end)
end