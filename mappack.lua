function onCreate(self)
	startMap = 'tyfight.lua'
	--startMap = mappair('tenebrae_1')
	--self:setResolution(4,3);
	
	--for k,v in pairs(player) do println(k,v) end
	player:setSkin('phart.tsx')
	
	-- These *really* should be atlassed
	self:addTexture('ty-head.png')
	self:addTexture('ty-head-phi.png')
	self:addTexture('ty-body.png')
	self:addTexture('ty-tail.png')
	self:addTexture('ty-arm1.png')
	self:addTexture('ty-arm1-phi.png')
	self:addTexture('ty-arm2.png')
	self:addTexture('ty-arm2-phi.png')
	self:addTexture('ty-arm-staff-1.png')
	self:addTexture('ty-arm-staff-2.png')
	self:addTexture('ty-staff-cropped.png')
	self:addTexture('ty-pose.png') --
	
	self:addTexture('tyf-head.png')
	self:addTexture('tyf-body.png')
	self:addTexture('tyf-arm.png')
	self:addTexture('tyf-leg.png')
	self:addTexture('tyf-tail.png')
	
	self:addTexture('tesla-head.png')
	self:addTexture('tesla-body.png')
	self:addTexture('tesla-wing-b.png')
	self:addTexture('tesla-wing-o.png')
	self:addTexture('tesla-tail.png')
	self:addTexture('tesla-arm-o.png')
	self:addTexture('tesla-arm-o-phi.png')
	self:addTexture('tesla-arm-b.png')
	self:addTexture('tesla-arm-b-phi.png')
end

function mappair(name)
	return {name..'.tmx', name..'.lua'}
end

function printtable(t)
	println(t)
	for k,v in pairs(t) do
		println(k,v)
	end
end

function gaussian()
	return math.sqrt(-2 * math.log(math.random())) * math.cos(2 * math.pi * math.random())
end