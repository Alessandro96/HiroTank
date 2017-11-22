
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )

local physics = require("physics")
physics.start()
local perspective = require("lib.perspective")
require("lib.LD_LoaderX")

local m = {}
m.result = "none"
m.rotate = {}
local image
local myLevel = {}
local classTerreno
local classSalita
local cielo
local objTerreno = {}
local objSalita = {}
local ruota1, ruota2
local chassis, sospensione1, sospensione2, tank
local cannon, sx, dx, sparo
local pistonJoint1, pistonJoint2
local pivotJoint1, pivotJoint2, pivotJointCannon
local weldJoint
local distanceJoint
local tankCollider = {categoryBits = 1, maskBits = 1}
local chassisCollider = {categoryBits = 2, maskBits = 2}
local camera
local backGroup
local mainGroup

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

--------------------------------------------------------------------------------
--FUNZIONI PULSANTI MOVIMENTO RUOTE
--------------------------------------------------------------------------------
local function dx()
    ruota2:applyTorque(1)
end

local function sx()
    ruota2:applyTorque(-1)
end

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
--FUNZIONI CANNONE
--------------------------------------------------------------------------------

local function rotazioneDx(self, event)
  cannon.rotation = cannon.rotation + 5
end

local function rotazioneSx(self, event)
  cannon.rotation = cannon.rotation -5
end

local function shoot (event)
    local ball = display.newCircle( cannon.x, cannon.y, 10 )
    physics.addBody( ball, "dynamic",{density = 0, friction = 0.3, bounce = 0.5, radius =20, filter =  chassisCollider})
    ball.isBullet = true
    ball.rotation = -30
    local speed = 500
    local angle = math.rad(cannon.rotation-90)
    ball:setLinearVelocity(math.cos(angle) * speed, math.sin(angle) * speed)
    camera:add(ball, 2, false)
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

  physics.pause()
  camera = perspective.createView()
  myLevel= LD_Loader:new()
  myLevel:loadLevel("Level01")

--------------------------------------------------------------------------------
--BACKGROUND
--------------------------------------------------------------------------------

  cielo = display.newImageRect("images/sky.jpg", display.contentWidth, display.contentHeight)
  cielo.x = display.contentCenterX
  cielo.y = display.contentCenterY

--------------------------------------------------------------------------------
--TANK
--------------------------------------------------------------------------------

	tank = display.newImageRect("images/tank1.png", 120, 45)
	tank.x = display.contentCenterX-700
	tank.y = display.contentCenterY+300
	physics.addBody(tank, {filter = tankCollider})

	chassis = display.newImageRect("images/blocco.png", 120, 15)
	chassis.x = tank.x
	chassis.y = tank.y
	physics.addBody(chassis, {filter =  chassisCollider})

	sospensione1 = display.newImageRect("images/blocco.png", 15, 33)
	sospensione1.x = chassis.x-40
	sospensione1.y = chassis.y+10
	physics.addBody(sospensione1, {filter =  chassisCollider})

	sospensione2 = display.newImageRect("images/blocco.png", 15, 33)
	sospensione2.x = chassis.x+40
	sospensione2.y = chassis.y+10
	physics.addBody(sospensione2, {filter =  chassisCollider})

	ruota1 = display.newImageRect("images/ruota.png", 30,30)
	ruota1.x = sospensione1.x
	ruota1.y = sospensione1.y+30
	physics.addBody(ruota1, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})

	ruota2 = display.newImageRect("images/ruota.png", 30,30)
	ruota2.x = sospensione2.x
	ruota2.y = sospensione2.y+30
	physics.addBody(ruota2, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})

--------------------------------------------------------------------------------
--CANNONE
--------------------------------------------------------------------------------

  cannon = display.newImageRect("images/Untitled.png", 40, 60  )
  cannon.x = tank.x+20
  cannon.y = tank.y-40
  physics.addBody( cannon, "dynamic", { density=0, friction=100, bounce=0, isSensor=true} )
  cannon.rotation=0

--------------------------------------------------------------------------------
--PROIETTILE
--------------------------------------------------------------------------------

  sparo = display.newImageRect("images/missile2.png", 34, 67)
  sparo.x = 100
  sparo.y = 200

--------------------------------------------------------------------------------
--PULSANTI CANNONE
--------------------------------------------------------------------------------

  sx = display.newImageRect("images/bottone.png", 50, 50)
  sx.x = display.contentCenterX-150
  sx.y = display.contentCenterY

  dx = display.newImageRect("images/bottone.png", 50, 50)
  dx.x = display.contentCenterX+150
  dx.y = display.contentCenterY

--------------------------------------------------------------------------------
--LAYOUT TERRENO
--------------------------------------------------------------------------------

  classTerreno = myLevel:layerObjectsWithClass("terreno", "pianura")
  classSalita = myLevel:layerObjectsWithClass("salita", "salita")

--------------------------------------------------------------------------------
--PULSANTI MOVIMENTO TANK
--------------------------------------------------------------------------------

  m.rotate.left = display.newImageRect("images/sx.png", 60, 40)
  	m.rotate.left.x = display.screenOriginX + m.rotate.left.contentWidth + 10
  	m.rotate.left.y = display.contentHeight - m.rotate.left.contentHeight - 10
  	m.rotate.left.result = "rotate:left"

  m.rotate.right = display.newImageRect("images/dx.png", 60, 40)
  	m.rotate.right.x = display.contentWidth - display.screenOriginX - m.rotate.right.contentWidth - 10
  	m.rotate.right.y = display.contentHeight - m.rotate.right.contentHeight - 10
  	m.rotate.right.result = "rotate:right"

--------------------------------------------------------------------------------
--JOINT
--------------------------------------------------------------------------------

	pistonJoint1 = physics.newJoint("piston", chassis, sospensione1, sospensione1.x, sospensione1.y, 0, 1)
	pistonJoint1.isLimitEnabled = true
	pistonJoint1:setLimits(-10, 10)

	pistonJoint2 = physics.newJoint("piston", chassis, sospensione2, sospensione2.x, sospensione2.y, 0, 1)
	pistonJoint2.isLimitEnabled = true
	pistonJoint2:setLimits(-10, 10)

	pivotJoint1 = physics.newJoint("pivot", sospensione1, ruota1, ruota1.x, ruota1.y)
	pivotJoint2 = physics.newJoint("pivot", sospensione2, ruota2, ruota2.x, ruota2.y)
  pivotJointCannon = physics.newJoint("pivot", cannon, tank, cannon.x, cannon.y)

	weldJoint = physics.newJoint("weld", chassis, tank, chassis.x, chassis.y)

	distanceJoint = physics.newJoint("distance", ruota1, ruota2, ruota1.x, ruota1.y, ruota2.x, ruota2.y)

--------------------------------------------------------------------------------
--CAMERA
--------------------------------------------------------------------------------

  for i=1, #classTerreno, 1 do
      objTerreno[i] = myLevel:getLayerObject("terreno", classTerreno[i].name).view
      camera:add(objTerreno[i], 3, false)
  end

  for i=1, #classSalita, 1 do
      objSalita[i] = myLevel:getLayerObject("salita", classSalita[i].name).view
      camera:add(objSalita[i], 2, false)
  end

  camera:add(cielo, 5, false)
  camera:add(tank, 2, true)
  camera:add(chassis, 6, false)
  camera:add(sospensione1, 6, false)
  camera:add(sospensione2, 6, false)
  camera:add(ruota1, 4, false)
  camera:add(ruota2, 4, false)
  camera:add(cannon, 1, false)

  camera:track()
  camera:setBounds(-20000, 20000, -20000, 550)

--------------------------------------------------------------------------------
--RICHIAMO LE FUNZIONI
--------------------------------------------------------------------------------

  sx:addEventListener("tap", rotazioneSx)
  dx:addEventListener("tap", rotazioneDx)
  sparo:addEventListener("tap", shoot)
  m.rotate.left:addEventListener("touch", m.touch)
  m.rotate.right:addEventListener("touch", m.touch)
  chassis:addEventListener("touch", trascinaChassis)

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
    physics.start()
    Runtime:addEventListener("enterFrame", enterFrame)
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
    camera:destroy()
    Runtime:removeEventListener( "enterFrame", enterFrame )
    physics.pause()
    composer.removeScene( "game" )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
