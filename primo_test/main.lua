-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on ven ott 27 13:34:32 2017
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
local ruota1, ruota2

local perspective = require("perspective")

require("lib.LD_LoaderX")
physics = require ("physics")
physics.start()

local camera = perspective.createView()

local myLevel = {}
myLevel= LD_Loader:new()
myLevel:loadLevel("Level01") --replace with your level name here

local function trascinaChassis(event)
    local chassis = event.target
    local phase = event.phase
    if(phase == "began")then
      display.currentStage:setFocus( chassis )
      chassis.touchOffsetX = event.x-chassis.x
      chassis.touchOffsetY = event.y-chassis.y
    elseif(phase == "ended" or phase == "cancelled") then
      display.currentStage:setFocus( nil )
    elseif(phase == "moved") then
      chassis.x = event.x-chassis.touchOffsetX
      chassis.y = event.y-chassis.touchOffsetY
    end
end

local function dx()
    ruota1:applyTorque(1)
    ruota2:applyTorque(1)
end

local function sx()
    ruota1:applyTorque(-1)
    ruota2:applyTorque(-1)
end

local tastoDx = display.newImageRect("sx.png", 60, 40)
tastoDx.x = display.contentWidth-50
tastoDx.y = 100

local tastoSx = display.newImageRect("sx.png", 60, 40)
tastoSx.x = 50
tastoSx.y = 100

local chassis = display.newImageRect("blocco.png", 120, 15)
chassis.x = display.contentCenterX-700
chassis.y = display.contentCenterY-300
physics.addBody(chassis)

local sospensione1 = display.newImageRect("blocco.png", 15, 33)
sospensione1.x = chassis.x-40
sospensione1.y = chassis.y+10
physics.addBody(sospensione1)

local sospensione2 = display.newImageRect("blocco.png", 15, 33)
sospensione2.x = chassis.x+40
sospensione2.y = chassis.y+10
physics.addBody(sospensione2)

ruota1 = display.newImageRect("ruota.png", 30,30)
ruota1.x = sospensione1.x
ruota1.y = sospensione1.y+30
physics.addBody(ruota1, {radius=15, friction = 10, bounce = 0.5})

ruota2 = display.newImageRect("ruota.png", 30,30)
ruota2.x = sospensione2.x
ruota2.y = sospensione2.y+30
physics.addBody(ruota2, {radius=15, friction = 10, bounce = 0.5})

local pistonJoint1 = physics.newJoint("piston", chassis, sospensione1, sospensione1.x, sospensione1.y, 0, 1)
pistonJoint1.isLimitEnabled = true
pistonJoint1:setLimits(-10, 10)

local pistonJoint2 = physics.newJoint("piston", chassis, sospensione2, sospensione2.x, sospensione2.y, 0, 1)
pistonJoint2.isLimitEnabled = true
pistonJoint2:setLimits(-10, 10)

local pivotJoint1 = physics.newJoint("pivot", sospensione1, ruota1, ruota1.x, ruota1.y)
local pivotJoint2 = physics.newJoint("pivot", sospensione2, ruota2, ruota2.x, ruota2.y)

camera.damping = 10 -- A bit more fluid tracking
camera:setFocus(chassis) -- Set the focus to the player
camera:track() -- Begin auto-tracking


chassis:addEventListener("touch", trascinaChassis)
tastoDx:addEventListener("tap", dx)
tastoSx:addEventListener("tap", sx)




