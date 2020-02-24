function onCreate(self)
	self:setSkin('rock.tsx')
end

function talk(self)
	map:say("Rock: \"Hello! I'm a rock!\"", -1, 20, true)
	
	map:panTo(map.plant1, 1, 'linear')
	map:delay(0.5, function()
	map.plant1:disable()
	map:delay(0.5, function()
	map:say("Rock: \"I killed that plant... and I'm not sorry.\"", -1, 20, true)
	
	map:panTo(map.plant2, 1, 'fade', true)
	map:delay(0.5, function()
	map.plant2:disable()
	map:delay(0.5, function()
	map:say("Rock: \"That one too.\"", -1, 20, true)
	
	map:resetCamera(1, 'linear', true)
	map:say("Rock: \"Come tell me if you want to go to the castle.\"", -1, 20, true)
	trigger = mapChange
	end)end)end)end)
end
function mapChange(self)
	map:say("Rock: \"Let's fly to the castle!\"", -1, 20, true)
	map:delay(0, function()
	map:setMap(map.mappair('tenebrae_2'))
	self:setSkin('rock2.tsx')
	map:say("You are now at the castle!")
	end)
end

function hello(self)
	map:say("Rock: \"Hello again!\"")
end
function goodbye()
	map:say("Rock: \"Goodbye!\"")
end
function mapChange2()
	map:say("This rock has angered you.")
	map:say("You are filled with")
	map:say("DETERMINATION", 1, 5)
	map:say("Rock: \"No! Activate emergency temporal shift!\"", -1, 20)
	map:delay(0, function(self)
	map:setMap(map.mappair('tenebrae_1'))
	end)
end