function onCreate(self)
	name = "Cool Hat"
	self:setStats(5,5,5,5,5,5)
	durability = 2
	catagory = "Armor"
	type = "Hat"
	
	self:addFunc("Use", function()
		if not owner.enemy then
			self:onUseNoEnemy()
		else
			map:say("You use your cool hat!")
			map:say("Your enemy is intimidated! It is weakened!\n(But not really.)")
		end
	end)
end

function onUseNoEnemy(self)
	map:say("You use your cool hat!")
	map:say("It begins to fall apart.\nThis takes you by surprise.")
	self:decay()
end

function onEquip(self)
	self:equip(self)
	owner:setSkin("coolhat.tsx",1)
	map:say("You equip your cool hat!")
	map:say("...Cool.")
	owner.speed = 2
end

function onUnequip(self)
	self:unequip()
	owner:removeSkin(1)
	map:say("You unequip your cool hat!")
	map:say("...How dare you.")
	owner.speed = 1
end

function onEquippedHit(self)
	map:say("Your cool hat is being torn apart!")
	map:say("Fortunately, its fragments hurt the enemy.")
	owner.enemy:affect(-2,0)
	self:decay()
end

function onEquippedStartTurn(self)
	map:say("Your cool hat gives you power!")
end

function onDestroy(self)
	owner:removeSkin(1)
	self:remove()
	map:say("Your cool hat was destroyed! D:")
	map:say("But it still helps you beyond the grave.")
end