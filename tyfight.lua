function onCreate(self)
	local unit = 32.0
	local scale = 1.0/unit
	
	local width, height = 3, 3
	player.width, player.height = .3, .3
	player.x, player.y = width/2-player.width/2, height/2-player.height/2
	cameraX, cameraY = width/2, 3.25
	local sw = screenHeight*4/3
	local sx = screenX + screenWidth/2 - sw/2
	player:setStat(nil, 'maxhp', 15)
	player:affect(15-player.hp, 0)
	local died = false
	function player.onDeath(selff)
		if not died then
			died = true
			music:stop()
			self:say("You died! :(")
			self:delay(0, function()
				self:loadGame()
			end)
		end
		return true
	end
	moveSpeed = 1.2
	
	local blockVisible = false
	local bluebones_alpha = .8
	
	self:addLayer('background')
	self:addLayer('characters')
	self:addLayer('player')
	self:addLayer('bass')
	self:addLayer('block')
	self:addLayer('arp')
	self:addLayer('drums')
	self:addLayer('lead')
	self:addLayer('walls')
	self:addLayer('pads')
	
	player:setLayer('player')
	
	local tyHead = Entity(-.1, 2.9, 'ty-head')
	tyHead.width, tyHead.height = tyHead.width/1000, tyHead.height/1000
	tyHead.originX, tyHead.originY = tyHead.width/2, tyHead.height/2+.1
	function tyHead:setPhi(yes)
		if yes then
			self:setTexture('ty-head-phi')
		else
			self:setTexture('ty-head')
		end
	end
	function tyHead:act(delta)
		self.rotation = math.sin(self.lifetime*1.3)*math.pi*.05
	end
	
	local tyBody = Entity(0, 0, 'ty-body')
	tyBody.width, tyBody.height = tyBody.width/300, tyBody.height/300
	tyBody.originX, tyBody.originY = tyBody.width/2, .3
	
	local tyTail = Entity(0, .8, 'ty-tail')
	tyTail.width, tyTail.height = tyTail.width/300, tyTail.height/300
	tyTail.originX, tyTail.originY = .4, 1.1
	function tyTail:act(delta)
		self.rotation = -.2 + math.sin(self.lifetime)*math.pi*.05
	end
	
	local tyArm1 = Entity(-.3, 2.22, 'ty-arm1')
	tyArm1.width, tyArm1.height = tyArm1.width/350, tyArm1.height/350
	tyArm1.originX, tyArm1.originY = 1.5,  1.2
	function tyArm1:setPhi(yes)
		if yes then
			self:setTexture('ty-arm1-phi')
		else
			self:setTexture('ty-arm1')
		end
	end
	function tyArm1:act(delta)
		self.rotation = math.sin(self.lifetime)*math.pi*.05
	end
	tyArm1.isVisible = false
	
	local tyArm1_L = Entity(.26, 2.25, 'ty-arm1')
	tyArm1_L.width, tyArm1_L.height = tyArm1.width, tyArm1.height
	tyArm1_L.originX, tyArm1_L.originY = tyArm1.originX, tyArm1.originY
	tyArm1_L.setPhi = tyArm1.setPhi
	function tyArm1_L:act(delta)
		tyArm1.act(self, delta)
		self.rotation = -self.rotation
	end
	tyArm1_L.scaleX = -1
	tyArm1_L.isVisible = false
	
	local tyArm2 = Entity(tyArm1_L.x, tyArm1_L.y, 'ty-arm2')
	tyArm2.width, tyArm2.height = tyArm2.width/280, tyArm2.height/280
	tyArm2.originX, tyArm2.originY = 1.2,  2.0
	function tyArm2:setPhi(yes)
		if yes then
			self:setTexture('ty-arm2-phi')
		else
			self:setTexture('ty-arm2')
		end
	end
	function tyArm2:act(delta)
		--self.rotation = -math.sin(self.lifetime)*math.pi*.05
		self.rotation = .3
	end
	tyArm2.isVisible = false
	
	local tyArm2_R = Entity(tyArm1.x, tyArm1.y, 'ty-arm2')
	tyArm2_R.width, tyArm2_R.height = tyArm2.width, tyArm2.height
	tyArm2_R.originX, tyArm2_R.originY = tyArm2.originX,  tyArm2.originY
	tyArm2_R.scaleX = -1
	tyArm2_R.setPhi = tyArm2.setPhi
	function tyArm2_R:act(delta)
		tyArm2.act(self, delta)
		self.rotation = -self.rotation
	end
	tyArm2_R.isVisible = false
	
	local tyArmStaffPoint = {x=-0.74, y=-0.69}
	local tyArmStaff1 = Entity(tyArm1.x, tyArm1.y, 'ty-arm-staff-1')
	tyArmStaff1.width, tyArmStaff1.height = tyArmStaff1.width/300, tyArmStaff1.height/300
	tyArmStaff1.originX, tyArmStaff1.originY = 1.5,  1.82
	function tyArmStaff1:act(delta)
		self.rotation = math.atan(player.x-self.x+1)*.2
	end
	tyArmStaff1.isVisible = false
	
	local tyArmStaffPoint_L = {x=-tyArmStaffPoint.x, y=tyArmStaffPoint.y}
	local tyArmStaff1_L = Entity(tyArm1_L.x, tyArm1_L.y, 'ty-arm-staff-1')
	tyArmStaff1_L.width, tyArmStaff1_L.height = tyArmStaff1.width, tyArmStaff1.height
	tyArmStaff1_L.originX, tyArmStaff1_L.originY = tyArmStaff1.originX, tyArmStaff1.originY
	function tyArmStaff1_L:act(delta)
		self.rotation = math.atan(player.x-self.x+3)*.2
	end
	tyArmStaff1_L.scaleX = -1
	tyArmStaff1_L.isVisible = false
	
	local tyArmStaff2 = Entity(tyArm1.x, tyArm1.y, 'ty-arm-staff-2')
	tyArmStaff2.width, tyArmStaff2.height = tyArmStaff2.width/350, tyArmStaff2.height/350
	tyArmStaff2.originX, tyArmStaff2.originY = .75,  1.8
	tyArmStaff2.isVisible = false
	
	local tyArmStaff2_L = Entity(tyArm1_L.x, tyArm1_L.y, 'ty-arm-staff-2')
	tyArmStaff2_L.width, tyArmStaff2_L.height = tyArmStaff2.width, tyArmStaff2.height
	tyArmStaff2_L.originX, tyArmStaff2_L.originY = tyArmStaff2.originX, tyArmStaff2.originY
	tyArmStaff2_L.scaleX = -1
	tyArmStaff2_L.isVisible = false
	
	local tyArmR = {}
	function tyArmR:setActive(active)
		if self.active then
			self.active.isVisible = false
		end
		self.active = active
		active.isVisible = true
	end
	tyArmR:setActive(tyArm2_R)
	local tyArmL = {}
	tyArmL.setActive = tyArmR.setActive
	tyArmL:setActive(tyArm2)
	
	local ty = Group()
	ty.x, ty.y = -1, 3.5
	ty:setLayer('characters')
	function ty:act(delta)
		self.scaleY = 1 + math.sin(self.lifetime)*.03
	end
	ty:add(tyTail)
	ty:add(tyArm1)
	ty:add(tyArm1_L)
	ty:add(tyArm2)
	ty:add(tyArm2_R)
	ty:add(tyArmStaff1)
	ty:add(tyArmStaff1_L)
	ty:add(tyBody)
	ty:add(tyArmStaff2)
	ty:add(tyArmStaff2_L)
	ty:add(tyHead)
	Entity.add(ty)
	
	--local stafdeb = Entity(0, 0, .1, .1)
	--stafdeb.originX, stafdeb.originY = stafdeb.width/2, stafdeb.height/2
	--function stafdeb:act(delta)
		--self.x, self.y = ty.x+tyArmStaff1.x + (tyArmStaffPoint.x*math.cos(tyArmStaff1.rotation) - tyArmStaffPoint.y*math.sin(tyArmStaff1.rotation)), 
				--ty.y+tyArmStaff1.y + (tyArmStaffPoint.y*math.cos(tyArmStaff1.rotation) + tyArmStaffPoint.x*math.sin(tyArmStaff1.rotation))
	--end
	--Entity.add(stafdeb)
	
	local tesHead = Entity(-.1, 2.4, 'tesla-head')
	tesHead.width, tesHead.height = tesHead.width/1050, tesHead.height/1050
	tesHead.originX, tesHead.originY = tesHead.width/2-.05, tesHead.height/2
	function tesHead:act(delta)
		self.rotation = math.sin(self.lifetime*1.3+1.5)*math.pi*.04
	end
	
	local tesBody = Entity(0, 0, 'tesla-body')
	tesBody.width, tesBody.height = tesBody.width/300, tesBody.height/300
	tesBody.originX, tesBody.originY = tesBody.width/2, .5
	
	local tesTail = Entity(0, 1.2, 'tesla-tail')
	tesTail.width, tesTail.height = tesTail.width/300, tesTail.height/300
	tesTail.originX, tesTail.originY = .6, 1.4
	function tesTail:act(delta)
		self.rotation = -.2 + math.sin(self.lifetime)*math.pi*.05
	end
	
	local tesArmO = Entity(-.4, 2.1, 'tesla-arm-o')
	tesArmO.width, tesArmO.height = tesArmO.width/350, tesArmO.height/350
	tesArmO.originX, tesArmO.originY = 1.4, 1.41
	function tesArmO:setPhi(yes)
		if yes then
			self:setTexture('tesla-arm-o-phi')
		else
			self:setTexture('tesla-arm-o')
		end
	end
	function tesArmO:act(delta)
		self.rotation = .4 + math.sin(self.lifetime)*math.pi*.04
	end
	
	local tesArmB = Entity(.37, 2.1, 'tesla-arm-b')
	tesArmB.width, tesArmB.height = tesArmO.width, tesArmO.height
	tesArmB.originX, tesArmB.originY = .4, 1.45
	function tesArmB:setPhi(yes)
		if yes then
			self:setTexture('tesla-arm-b-phi')
		else
			self:setTexture('tesla-arm-b')
		end
	end
	function tesArmB:act(delta)
		self.rotation = -tesArmO.rotation
	end
	
	local tesWingB = Entity(-.1, 2.1, 'tesla-wing-b')
	tesWingB.width, tesWingB.height = tesWingB.width/300, tesWingB.height/300
	tesWingB.originX, tesWingB.originY = 2.4, 2.0
	function tesWingB:act(delta)
		self.rotation = .7 + math.sin(self.lifetime*.82)*math.pi*.07
	end
	
	local tesWingO = Entity(.1, 2.1, 'tesla-wing-o')
	tesWingO.width, tesWingO.height = tesWingB.width, tesWingB.height
	tesWingO.originX, tesWingO.originY = .1, 2.14
	function tesWingO:act(delta)
		self.rotation = -tesWingB.rotation
	end
	
	local tes = Group()
	tes.x, tes.y = 4, 3.4
	tes:setLayer('characters')
	function tes:act(delta)
		self.scaleY = 1 + math.sin(self.lifetime)*.03
	end
	tes:add(tesWingB)
	tes:add(tesWingO)
	tes:add(tesTail)
	tes:add(tesArmO)
	tes:add(tesArmB)
	tes:add(tesBody)
	tes:add(tesHead)
	Entity.add(tes)
	
	local tyf
	local function tyf_act_time(self, delta)
		local angle = self.lifetime*20-self.x*.6
		self.y = math.sin(angle)*.3
		self.rotation = math.cos(angle)*.2
	end
	local tyf_act_ymag = .3
	local tyf_act_rotmag = .2
	local function tyf_act(self, delta)
		local angle = (tyf.x+self.x*tyf.scaleX*math.cos(tyf.rotation))*2
		self.y = math.sin(angle)*tyf_act_ymag
		self.rotation = math.cos(angle)*tyf_act_rotmag
		if tyf.scaleX < 0 then self.rotation = -self.rotation end
	end
	
	local tyfHead = Entity(0, 0, 'tyf-head')
	tyfHead.width, tyfHead.height = tyfHead.width/280, tyfHead.height/280
	tyfHead.originX, tyfHead.originY = 2.6, 2.7
	function tyfHead:act(delta)
		tyf_act(self, delta)
		self.rotation = -.2 + self.rotation
	end
	
	local tyfArm = Entity(4, 0, 'tyf-arm')
	tyfArm.width, tyfArm.height = tyfArm.width/150, tyfArm.height/150
	tyfArm.originX, tyfArm.originY = 2.9, 3.3
	function tyfArm:act(delta)
		tyf_act(self, delta)
		self.rotation = .2 + self.rotation
	end
	
	local tyfLeg = Entity(8, 0, 'tyf-leg')
	tyfLeg.width, tyfLeg.height = tyfLeg.width/200, tyfLeg.height/200
	tyfLeg.originX, tyfLeg.originY = 1.2, 2.4
	function tyfLeg:act(delta)
		tyf_act(self, delta)
		self.rotation = -.2 + self.rotation
	end
	
	local tyfTail = Entity(15.5, 0, 'tyf-tail')
	tyfTail.width, tyfTail.height = tyfTail.width/200, tyfTail.height/200
	tyfTail.originX, tyfTail.originY = .9, 1.85
	function tyfTail:act(delta)
		tyf_act(self, delta)
		self.rotation = -.2 + self.rotation
	end
	
	tyf = Group()
	tyf.x, tyf.y = -1, 3
	tyf.scaleX = .5
	tyf.scaleY = tyf.scaleX
	tyf:setLayer('characters')
	function tyf:act(delta)
		self.x = math.sin(self.lifetime)*4
	end
	for i=0,28 do
		local tyfBody = Entity(i*.55, 0, 'tyf-body')
		tyfBody.width, tyfBody.height = tyfBody.height/400, tyfBody.height/400
		if i < 7 then
			tyfBody.height = tyfBody.height*(13+i)/20
		elseif i >= 8 and i < 12 then
			tyfBody.height = tyfBody.height*(33-i)/25
		elseif i >= 12 and i < 15 then
			tyfBody.height = tyfBody.height*(5+i)/20
		elseif i >= 15 then
			tyfBody.height = tyfBody.height*(30-i)/15
		end
		tyfBody.originX, tyfBody.originY = tyfBody.width/2, tyfBody.height/2-.15
		tyfBody.act = tyf_act
		tyf:add(tyfBody)
	end
	tyf:add(tyfHead)
	tyf:add(tyfArm)
	tyf:add(tyfLeg)
	tyf:add(tyfTail)
	--Entity.add(tyf)
	
	--local white = Entity(sx, screenY, sw, screenHeight)
	--white:setLayer('background')
	--Entity.add(white)
	
	local wall1 = Entity(screenX, screenY, sx-screenX, screenHeight, 'black')
	wall1:setLayer('walls')
	Entity.add(wall1)
	local wall2 = Entity(sx+sw, screenY, sx-screenX, screenHeight, 'black')
	wall2:setLayer('walls')
	Entity.add(wall2)
	
	local box = Entity(0, 0, unit*width, unit*height, 'bounds', true)
	box.initWidth, box.initHeight = box.width, box.height
	box.scaleX, box.scaleY = scale, scale
	box:setPatchAlignment(0)
	box:setLayer('block')
	function box:act(delta)
		if player.x < self.x then player.x = self.x
		elseif player.x + player.width  > self.x + self.width /unit then player.x = self.x + self.width /unit - player.width  end
		if player.y < self.y then player.y = self.y
		elseif player.y + player.height > self.y + self.height/unit then player.y = self.y + self.height/unit - player.height end
	end
	Entity.add(box)
	
	local hpbar_back = Entity(width/2 - .5, screenY + .1, 1, .2, 'barback')
	hpbar_back:setLayer('characters')
	Entity.add(hpbar_back)
	local hpbar = Entity(hpbar_back.x, hpbar_back.y, 0, hpbar_back.height, 'health')
	hpbar:setLayer('characters')
	function hpbar:act(delta)
		self.width = hpbar_back.width*player.hp/player.maxhp
	end
	Entity.add(hpbar)
	
	music = Music('TyTheme.mp3', 'TyThemeMid.mid')
	local musicmachine = {}
	-- 1. block
	-- 2. lead
	-- 3. bass
	-- 4. arp
	-- 5. drums
	-- 6. growl
	-- 7. pads
	-- 8. bells
	
	local onTouch_hurt_time = 1
	local onTouch_hurt_timer = 0
	local onTouch_hurt_speed = 3
	local function onTouch_hurt(self)
		if onTouch_hurt_timer == 0 then
			player:affect(-1, 0)
			onTouch_hurt_timer = onTouch_hurt_time
		end
	end
	local function onTouch_karma(self)
		player:affect(-.1, 0)
	end
	local function onTouch_blue(self)
		if player.x ~= self.playerX or player.y ~= self.playerY then
			onTouch_hurt(self)
		end
		self.playerX, self.playerY = player.x, player.y
	end
	local function offTouch_blue(self)
		self.playerX, self.playerY = player.x, player.y
	end
	
	function entarr_removeAll(self)
		local ent = table.remove(self)
		while ent do
			Entity.remove(ent)
			ent = table.remove(self)
		end
	end
	
	function player:act(delta)
		if onTouch_hurt_timer > 0 then
			onTouch_hurt_timer = onTouch_hurt_timer - delta
			if onTouch_hurt_timer < 0 then
				onTouch_hurt_timer = 0
			end
			self.alpha = (((onTouch_hurt_timer % 1) * onTouch_hurt_speed) % 1 < .5) and 1 or .5
		end
	end
	
	local block_intro
	local qtrlen
	local block_verse1
	local block_verse1rise
	local block_verse1predrop
	local block_drop1A
	local block_drop1trans
	local block_drop1B
	local block_verse2
	local block_verse2rise
	local block_verse2predrop
	local block_drop2A
	local block_drop2B
	local block_drop2C
	local block_outro
	local lead_droptop
	local lead_droptop_x
	local lead_droptop_xw
	local lead_droptop_w
	local lead_droptop_begin_startH
	local lead_droptop_begin_endH
	local lead_droptop_startH
	local lead_droptop_endH
	local lead_dropbot
	local lead_droptop_rise
	local lead_droptop_rise_startH
	local lead_droptop_rise_endH
	local lead_dropleft
	local lead_dropright
	local lead_dropsides
	local lead_droptopblue
	local lead_square
	local lead_square_h
	local lead_square_rate
	local bass_expandbox
	local bass_squares
	local bass_squares_w
	local bass_squares_h
	local bass_squares_swaptime
	local bass_squares_lifetime
	local bass_squares_nextones
	local bass_squares_rise_w
	local bass_squares_rise_h
	local bass_squares_drop_w
	local bass_squares_drop_h
	local bass_squares_dropB_w
	local bass_squares_dropB_h
	local bass_squares_removeAll
	local bass_bluebones
	local bass_bluebones_left
	local bass_bluebones_time
	local bass_squareswalls
	local bass_squareswalls_t
	local bass_squareswalls_b
	local bass_squareswalls_l
	local bass_squareswalls_r
	local bass_squareswalls_maxalpha
	local bass_squareswalls_width
	local arp_droptop
	local arp_droptop_w
	local arp_droptop_h
	local arp_droptop_impulse
	local arp_droptop_counter
	local arp_droptop_beatcount
	local arp_spikes
	local arp_spikes_w
	local arp_spikes_h
	local arp_spikes_swaptime
	local arp_spikes_lifetime
	local drums_throwrod
	local drums_throwrod_makeStaff
	local drums_predrop
	local drums_lazorz
	local drums_lazorz_w
	local drums_lazorz_nextones
	local drums_lazorz_dropB_w
	local drums_bones
	local drums_bones_left
	local drums_bones_right
	local drums_bones_side
	local drums_bones_w
	local drums_gun
	local drums_gun_w
	local drums_gun_h
	local drums_gun_yh
	local drums_gun_margin
	local drums_gun_angle
	local drums_gun_mag
	local drums_gun_count
	local drums_bonegun
	local drums_dropB
	local drums_boxillate
	local drums_boxillate_margin
	local drums_boxillate_count
	local drums_boxillate_time
	local drums_boxillate_offset
	local drums_lazorzsides
	local drums_boxillazorz
	local drums_boxillategun
	local growl_tyjump
	local growl_tyjump_off
	local growl_tyflybones
	local growl_tyflybones_speed
	local growl_tyflybones_beat
	local growl_tyflybones_left
	local growl_tyflybones_spawnbone
	local pads_sine
	local pads_sine_startW
	local pads_sine_endW
	local pads_sine_oldStartW
	local pads_sine_oldEndW
	local pads_sine_h
	local pads_sine_ents
	local pads_sine_speedOffset
	local pads_sine_lengthOffset
	
	function block_intro(event)
		println("intro")
		qtrlen = event.time/4
		println("Length of quarternote: "..qtrlen)
		
		musicmachine['block'] = block_verse1
		musicmachine['lead']  = lead_droptop
		musicmachine['bass']  = bass_expandbox
		printtable(musicmachine)
		
		--block_drop1A()
		--block_drop1trans()
		--block_drop1B()
		--music.position = 120
		--block_verse2()
		--music.position = 135
	end
	function block_verse1(event)
		println("verse1")
		musicmachine['block'] = block_verse1rise
		musicmachine['lead']  = lead_droptop
		musicmachine['bass']  = bass_squares
		musicmachine['arp']   = arp_droptop
		musicmachine['drums'] = drums_throwrod
		printtable(musicmachine)
		
		tyArmR:setActive(tyArm1)
		tyArm1:setPhi(false)
		tyArmL:setActive(tyArm1_L)
	end
	function block_verse1rise(event)
		println("verse1rise")
		musicmachine['block'] = block_verse1predrop
		musicmachine['lead']  = lead_droptop_rise
		bass_squares_w, bass_squares_h = bass_squares_rise_w, bass_squares_rise_h
		printtable(musicmachine)
	end
	function block_verse1predrop(event)
		println("verse1predrop")
		musicmachine['block'] = block_drop1A
		musicmachine['lead']  = lead_droptop
		musicmachine['bass']  = bass_bluebones
		bass_squares_nextones:removeAll()
		bass_bluebones_time = 8
		musicmachine['arp']   = nil
		musicmachine['drums'] = drums_predrop
		printtable(musicmachine)
	end
	function block_drop1A(event)
		println("drop1A")
		musicmachine['block'] = block_drop1trans
		musicmachine['lead']  = lead_droptop
		musicmachine['bass']  = bass_squares
		bass_squares_w, bass_squares_h = bass_squares_drop_w, bass_squares_drop_h
		musicmachine['arp']   = nil
		musicmachine['drums'] = drums_lazorz
		musicmachine['growl'] = growl_tyjump
		music.offNote6 = growl_tyjump_off
		musicmachine['pads']  = pads_sine
		musicmachine['bells'] = lead_dropsides
		printtable(musicmachine)
		
		tyHead:setPhi(true)
		tyArm1:setPhi(true)
		tyArm1_L:setPhi(true)
		
		println(Entity.list())
	end
	function block_drop1trans(event)
		println("drop1trans")
		musicmachine['block'] = block_drop1B
		musicmachine['bells'] = nil
		printtable(musicmachine)
		
		local ent = Entity(2, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		ent.isVisible = blockVisible
		local oldBoxX, oldBoxY = box.x, box.y
		local oldBoxWidth, oldBoxHeight = box.width, box.height
		local tyx, tesx = ty.x, tes.x
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
			end
			box.x = applyInterp('sineIn', alpha, oldBoxX, 0)
			box.y = applyInterp('sineIn', alpha, oldBoxY, 0)
			box.width  = applyInterp('sineIn', alpha, oldBoxWidth,  width *unit)
			box.height = applyInterp('sineIn', alpha, oldBoxHeight, height*unit)
			ty.x = applyInterp('sine', alpha, tyx, -1)
			tes.x = applyInterp('sineOut', alpha, tesx, 4)
		end
		Entity.add(ent)
		
		tesArmO:setPhi(true)
		tesArmB:setPhi(true)
	end
	function block_drop1B(event)
		println("drop1B")
		musicmachine['block'] = block_verse2
		printtable(musicmachine)
		
		drums_lazorz_w = drums_lazorz_dropB_w
		bass_squares_w, bass_squares_h = bass_squares_dropB_w, bass_squares_dropB_h
		
		lead_droptop_w = .1
		local ent = Entity(2, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		local lifetime = qtrlen*16
		local maxalpha = 3
		function ent:act(delta)
			local alpha
			if self.lifetime < lifetime then
				alpha = self.lifetime/lifetime*maxalpha
			else
				alpha = maxalpha
			end
			box.x = math.sin(self.lifetime*.4)*alpha
			box.y = (math.cos(self.lifetime*.35)+1)*alpha * .55
		end
		Entity.add(ent)
		
		local bluebone = Entity(0, 0, .3, height, 'bluebones')
		bluebone.alpha = bluebones_alpha
		bluebone:setLayer('arp')
		function bluebone:act(delta)
			self.x = box.x + (math.sin(self.lifetime/(qtrlen*2))+1)/2*(width-self.width)
			self.y = box.y
		end
		bluebone.onTouch  = onTouch_blue
		bluebone.offTouch = offTouch_blue
		Entity.add(bluebone)
		
		function music:offNote1(event)
			Entity.remove(ent)
			Entity.remove(bluebone)
			self.offNote1 = nil
		end
	end
	function block_verse2(event)
		println("verse2")
		musicmachine['block'] = block_verse2rise
		tyJoin = 0
		musicmachine['lead']  = lead_droptopblue
		musicmachine['bass']  = bass_squareswalls
		musicmachine['arp']   = nil
		musicmachine['drums'] = drums_bones
		printtable(musicmachine)
		
		bass_squares_nextones:removeAll()
		drums_lazorz_nextones:removeAll()
		
		lead_droptop_startH = lead_droptop_begin_startH
		lead_droptop_endH = lead_droptop_begin_endH
		
		local ent = Entity(2, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		local boxX, boxY = box.x, box.y
		local tyx, tesx = ty.x, tes.x
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
				
				local ent = Entity(0, 0, 1, 1)
				ent:setLayer('block')
				ent.isVisible = blockVisible
				function ent:act(delta)
					box.x = math.sin(self.lifetime*.5)*3
					lead_droptop_x = box.x
					lead_droptop_xw = box.width*scale
				end
				Entity.add(ent)
				function music:offNote1(event)
					Entity.remove(ent)
					
					local ent2 = Entity(0, 0, 1, 1)
					ent2:setLayer('block')
					ent2.isVisible = blockVisible
					local oldLT = ent.lifetime
					function ent2:act(delta)
						box.x = math.sin((oldLT+self.lifetime)*.5)*3
						if self.lifetime > qtrlen*24 then
							box.x = applyInterp('sine', self.lifetime/(qtrlen*8)-3, box.x, 0)
						end
						lead_droptop_x = box.x
						lead_droptop_xw = box.width*scale
						box.y = applyInterp('sine', self.lifetime/(qtrlen*16), 0, 1)
					end
					Entity.add(ent2)
					function music:offNote1(event)
						Entity.remove(ent2)
						self.offNote1 = nil
					end
				end
			end
			box.x = applyInterp('sineIn', alpha, boxX, 0)
			box.y = applyInterp('sineIn', alpha, boxY, 0)
			ty.x = applyInterp('sineIn', alpha, tyx, sx-sw)
			tes.x = applyInterp('sine', alpha, tesx, width/2)
		end
		Entity.add(ent)
		
		tesArmO:setPhi(false)
		tesArmB:setPhi(false)
	end
	function block_verse2rise(event)
		println("verse2rise")
		musicmachine['block'] = block_verse2predrop
		musicmachine['drums'] = drums_bonegun
		printtable(musicmachine)
	end
	function block_verse2predrop(event)
		println("verse2predrop")
		musicmachine['block'] = block_drop2A
		musicmachine['lead']  = lead_droptop
		musicmachine['drums'] = drums_dropB
		printtable(musicmachine)
		bass_squares_nextones:removeAll()
		
		Entity.add(tyf)
		tyf.x, tyf.y = screenX, 5
		tyf.scaleX = -tyf.scaleX
		function tyf:act(delta)
			self.x = self.x + 8*delta
		end
	end
	function block_drop2A(event)
		println("drop2A")
		musicmachine['block'] = block_drop2B
		musicmachine['lead']  = lead_dropsides
		musicmachine['bass']  = bass_squares
		musicmachine['arp']   = arp_spikes
		musicmachine['drums'] = drums_boxillazorz
		musicmachine['growl'] = growl_tyflybones
		music.offNote6 = nil
		musicmachine['pads']  = pads_sine
		printtable(musicmachine)
		lead_droptop_x, lead_droptop_xw = sx, sw
		lead_droptop_startH = lead_droptop_rise_startH
		lead_droptop_endH = lead_droptop_rise_endH
		
		tyf_act_ymag = .6
		tyf_act_rotmag = .5
		
		println(Entity.list())
	end
	function block_drop2B(event)
		println("drop2B")
		musicmachine['block'] = block_drop2C
		musicmachine['lead']  = nil
		musicmachine['bells'] = lead_droptop
		printtable(musicmachine)
		drums_boxillate_time = 2
		drums_boxillate_count = 1
		drums_boxillate_offset = 1
		
		local ent = Entity(2, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		local tyx, tesx = ty.x, tes.x
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
			end
			ty.x = applyInterp('sineOut', alpha, tyx, -1)
			tes.x = applyInterp('sine', alpha, tesx, 4)
		end
		Entity.add(ent)
		
		Entity.remove(tyf)
		tyArmR:setActive(tyArm1)
		tyArmL:setActive(tyArm1_L)
	end
	function block_drop2C(event)
		println("drop2C")
		musicmachine['block'] = block_outro
		musicmachine['lead']  = lead_square
		musicmachine['arp']   = arp_droptop
		musicmachine['drums'] = drums_boxillategun
		printtable(musicmachine)
		drums_lazorz_nextones:removeAll()
		
		local ent = Entity(0, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		local boxW, boxH = box.width, box.height
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*64)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
			end
			box.width = applyInterp('linear', alpha, boxW, sw*unit-2)
			box.height = applyInterp('linear', alpha, boxH, screenHeight*unit-2)
		end
		Entity.add(ent)
	end
	function block_outro(event)
		println("outro")
		musicmachine['block'] = nil
		musicmachine['bass']  = nil
		musicmachine['drums'] = nil
		printtable(musicmachine)
		bass_squares_nextones:removeAll()
		
		local ent = Entity(0, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		local boxX, boxY = box.x, box.y
		local boxW, boxH = box.width, box.height
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*16)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
			end
			box.x = applyInterp('sine', alpha, boxX, 0)
			box.y = applyInterp('sine', alpha, boxY, 0)
			box.width = applyInterp('sine', alpha, boxW, width*unit)
			box.height = applyInterp('sine', alpha, boxH, height*unit)
		end
		Entity.add(ent)
		
		tesArmO:setPhi(true)
		tesArmB:setPhi(true)
		
		while #pads_sine_ents > 0 do
			local ent = table.remove(pads_sine_ents)
			Entity.remove(ent)
			Entity.remove(ent.other)
		end
		
		function music.offNote1(selff, event)
			tyArmR:setActive(tyArm2_R)
			tyArmL:setActive(tyArm2)
			tesArmO:setPhi(false)
			tesArmB:setPhi(false)
			self:say("You won!\nYou can just close the game now...")
			println(Entity.list())
		end
	end
	
	lead_droptop_x = sx
	lead_droptop_xw = sw
	lead_droptop_w = .1
	lead_droptop_begin_startH = .1
	lead_droptop_begin_endH = .7
	lead_droptop_startH = lead_droptop_begin_startH
	lead_droptop_endH = lead_droptop_begin_endH
	function lead_droptop(event)
		local ent = Entity(lead_droptop_x + math.random()*(lead_droptop_xw-lead_droptop_w), 0, lead_droptop_w, lead_droptop_startH)
		ent:setLayer('lead')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			self.y = applyInterp('pow2In', alpha, screenY+screenHeight, screenY-self.height-1)
			if self.y+self.height < screenY then
				Entity.remove(self)
			end
			self.height = applyInterp('pow2In', alpha, lead_droptop_startH, lead_droptop_endH)
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	function lead_dropbot(event)
		local ent = Entity(lead_droptop_x + math.random()*(lead_droptop_xw-lead_droptop_w), 0, lead_droptop_w, lead_droptop_startH)
		ent:setLayer('lead')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			self.y = applyInterp('pow2In', alpha, screenY-self.height, screenY+screenHeight+1)
			if self.y > screenY+screenHeight then
				Entity.remove(self)
			end
			self.height = applyInterp('pow2In', alpha, lead_droptop_startH, lead_droptop_endH)
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	lead_droptop_rise_startH = .5
	lead_droptop_rise_endH = 1.3
	function lead_droptop_rise(event)
		local lead_droptop_rise_oldStartH = lead_droptop_startH
		local lead_droptop_rise_oldEndH = lead_droptop_endH
		local ent = Entity(0, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*32)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
			end
			lead_droptop_startH = applyInterp('linear', alpha, lead_droptop_rise_oldStartH, lead_droptop_rise_startH)
			lead_droptop_endH = applyInterp('linear', alpha, lead_droptop_rise_oldEndH, lead_droptop_rise_endH)
		end
		Entity.add(ent)
		musicmachine['lead'] = lead_droptop
		musicmachine['lead'](event)
	end
	function lead_dropleft(event)
		local ent = Entity(0, screenY + math.random()*(screenHeight-lead_droptop_w), lead_droptop_startH, lead_droptop_w)
		ent:setLayer('lead')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			self.x = applyInterp('pow2In', alpha, sx-self.width, sx+sw+1)
			if self.x > sx+sw then
				Entity.remove(self)
			end
			self.width = applyInterp('pow2In', alpha, lead_droptop_startH, lead_droptop_endH)
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	function lead_dropright(event)
		local ent = Entity(0, screenY + math.random()*(screenHeight-lead_droptop_w), lead_droptop_startH, lead_droptop_w)
		ent:setLayer('lead')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			self.x = applyInterp('pow2In', alpha, sx+sw, sx-self.width-1)
			if self.x+self.width < sx then
				Entity.remove(self)
			end
			self.width = applyInterp('pow2In', alpha, lead_droptop_startH, lead_droptop_endH)
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	function lead_dropsides(event)
		if math.random() < .5 then lead_dropleft(event) else lead_dropright(event) end
	end
	function lead_droptopblue(event)
		local ent = Entity(lead_droptop_x + math.random()*(lead_droptop_xw-lead_droptop_w), 0, lead_droptop_w, lead_droptop_startH, 'bluebones')
		ent.alpha = bluebones_alpha
		ent:setLayer('lead')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			self.y = applyInterp('pow2In', alpha, screenY+screenHeight, screenY-self.height-1)
			if self.y+self.height < screenY then
				Entity.remove(self)
			end
			self.height = applyInterp('pow2In', alpha, lead_droptop_startH, lead_droptop_endH)
		end
		ent.onTouch = onTouch_blue
		ent.offTouch = offTouch_blue
		Entity.add(ent)
	end
	lead_square_h = 1
	lead_square_rate = .1
	function lead_square(event)
		local ent
		if event.note == 86 then
			lead_square_h = 1.5
			lead_square_rate = .03
			ent = Entity(width/2, height/2, lead_square_h, lead_square_h)
		else
			ent = Entity(sx+lead_square_h/2 + math.random()*(sw-lead_square_h), screenY+lead_square_h/2 + math.random()*(screenHeight-lead_square_h), lead_square_h, lead_square_h)
		end
		ent.originX, ent.originY = ent.width/2, ent.height/2
		ent.scaleX, ent.scaleY = 0, 0
		ent:setLayer('lead')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*.5)
			if alpha > 1 then
				alpha = 1 + (alpha-1)*lead_square_rate
			end
			self.scaleX = alpha
			self.scaleY = alpha
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
		
		function music:offNote2(event)
			ent.lifetime = 0
			local scale = ent.scaleX
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen*.2)
				if alpha > 1 then
					Entity.remove(self)
				end
				alpha = (1-alpha)*scale
				self.scaleX = alpha
				self.scaleY = alpha
			end
		end
	end
	
	function bass_expandbox(event)
		local ent = Entity(0, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*20)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
				tyArmR:setActive(tyArm2_R)
				tyArm2:setPhi(false)
				tesArmO:setPhi(false)
				tesArmB:setPhi(false)
				
				local ent = Entity(0, 0, 1, 1)
				ent:setLayer('block')
				ent.isVisible = blockVisible
				local tyx, tesx = ty.x, tes.x
				function ent:act(delta)
					local alpha = self.lifetime/(qtrlen*4)
					if alpha > 1 then
						alpha = 1
						Entity.remove(self)
					end
					ty.x = applyInterp('sine', alpha, tyx, width/2)
					tes.x = applyInterp('sineIn', alpha, tesx, sx+sw*2)
				end
				Entity.add(ent)
			end
			box.x = applyInterp('linear', alpha, 0, sx + scale)
			box.y = applyInterp('linear', alpha, 0, screenY + scale)
			box.width  = applyInterp('linear', alpha, box.initWidth , sw*unit - 2)
			box.height = applyInterp('linear', alpha, box.initHeight, screenHeight*unit - 2)
		end
		Entity.add(ent)
		
		tyArmR:setActive(tyArm1)
		tyArm1:setPhi(true)
		tyArm2:setPhi(true)
		tesArmO:setPhi(true)
		tesArmB:setPhi(true)
		
		musicmachine['bass'] = bass_bluebones
		musicmachine['bass']()
	end
	bass_squares_w = .5
	bass_squares_h = .5
	bass_squares_swaptime = .5
	bass_squares_lifetime = .75
	bass_squares_nextones = {n=3, removeAll=entarr_removeAll}
	bass_squares_rise_w = 1
	bass_squares_rise_h = 1
	bass_squares_drop_w = 1.5
	bass_squares_drop_h = 1.5
	bass_squares_dropB_w = .5
	bass_squares_dropB_h = .5
	function bass_squares(event)
		if #bass_squares_nextones == bass_squares_nextones.n then
			local swaptime, lifetime = qtrlen*bass_squares_swaptime, qtrlen*bass_squares_lifetime
			local ent = table.remove(bass_squares_nextones, 1)
			ent.alpha = 1
			ent.lifetime = 0
			function ent:act(delta)
				if self.lifetime < swaptime then
					self.scaleX = applyInterp('sineOut', self.lifetime/swaptime, 0, 1)
				elseif self.lifetime < lifetime then
					self.scaleX = applyInterp('sineIn', (self.lifetime-swaptime)/(lifetime-swaptime), 1, 0)
				else
					Entity.remove(self)
				end
				self.scaleY = self.scaleX
			end
			ent.onTouch = onTouch_hurt
		end
		
		local lenW = math.floor(sw/bass_squares_w)
		local lenH = math.floor(screenHeight/bass_squares_h)
		local nextone = Entity(sx+bass_squares_w/2 + math.floor(math.random()*lenW)*bass_squares_w + (sw-lenW*bass_squares_w)/2,
						  screenY+bass_squares_h/2 + math.floor(math.random()*lenH)*bass_squares_h + (screenHeight-lenH*bass_squares_h)/2,
					      bass_squares_w, bass_squares_h, 'bass')
		nextone.originX, nextone.originY = bass_squares_w/2, bass_squares_h/2
		nextone.alpha = .5
		nextone:setLayer('bass')
		table.insert(bass_squares_nextones, nextone)
		Entity.add(nextone)
	end
	bass_bluebones_left = false
	bass_bluebones_time = 10
	function bass_bluebones(event)
		local ent = Entity(0, 0, .5, 0, 'bluebones')
		ent.alpha = bluebones_alpha
		ent:setLayer('bass')
		ent.left = bass_bluebones_left
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*bass_bluebones_time)
			if alpha > 1 then
				Entity.remove(self)
			end
			if self.left then
				self.x = applyInterp('pow2In', alpha, sx, sx+sw)
			else
				self.x = applyInterp('pow2In', alpha, sx+sw-self.width, sx-self.width)
			end
			
			self.y = box.y+box.height*scale/2
			self.height = box.height*scale
			self.originY = self.height/2
			
			alpha = self.lifetime/(qtrlen*.5)
			if alpha > 1 then
				alpha = 1
			end
			self.scaleX = alpha
			self.scaleY = alpha
		end
		ent.onTouch = onTouch_blue
		ent.offTouch = offTouch_blue
		Entity.add(ent)
		
		bass_bluebones_left = not bass_bluebones_left
	end
	bass_squareswalls_width = .5
	bass_squareswalls_maxalpha = 1
	function bass_squareswalls(event)
		if bass_squareswalls_t == nil then
			bass_squareswalls_t = Entity(0, 0, 0, 0, 'bass')
			bass_squareswalls_t:setLayer('bass')
			bass_squareswalls_t.actalpha = 0
			function bass_squareswalls_t:act(delta)
				if self.actalpha > 0 then
					self.actalpha = self.actalpha - delta
					if self.actalpha < 0 then
						self.actalpha = 0
					end
				end
				self.x = box.x
				self.width = box.width*scale
				self.height = applyInterp('pow2In', self.actalpha/(bass_squareswalls_maxalpha*qtrlen), 0, bass_squareswalls_width)
				self.y = box.y+box.height*scale - self.height
			end
			bass_squareswalls_t.onTouch = onTouch_hurt
			Entity.add(bass_squareswalls_t)
			
			bass_squareswalls_b = Entity(0, 0, 0, 0, 'bass')
			bass_squareswalls_b:setLayer('bass')
			bass_squareswalls_b.actalpha = 0
			function bass_squareswalls_b:act(delta)
				if self.actalpha > 0 then
					self.actalpha = self.actalpha - delta
					if self.actalpha < 0 then
						self.actalpha = 0
					end
				end
				self.x = box.x
				self.width = box.width*scale
				self.height = applyInterp('pow2In', self.actalpha/(bass_squareswalls_maxalpha*qtrlen), 0, bass_squareswalls_width)
				self.y = box.y
			end
			bass_squareswalls_b.onTouch = onTouch_hurt
			Entity.add(bass_squareswalls_b)
			
			bass_squareswalls_l = Entity(0, 0, 0, 0, 'bass')
			bass_squareswalls_l:setLayer('bass')
			bass_squareswalls_l.actalpha = 0
			function bass_squareswalls_l:act(delta)
				if self.actalpha > 0 then
					self.actalpha = self.actalpha - delta
					if self.actalpha < 0 then
						self.actalpha = 0
					end
				end
				self.y = box.y
				self.height = box.height*scale
				self.width = applyInterp('pow2In', self.actalpha/(bass_squareswalls_maxalpha*qtrlen), 0, bass_squareswalls_width)
				self.x = box.x
			end
			bass_squareswalls_l.onTouch = onTouch_hurt
			Entity.add(bass_squareswalls_l)
			
			bass_squareswalls_r = Entity(0, 0, 0, 0, 'bass')
			bass_squareswalls_r:setLayer('bass')
			bass_squareswalls_r.actalpha = 0
			function bass_squareswalls_r:act(delta)
				if self.actalpha > 0 then
					self.actalpha = self.actalpha - delta
					if self.actalpha < 0 then
						self.actalpha = 0
					end
				end
				self.y = box.y
				self.height = box.height*scale
				self.width = applyInterp('pow2In', self.actalpha/(bass_squareswalls_maxalpha*qtrlen), 0, bass_squareswalls_width)
				self.x = box.x+box.width*scale - self.width
			end
			bass_squareswalls_r.onTouch = onTouch_hurt
			Entity.add(bass_squareswalls_r)
		end
		
		local rand = math.random()
		local ent
		    if rand < .25 then ent = bass_squareswalls_t
		elseif rand < .50 then ent = bass_squareswalls_b
		elseif rand < .75 then ent = bass_squareswalls_l
		else                   ent = bass_squareswalls_r end
		ent.actalpha = bass_squareswalls_maxalpha*qtrlen
		bass_squares(event)
	end
	
	arp_droptop_w = .1
	arp_droptop_h = .1
	arp_droptop_impulse = .001
	arp_droptop_counter = 0
	arp_droptop_beatcount = 2
	function arp_droptop(event)
		arp_droptop_counter = arp_droptop_counter + 1
		if arp_droptop_counter < arp_droptop_beatcount then return end
		arp_droptop_counter = 0
		
		local ent = Entity(sx + math.random()*(sw-arp_droptop_w), 0, arp_droptop_w, arp_droptop_h, 'arp')
		ent.velX = 0
		ent:setLayer('arp')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*12)
			self.y = applyInterp('linear', alpha, screenY+screenHeight, screenY-self.height-1)
			if self.y+self.height < screenY then
				Entity.remove(self)
			end
			self.velX = self.velX + gaussian()*arp_droptop_impulse
			self.x = self.x + self.velX
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	arp_spikes_w = .3
	arp_spikes_h = 2
	arp_spikes_swaptime = .25
	arp_spikes_lifetime = 1
	function arp_spikes(event)
		local swaptime, lifetime = qtrlen*arp_spikes_swaptime, qtrlen*arp_spikes_lifetime
		local ent = Entity(sx + ((event.note-45)/46)*(sw-arp_spikes_w), 0, arp_spikes_w, arp_spikes_h, 'arp')
		ent:setLayer('arp')
		function ent:act(delta)
			if self.lifetime < swaptime then
				self.y = applyInterp('sineIn', self.lifetime/swaptime, screenY-self.height, screenY)
			elseif self.lifetime < lifetime then
				self.y = applyInterp('sineIn', (self.lifetime-swaptime)/(lifetime-swaptime), screenY, screenY-self.height)
			else
				Entity.remove(self)
			end
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	
	local function drums_throwrod_aimArm(arm)
		arm.rotation = math.atan(((player.y+player.height/2)-(ty.y+arm.y))/((player.x+player.width/2)-(ty.x+arm.x))) + math.pi/2
		if player.x+player.width/2 < ty.x+arm.x then arm.rotation = arm.rotation + math.pi end
	end
	local function drums_throwrod_makeStaff(sprite, point, arm)
		local ent = Entity(ty.x+sprite.x + (point.x*math.cos(tyArmStaff1.rotation)-point.y*math.sin(tyArmStaff1.rotation)), 
			ty.y+sprite.y + (point.y*math.cos(tyArmStaff1.rotation)+point.x*math.sin(tyArmStaff1.rotation)), 'ty-staff-cropped')
		ent.originX, ent.originY = ent.width/2, ent.height/2
		ent.scaleX, ent.scaleY = .003, .003
		ent.rotation = math.atan(((player.y+player.height/2)-ent.y)/((player.x+player.width/2)-ent.x)) + math.pi/2
		if player.x+player.width/2 < ent.x then ent.rotation = ent.rotation + math.pi end
		ent:setLayer('drums')
		ent.startX, ent.startY = ent.x, ent.y
		ent.targetX = ent.startX + math.cos(ent.rotation-math.pi/2)*screenWidth
		ent.targetY = ent.startY + math.sin(ent.rotation-math.pi/2)*screenWidth
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*4)
			if alpha > 1 then
				Entity.remove(self)
			end
			self.x = applyInterp('sineIn', alpha, self.startX, self.targetX)
			self.y = applyInterp('sineIn', alpha, self.startY, self.targetY)
		end
		ent.onTouch = onTouch_hurt
		Entity.add(ent)
	end
	function drums_throwrod(event)
		if event.note == 72 then
			if tyArmR.active ~= tyArmStaff1 then
				tyArmR:setActive(tyArmStaff1)
			else
				tyArmL:setActive(tyArmStaff1_L)
			end
		elseif event.note == 78 then
			if tyArmR.active == tyArmStaff1 then
				tyArmR:setActive(tyArmStaff2)
				drums_throwrod_aimArm(tyArmStaff2)
				tyArmStaff2.lifetime = 0
				function tyArmStaff2:act(delta)
					if self.lifetime > qtrlen then tyArmR:setActive(tyArm1); self.act = nil end
				end
				drums_throwrod_makeStaff(tyArmStaff1, tyArmStaffPoint)
			end
			if tyArmL.active == tyArmStaff1_L then
				tyArmL:setActive(tyArmStaff2_L)
				drums_throwrod_aimArm(tyArmStaff2_L)
				tyArmStaff2_L.lifetime = 0
				function tyArmStaff2_L:act(delta)
					if self.lifetime > qtrlen then tyArmL:setActive(tyArm1_L); self.act = nil end
				end
				drums_throwrod_makeStaff(tyArmStaff1_L, tyArmStaffPoint_L)
			end
		end
	end
	function drums_predrop(event)
		-- ty close eyes
		-- grab a rod in each hand
	end
	drums_lazorz_w = 1
	drums_lazorz_dropB_w = .5
	drums_lazorz_nextones = {n=1, removeAll=entarr_removeAll}
	function drums_lazorz(event)
		if #drums_lazorz_nextones == drums_lazorz_nextones.n then
			local ent = table.remove(drums_lazorz_nextones, 1)
			ent.alpha = 1
			ent.lifetime = 0
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen)
				if alpha > 1 then
					alpha = 1
					Entity.remove(self)
				end
				self.scaleX = applyInterp('sineIn', alpha, 1, 0)
			end
			ent.onTouch = onTouch_hurt
		end
		
		local nextone = Entity(sx + math.random()*(sw-drums_lazorz_w)+drums_lazorz_w/2, screenY, drums_lazorz_w, screenHeight, 'drums')
		nextone.originX = nextone.width/2
		nextone.alpha = 0.5
		nextone:setLayer('drums')
		table.insert(drums_lazorz_nextones, nextone)
		Entity.add(nextone)
	end
	drums_bones_w = .1
	function drums_bones_left(event)
		local ent = Entity(0, 0, drums_bones_w, box.height*scale/2, 'bluebones')
		ent.alpha = bluebones_alpha
		ent:setLayer('drums')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*16)
			self.x = applyInterp('linear', alpha, sx, sx+sw+1)
			if self.x > sx+sw then
				Entity.remove(self)
			end
			self.y = box.y
			
			alpha = self.lifetime/(qtrlen*.5)
			if alpha > 1 then
				alpha = 1
			end
			self.scaleY = alpha
		end
		ent.onTouch = onTouch_blue
		ent.offTouch = offTouch_blue
		Entity.add(ent)
		
		drums_bones_side = drums_bones_right
	end
	function drums_bones_right(event)
		local ent = Entity(0, 0, drums_bones_w, box.height*scale/2, 'bluebones')
		ent.originY = ent.height
		ent.alpha = bluebones_alpha
		ent:setLayer('drums')
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*16)
			self.x = applyInterp('linear', alpha, sx+sw-self.width, sx-self.width-1)
			if self.x+self.width < sx then
				Entity.remove(self)
			end
			self.y = box.y+box.height*scale
			
			alpha = self.lifetime/(qtrlen*.5)
			if alpha > 1 then
				alpha = 1
			end
			self.scaleY = alpha
		end
		ent.onTouch = onTouch_blue
		ent.offTouch = offTouch_blue
		Entity.add(ent)
		
		drums_bones_side = drums_bones_left
	end
	drums_bones_side = drums_bones_left
	function drums_bones(event)
		drums_bones_side(event)
	end
	drums_gun_w = .3
	drums_gun_h = 1
	drums_gun_yh = 3
	drums_gun_margin = 2
	drums_gun_angle = math.pi/6
	drums_gun_mag = 3
	drums_gun_count = 1
	function drums_gun(event)
		-- kick - launch
		-- snare - explode
		-- kick - start unexplode
		-- revsnare - start unlaunch
		if drums_gun_count == 1 then
			local ent = Entity(sx + drums_gun_margin + math.random()*(sw - drums_gun_margin*2), 0, drums_gun_w, drums_gun_h, 'drums')
			ent.originX, ent.originY = ent.width/2, ent.height/2
			ent:setLayer('drums')
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen*2)
				self.y = applyInterp('pow2Out', alpha, screenY-drums_gun_h/2, screenY+drums_gun_yh)
				if alpha >= 1 then
					self.lifetime = 0
					local oldX, oldY = self.x, self.y
					local targetX, targetY = drums_gun_mag*math.sin(drums_gun_angle), drums_gun_mag*math.cos(drums_gun_angle)
					
					function self:act(delta)
						local alpha = self.lifetime/(qtrlen*2)
						self.y = applyInterp('pow2Out', alpha, oldY, oldY+drums_gun_mag)
						if self.y+self.height < screenY then
							Entity.remove(self)
						end
					end
					
					local entL = Entity(self.x, self.y, self.width, self.height, 'drums')
					entL.originX, entL.originY = self.originX, self.originY
					entL.rotation = drums_gun_angle
					entL:setLayer('drums')
					function entL:act(delta)
						local alpha = self.lifetime/(qtrlen*2)
						if alpha > 2 then
							Entity.remove(self)
						end
						self.x = applyInterp('pow2Out', alpha, oldX, oldX-targetX)
						self.y = applyInterp('pow2Out', alpha, oldY, oldY+targetY)
					end
					entL.onTouch = self.onTouch
					entL.offTouch = self.offTouch
					Entity.add(entL)
					
					local entR = Entity(self.x, self.y, self.width, self.height, 'drums')
					entR.originX, entR.originY = self.originX, self.originY
					entR.rotation = -drums_gun_angle
					entR:setLayer('drums')
					function entR:act(delta)
						local alpha = self.lifetime/(qtrlen*2)
						if alpha > 2 then
							Entity.remove(self)
						end
						self.x = applyInterp('pow2Out', alpha, oldX, oldX+targetX)
						self.y = applyInterp('pow2Out', alpha, oldY, oldY+targetY)
					end
					entR.onTouch = self.onTouch
					entR.offTouch = self.offTouch
					Entity.add(entR)
				end
			end
			ent.onTouch = onTouch_hurt
			Entity.add(ent)
		end
		drums_gun_count = drums_gun_count + 1
		if drums_gun_count > 4 then drums_gun_count = 1 end
	end
	function drums_bonegun(event)
		drums_bones(event)
		drums_gun(event)
	end
	function drums_dropB(event)
		local ent = Entity(0, 1, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		local oldX, oldY = box.x, box.y
		local oldW, oldH = box.width, box.height
		local tesArmORot, tesArmBRot = tesArmO.rotation, tesArmB.rotation
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*2)
			if alpha > 1 then
				alpha = 1
				Entity.remove(self)
			end
			if alpha < .33 then
				box.x = applyInterp('pow2Out', alpha/.33, oldX, oldX+.5)
			else
				box.x = applyInterp('pow2In', (alpha-.33)/.67, oldX+.5, sx+drums_boxillate_margin)
			end
			box.y = applyInterp('linear', alpha, oldY, screenY+drums_boxillate_margin)
			box.width  = applyInterp('linear', alpha, oldW, 4*unit)
			box.height = applyInterp('linear', alpha, oldH, 4*unit)
			tesArmO.rotation = applyInterp('sineIn', alpha, tesArmORot, math.pi/4)
			tesArmB.rotation = applyInterp('sineIn', alpha, tesArmBRot, -math.pi/4)
		end
		Entity.add(ent)
		
		tesArmO.act = nil
		tesArmB.act = nil
		tesArmO:setPhi(true)
		
		musicmachine['drums'] = nil
	end
	drums_boxillate_margin = scale
	drums_boxillate_count = 1
	drums_boxillate_time = 1
	drums_boxillate_offset = 0
	local function boxL()
		return sx+drums_boxillate_margin
	end
	local function boxR()
		return sx+sw-drums_boxillate_margin-box.width*scale
	end
	local function boxB()
		return screenY+drums_boxillate_margin
	end
	local function boxT()
		return screenY+screenHeight-drums_boxillate_margin-box.height*scale
	end
	function drums_boxillate(event)
		if drums_boxillate_count % 2 == drums_boxillate_offset then
			local ent = Entity(0, 1, 1, 1)
			ent:setLayer('block')
			ent.isVisible = blockVisible
			
			-- topleft, topright, bottomright, bottomleft
			local beat = (drums_boxillate_count-1)/2
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen*drums_boxillate_time)
				if alpha > 1 then
					if alpha > 2 then
						Entity.remove(self)
					end
					
					alpha = 1
				end
				
				if beat < 1 then
					box.x = boxL()
					box.y = applyInterp('pow2In', alpha, boxB(), boxT())
					tesArmO.rotation = applyInterp('sineIn', alpha, math.pi/4, -math.pi/4)
					tesArmB.rotation = applyInterp('sineIn', alpha, -math.pi/4, math.pi/4)
				elseif beat < 2 then
					box.x = applyInterp('pow2In', alpha, boxL(), boxR())
					box.y = boxT()
					tesArmO.rotation = applyInterp('sine', alpha*2, -math.pi/4, -math.pi/2)
					tesArmB.rotation = applyInterp('sine', alpha*2, math.pi/4, math.pi/2)
					if alpha >= .5 then
						tesArmO:setPhi(false)
						tesArmB:setPhi(true)
					end
				elseif beat < 3 then
					box.x = boxR()
					box.y = applyInterp('pow2In', alpha, boxT(), boxB())
					tesArmB.rotation = applyInterp('sineIn', alpha, math.pi/4, -math.pi/4)
					tesArmO.rotation = applyInterp('sineIn', alpha, -math.pi/4, math.pi/4)
				else
					box.x = applyInterp('pow2In', alpha, boxR(), boxL())
					box.y = boxB()
					tesArmB.rotation = applyInterp('sine', alpha*2, -math.pi/4, -math.pi/2)
					tesArmO.rotation = applyInterp('sine', alpha*2, math.pi/4, math.pi/2)
					if alpha >= .5 then
						tesArmB:setPhi(false)
						tesArmO:setPhi(true)
					end
				end
			end
			Entity.add(ent)
		end
		drums_boxillate_count = drums_boxillate_count + 1
		if drums_boxillate_count > 8 then drums_boxillate_count = 1 end
	end
	function drums_lazorzsides(event)
		if #drums_lazorz_nextones == drums_lazorz_nextones.n then
			local ent = table.remove(drums_lazorz_nextones, 1)
			ent.alpha = 1
			ent.lifetime = 0
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen)
				if alpha > 1 then
					alpha = 1
					Entity.remove(self)
				end
				self.scaleX = applyInterp('sineIn', alpha, 1, 0)
			end
			ent.onTouch = onTouch_hurt
		end
		
		local x = math.random()*(3-drums_lazorz_w)+drums_lazorz_w/2
		if math.random() < .5 then
			x = sx+x
		else
			x = sx+sw-x
		end
		local nextone = Entity(x, screenY, drums_lazorz_w, screenHeight, 'drums')
		nextone.originX = nextone.width/2
		nextone.alpha = 0.5
		nextone:setLayer('drums')
		table.insert(drums_lazorz_nextones, nextone)
		Entity.add(nextone)
	end
	function drums_boxillazorz(event)
		drums_boxillate(event)
		drums_lazorzsides(event)
	end
	function drums_boxillategun(event)
		drums_boxillate(event)
		drums_gun(event)
	end
	
	function growl_tyjump(event)
		bass_squares_nextones:removeAll()
		tyArmR:setActive(tyArm2_R)
		tyArmL:setActive(tyArm2)
	end
	function growl_tyjump_off(self, event)
		tyArmR:setActive(tyArm1)
		tyArmL:setActive(tyArm1_L)
	end
	growl_tyflybones_speed = 10
	growl_tyflybones_beat = 0
	growl_tyflybones_left = false
	function growl_tyflybones_spawnbone()
		if tyf.lifetime >= qtrlen*.25 then
			tyf.lifetime = tyf.lifetime - qtrlen*.25
			local ent = Entity(tyf.x, tyf.y, .7, .1)
			--ent.alpha = bluebones_alpha
			ent:setLayer('lead')
			ent.vel = 0
			ent.left = growl_tyflybones_left
			function ent:act(delta)
				self.vel = self.vel + .2*delta*(self.left and 1 or -1)
				self.x = self.x + self.vel
				if self.x < screenX or self.x > screenX+screenWidth then
					Entity.remove(self)
				end
			end
			ent.onTouch = onTouch_hurt
			--ent.offTouch = offTouch_blue
			Entity.add(ent)
			growl_tyflybones_left = not growl_tyflybones_left
		end
	end
	function growl_tyflybones(event)
		growl_tyflybones_beat = growl_tyflybones_beat + 1
		
		tyf.lifetime = 0
		if growl_tyflybones_beat % 2 == 0 then
			tyf.x, tyf.y = sx-4, screenY+screenHeight+3
			tyf.rotation = -math.atan(3/4)
			tyf.scaleX = -tyf.scaleX
			function tyf:act(delta)
				tyf.x = tyf.x + growl_tyflybones_speed*delta
				tyf.y = tyf.y - growl_tyflybones_speed*3/4*delta
				growl_tyflybones_spawnbone()
			end
		else
			tyf.x, tyf.y = sx+sw+4, screenY+screenHeight+3
			tyf.rotation = math.atan(3/4)
			tyf.scaleX = -tyf.scaleX
			function tyf:act(delta)
				tyf.x = tyf.x - growl_tyflybones_speed*delta
				tyf.y = tyf.y - growl_tyflybones_speed*3/4*delta
				growl_tyflybones_spawnbone()
			end
		end
	end
	
	pads_sine_startW = .1
	pads_sine_endW = sx-screenX
	pads_sine_oldStartW = pads_sine_startW
	pads_sine_oldEndW = pads_sine_endW
	pads_sine_h = .3
	pads_sine_ents = {n=25}
	pads_sine_speedOffset = 0
	pads_sine_lengthOffset = 0
	function pads_sine(event)
		if event.note == 38 then
			local ent = Entity(1, 0, 1, 1)
			ent:setLayer('block')
			ent.isVisible = blockVisible
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen*.1)
				if alpha > 1 then
					alpha = 1
					Entity.remove(self)
				end
				pads_sine_startW = applyInterp('sineOut', alpha, pads_sine_oldStartW, 0)
				pads_sine_endW = applyInterp('sineOut', alpha, pads_sine_oldEndW, 0)
			end
			Entity.add(ent)
			return
		end
		
		if pads_sine_startW == 0 then
			local ent = Entity(1, 0, 1, 1)
			ent:setLayer('block')
			ent.isVisible = blockVisible
			function ent:act(delta)
				local alpha = self.lifetime/(qtrlen*.1)
				if alpha > 1 then
					alpha = 1
					Entity.remove(self)
				end
				pads_sine_startW = applyInterp('sineIn', alpha, 0, pads_sine_oldStartW)
				pads_sine_endW = applyInterp('sineIn', alpha, 0, pads_sine_oldEndW)
			end
			Entity.add(ent)
		end
		
		local startSpeedOffset = pads_sine_speedOffset
		local endSpeedOffset = math.random()*8+2.5
		if math.random() < .5 then endSpeedOffset = endSpeedOffset*-1 end
		local startLengthOffset = pads_sine_lengthOffset
		local endLengthOffset = (1-(event.note-55)/7)+1 + gaussian()*.5
		local ent = Entity(0, 0, 1, 1)
		ent:setLayer('block')
		ent.isVisible = blockVisible
		function ent:act(delta)
			local alpha = self.lifetime/(qtrlen*.3)
			if alpha > 1 then
				local alpha = 1
				Entity.remove(self)
			end
			pads_sine_speedOffset = applyInterp('sine', alpha, startSpeedOffset, endSpeedOffset)
			pads_sine_lengthOffset = applyInterp('sine', alpha, startLengthOffset, endLengthOffset)
		end
		Entity.add(ent)
		
		if not pads_sine_ents[1] then
			for i=1, pads_sine_ents.n do
				local entL = Entity(0, screenY + (i-1)/(pads_sine_ents.n-1)*(screenHeight-pads_sine_h), 0, pads_sine_h, 'pads')
				local entR = Entity(sx+sw, entL.y, 0, entL.height, 'pads')
				entL:setLayer('pads')
				entR:setLayer('pads')
				entL.i = i
				entL.other = entR
				entL.sinealpha = 0
				function entL:act(delta)
					self.sinealpha = self.sinealpha + delta*pads_sine_speedOffset
					self.width = pads_sine_startW + (pads_sine_endW-pads_sine_startW)*((math.sin(self.sinealpha + (self.i-pads_sine_ents.n/2)/pads_sine_lengthOffset)+1)/2)
					self.x = sx-self.width
					self.other.width = self.width
				end
				entL.onTouch = onTouch_hurt
				entR.onTouch = onTouch_hurt
				pads_sine_ents[i] = entL
				Entity.add(entL)
				Entity.add(entR)
			end
		end
	end
	
	function music:onNote0(event)
		println("on", event.channel, event.tick, event.time)
	end
	
	function music:onNote1(event)
		if musicmachine['block'] then musicmachine['block'](event) end
	end
	function music:onNote2(event)
		if musicmachine['lead']  then musicmachine['lead'] (event) end
	end
	function music:onNote3(event)
		if musicmachine['bass']  then musicmachine['bass'] (event) end
	end
	function music:onNote4(event)
		if musicmachine['arp']   then musicmachine['arp']  (event) end
	end
	function music:onNote5(event)
		if musicmachine['drums'] then musicmachine['drums'](event) end
	end
	function music:onNote6(event)
		if musicmachine['growl'] then musicmachine['growl'](event) end
	end
	function music:onNote7(event)
		if musicmachine['pads']  then musicmachine['pads'] (event) end
	end
	function music:onNote8(event)
		if musicmachine['bells'] then musicmachine['bells'](event) end
	end
	
	musicmachine['block'] = block_intro
	music:play()
	
	println(Entity.list())
end

function onDestroy(self)
	music:dispose()
end