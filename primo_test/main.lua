-----------------------------------------------------------------------------------------
-- Level Director
-- main.lua
-- Created on ven ott 27 13:34:32 2017

--good
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

local image = display.newImageRect( "images/sky.jpg",
               display.contentWidth, display.contentHeight) 
image.x = display.contentCenterX
image.y = display.contentCenterY

local ruota1, ruota2

local tankCollider = {categoryBits = 1, maskBits = 1}
local chassisCollider = {categoryBits = 2, maskBits = 2}

local perspective = require("8675733.perspective")
local camera = perspective.createView()

require("lib.LD_LoaderX")
physics = require ("physics")
physics.start()


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
    ruota2:applyTorque(1)
end

local function sx()
    ruota2:applyTorque(-1)
end

--------------------------------------------------------------------------------
-- creazione pulsanti
--------------------------------------------------------------------------------
local m = {}
m.result = "none"
m.rotate = {}

m.rotate.left = display.newImageRect("sx.png", 60, 40)
	m.rotate.left.x = display.screenOriginX + m.rotate.left.contentWidth + 10
	m.rotate.left.y = display.contentHeight - m.rotate.left.contentHeight - 10
	m.rotate.left.result = "rotate:left"

m.rotate.right = display.newImageRect("dx.png", 60, 40)
	m.rotate.right.x = display.contentWidth - display.screenOriginX - m.rotate.right.contentWidth - 10
	m.rotate.right.y = display.contentHeight - m.rotate.right.contentHeight - 10
	m.rotate.right.result = "rotate:right"

	------------------------------------------------------------------------------
-- avanti e indietro
--------------------------------------------------------------------------------
function m.touch(event)
	local t = event.target

	if "began" == event.phase then
		display.getCurrentStage():setFocus(t)
		t.isFocus = true
		m.result = t.result

		if t.result == "rotate:left" then
			ruota1:applyTorque(-1)
			ruota2:applyTorque(-1)
		elseif t.result == "rotate:right" then
			ruota1:applyTorque(1)
            ruota2:applyTorque(1)
			end

	    elseif t.isFocus then
		if "moved" == event.phase then

		elseif "ended" == event.phase then
			display.getCurrentStage():setFocus(nil)
			t.isFocus = false
			m.result = "none"
		end
	end
end

m.rotate.left:addEventListener("touch", m.touch)
m.rotate.right:addEventListener("touch", m.touch)


--------------------------------------------------------------------------------
--INIZIALIZZAZIONE TANK
--------------------------------------------------------------------------------
local tank = display.newImageRect("tank1.png", 120, 45)
tank.x = display.contentCenterX-700
tank.y = display.contentCenterY+300
physics.addBody(tank, {filter = tankCollider})

local chassis = display.newImageRect("blocco.png", 120, 15)
chassis.x = tank.x
chassis.y = tank.y
physics.addBody(chassis, {filter =  chassisCollider})

local sospensione1 = display.newImageRect("blocco.png", 15, 33)
sospensione1.x = chassis.x-40
sospensione1.y = chassis.y+10
physics.addBody(sospensione1, {filter =  chassisCollider})

local sospensione2 = display.newImageRect("blocco.png", 15, 33)
sospensione2.x = chassis.x+40
sospensione2.y = chassis.y+10
physics.addBody(sospensione2, {filter =  chassisCollider})

ruota1 = display.newImageRect("ruota.png", 30,30)
ruota1.x = sospensione1.x
ruota1.y = sospensione1.y+30
physics.addBody(ruota1, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})

ruota2 = display.newImageRect("ruota.png", 30,30)
ruota2.x = sospensione2.x
ruota2.y = sospensione2.y+30
physics.addBody(ruota2, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})

local pistonJoint1 = physics.newJoint("piston", chassis, sospensione1, sospensione1.x, sospensione1.y, 0, 1)
pistonJoint1.isLimitEnabled = true
pistonJoint1:setLimits(-10, 10)

local pistonJoint2 = physics.newJoint("piston", chassis, sospensione2, sospensione2.x, sospensione2.y, 0, 1)
pistonJoint2.isLimitEnabled = true
pistonJoint2:setLimits(-10, 10)

local pivotJoint1 = physics.newJoint("pivot", sospensione1, ruota1, ruota1.x, ruota1.y)
local pivotJoint2 = physics.newJoint("pivot", sospensione2, ruota2, ruota2.x, ruota2.y)

local weldJoint = physics.newJoint("weld", chassis, tank, chassis.x, chassis.y)

--------------------------------------------------------------------------------
-- Runtime Loop // qui c'� il trucco
--------------------------------------------------------------------------------
local function enterFrame(event)
	if m.result == "rotate:left" then
			ruota2:applyTorque(-1)
	elseif m.result == "rotate:right" then
            ruota2:applyTorque(1)

	elseif m.result == "none" then
			ruota1:applyTorque(0)
            ruota2:applyTorque(0)
	end
end

--------------------------------------------------------------------------------
--MOVIMENTO TELECAMERA
--------------------------------------------------------------------------------
local classTerreno = myLevel:layerObjectsWithClass("terreno", "pianura")
local classSalita = myLevel:layerObjectsWithClass("salita", "salita")
local cielo = myLevel:getLayerObject("bg", 'sky_0').view
local objTerreno = {}
local objSalita = {}

for i=1, #classTerreno, 1 do
    objTerreno[i] = myLevel:getLayerObject("terreno", classTerreno[i].name).view
    camera:add(objTerreno[i], 3, false)
end

for i=1, #classSalita, 1 do
    objSalita[i] = myLevel:getLayerObject("salita", classSalita[i].name).view
    camera:add(objSalita[i], 2, false)
end

camera:add(cielo, 5, false)
camera:add(tank, 1, true)
camera:add(chassis, 6, false)
camera:add(sospensione1, 6, false)
camera:add(sospensione2, 6, false)
camera:add(ruota1, 4, false)
camera:add(ruota2, 4, false)
camera:track()
camera:setBounds(-20000, 20000, -20000, 550)

--------------------------------------------------------------------------------
-- Add Listeners
--------------------------------------------------------------------------------
Runtime:addEventListener("enterFrame", enterFrame)
chassis:addEventListener("touch", trascinaChassis)
