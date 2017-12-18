
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
local pulsanti = require("class.pulsanti")
local aereo = require("class.aereo")
local collisioni = require("class.collisioni")
local cingolo = require("class.cingolo")
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
local cannon, sx, dx, sparo
local weldJoint, pivotJointCannon
local tankCollider = {categoryBits = 1, maskBits = 1}
local chassisCollider = {categoryBits = 2, maskBits = 2}
local camera
local aereiText, bombeText
local cingoloProva

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
--CINGOLO
--------------------------------------------------------------------------------
	cingoloTank = cingolo.newCingolo(camera)

--------------------------------------------------------------------------------
--TANK
--------------------------------------------------------------------------------
	tank = cingolo.newTank(cingoloTank)
	tank:scale(1.5, 1)

--------------------------------------------------------------------------------
--CANNONE, PULSANTE SPARO, PULSANTE ROT. CANN. DX, PULSANTE ROT. CANN. SX
--------------------------------------------------------------------------------
	cannon = cannone.newCannon({tankX = tank.x, tankY = tank.y, camera = camera})

	sparo = pulsanti.pulsanteSparo()

  sx = pulsanti.pulsanteCannoneSx()

	dx = pulsanti.pulsanteCannoneDx()

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

  m.rotate.left = pulsanti.pulsantiMovimentoCingolo().rotate.sx()
  m.rotate.right = pulsanti.pulsantiMovimentoCingolo().rotate.dx()

--------------------------------------------------------------------------------
--JOINT
--------------------------------------------------------------------------------
  pivotJointCannon = physics.newJoint("pivot", cannon, tank, cannon.x, cannon.y)

	weldJoint = physics.newJoint("weld", cingoloTank.quadro[14], tank, cingoloTank.quadro[14].x, cingoloTank.quadro[14].y-60)

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
																						pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingoloTank.ruote[1], ruota2=cingoloTank.ruote[4]})
																					end)
  m.rotate.right:addEventListener("touch", function(event)
																						pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingoloTank.ruote[1], ruota2=cingoloTank.ruote[4]})
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
																							pulsanti.pulsantiMovimentoCingolo().enterFrame(event, {m=m, ruota1=cingoloTank.ruote[1], ruota2=cingoloTank.ruote[4], tank=tank})
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
