
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
local pulsante = require("class.carrarmato").pulsante()
local aereo = require("class.aereo")
local collisioni = require("class.collisioni")
local aereiTable = {}
local bombeTable = {}
local gameLoop = require("class.gameLoop")
m.result = "none"
m.rotate = {}
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
local aereiText, bombeText

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

  aereiText = display.newText("aerei: "..#aereiTable, display.contentCenterX, display.contentCenterY, native.systemFont, 60)
  bombeText = display.newText("bombe: "..#bombeTable, display.contentCenterX, display.contentCenterY+60, native.systemFont, 60)

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
--BACKGROUND
--------------------------------------------------------------------------------

  cielo = display.newImageRect("images/sky.jpg", display.contentWidth, display.contentHeight)
  cielo.x = display.contentCenterX
  cielo.y = display.contentCenterY

--------------------------------------------------------------------------------
--LAYOUT TERRENO
--------------------------------------------------------------------------------

  classTerreno = myLevel:layerObjectsWithClass("terreno", "pianura")
  classSalita = myLevel:layerObjectsWithClass("salita", "salita")

--------------------------------------------------------------------------------
--PULSANTI MOVIMENTO TANK
--------------------------------------------------------------------------------

  m.rotate.left = pulsante.rotate.sx()
  m.rotate.right = pulsante.rotate.dx()

--------------------------------------------------------------------------------
--JOINT
--------------------------------------------------------------------------------

	pistonJoint1 = physics.newJoint("piston", chassis, sospensione1, sospensione1.x, sospensione1.y, 0, 1)
	pistonJoint1.isLimitEnabled = true
	pistonJoint1:setLimits(-5, 5)

	pistonJoint2 = physics.newJoint("piston", chassis, sospensione2, sospensione2.x, sospensione2.y, 0, 1)
	pistonJoint2.isLimitEnabled = true
	pistonJoint2:setLimits(-5, 5)

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
--NON RICHIAMO NESSUNA FUNZIONE PERCHE' SONO TUTTE FUNZIONI ANONIME
--------------------------------------------------------------------------------

  sx:addEventListener("tap", function() cannon.rotation = cannon.rotation-5 end)
  dx:addEventListener("tap", function() cannon.rotation = cannon.rotation+5 end)

  sparo:addEventListener("tap", function()
																	local ball = proiettile.newBall({x=cannon.x, y=cannon.y})
																	ball:shoot(cannon.rotation, camera)
																end)

	m.rotate.left:addEventListener("touch", function(event)
																						pulsante.touch(event, {m=m, ruota1=ruota1, ruota2=ruota2})
																					end)
  m.rotate.right:addEventListener("touch", function(event)
																						pulsante.touch(event, {m=m, ruota1=ruota1, ruota2=ruota2})
																					end)
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
		Runtime:addEventListener("collision", function(event)
																						collisioni.onCollision(event, aereiTable,  tank)
																					end)
    Runtime:addEventListener("enterFrame",  function(event)
																							pulsante.enterFrame(event, {m=m, ruota1=ruota1, ruota2=ruota2, tank=tank})
																						end)
		gameLoopTimer = timer.performWithDelay(1000, function()
																									 gameLoop.loop(aereo, aereiTable, camera, aereiText, bombeText, bombeTable)
																								 end, 0)
	  bombLoopTimer = timer.performWithDelay(100, function()
																									 aereo.fire(aereiTable, bombeTable, camera, bombeText)
																					       end, 0)
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		timer.cancell(gameLoopTimer)
		timer.cancell(bombLoopTimer)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
    camera:destroy()
    Runtime:removeEventListener( "enterFrame", enterFrame )
		Runtime:removeEventListener("collision", function(event)
																								collisioni.onCollision(event, aereiTable,  tank)
																						 end)
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
