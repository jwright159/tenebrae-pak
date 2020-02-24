function onCreate(self)
	self:setSkin('rabbit_rock.tsx')
end

function talk(self)
    map:say("Rabbit rock: Who are you?\nCan you even hear me?")
    if save then
    	map.savestate.ii = 159
    	map.savestate['bill'] = "Joe"
    	map:saveGame()
    end
    save = true
end

walk = {
    function(self) self:moveBy(0, -3, 1) end,
    function(self) self:moveBy(2, 0, 1) end,
    function(self) self:moveBy(0, 3, 1) end,
    function(self) self:moveBy(-2, 0, 1) end
}