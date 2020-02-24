name = "Slime"
setStats(null,0,4,4,4,30,20,10,10) -- 1st is statlv, 2nd is str
encounter = "A slime hopped close!"
setSkin("mr_slime")
canFlee = true
setMusic("Stronger Monsters")
channelWeapon(0, "fistweapon")
channelWeapon(3, "fistheal")
channelWeapon(4, "fistattack")

function onDie()
    map.say("Slime: \"No! I've been defeated!\"")
end
--[[onWin = {
    map.say("Slime: \"Yes! I have won!\"")
}--]]
function onEncounter()
    map.say("Slime: \"Prepare to die!\"")
end