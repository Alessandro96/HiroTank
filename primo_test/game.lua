
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
local proiettile = require("class.proiettile")
local cannone = require("class.cannon")
local carrarmato = require("class.carrarmato")
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

--------------------------------------------------------------------------------
--FUNZIONI PULSANTI MOVIMENTO RUOTE
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

local function enterFrame(event)
	if m.result == "rotate:left" then
      ruota1:applyTorque(-1)
			ruota2:applyTorque(-1)
	elseif m.result == "rotate:right" then
      ruota2:applyTorque(1)
      ruota2:applyTorque(1)
	elseif m.result == "none" then
			ruota1:applyTorque(0)
      ruota2:applyTorque(0)
	end
end

--------------------------------------------------------------------------------
--FUNZIONE PROIETTILE
--------------------------------------------------------------------------------

local function shoot (event)
    local ball = proiettile.newBall({x=cannon.x, y=cannon.y})
    ball:shoot(cannon.rotation, camera)
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
	tank = carrarmato.newTank(tankCollider)

	chassis = carrarmato.newChassis(tank.x, tank.y, chassisCollider)

	sospensione1 = carrarmato.newSospensioneSx(chassis.x, chassis.y, chassisCollider)

	sospensione2 = carrarmato.newSospensioneDx(chassis.x, chassis.y, chassisCollider)

	ruota1 = carrarmato.newRuotaSx(sospensione1.x, sospensione1.y, tankCollider)

	ruota2 = carrarmato.newRuotaDx(sospensione2.x, sospensione2.y, tankCollider)

--------------------------------------------------------------------------------
--CANNONE, PULSANTE SPARO, PULSANTE ROT. CANN. DX, PULSANTE ROT. CANN. SX
--------------------------------------------------------------------------------
  cannon = cannone.newCannon({tankX = tank.x, tankY = tank.y, camera = camera})

  sparo = cannone.pulsanteSparo()

  sx = cannone.pulsanteSx()

  dx = cannone.pulsanteDx()

--------------------------------------------------------------------------------
--LAYOUT TERRENO
--------------------------------------------------------------------------------

  classTerreno = myLevel:layerObjectsWithClass("terreno", "pianura")
  classSalita = myLevel:layerObjectsWithClass("salita", "salita")

--------------------------------------------------------------------------------
--PULSANTI MOVIMENTO TANK
--------------------------------------------------------------------------------

  m.rotate.left = carrarmato.pulsanteSx()

  m.rotate.right = carrarmato.pulsanteDx()

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

  sx:addEventListener("tap", function() cannon.rotation = cannon.rotation-5 end)
  dx:addEventListener("tap", function() cannon.rotation = cannon.rotation+5 end)
  sparo:addEventListener("tap", shoot)
  m.rotate.left:addEventListener("touch", m.touch)
  m.rotate.right:addEventListener("touch", m.touch)

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