
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
local m = {}
local proiettile = require("class.proiettile")
local cannone = require("class.cannon")
local pulsanti = require("class.pulsanti")
local aereo = require("class.aereo")
local collisioni = require("class.collisioni")
local carrarmato = require("class.carrarmato")
local aereiTable = {}
local bombeTable = {}
local gameLoop = require("class.gameLoop")
m.result = "none"
m.rotate = {}
local cielo
local cannon, sx, dx, sparo
local weldJoint, pivotJointCannon
local tankCollider = {categoryBits = 1, maskBits = 1}
local chassisCollider = {categoryBits = 2, maskBits = 2}
local camera
local life=100
local score=0
local cingolo
local corpoCarrarmato
local rotazioneCarrarmato=0
local rotazioneCannone=0
local rotazioneTot=rotazioneCarrarmato+rotazioneCannone
scoreText = "" --serve globale, thanks
lifeText = ""  --serve globale, thanks
go = nil
local function endGame()
	composer.gotoScene( "menu", { time=800, effect="crossFade" } )
	
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
  --physics.setDrawMode("debug")

  scoreText = display.newText("score: "..score, 200, 100, native.systemFont, 60)
  scoreText:setFillColor(0,0,0)
  lifeText = display.newText("life: "..life, 200, 170, native.systemFont, 60)
  lifeText:setFillColor(0,0,0)

--------------------------------------------------------------------------------
--CINGOLO
--------------------------------------------------------------------------------
	cingolo = carrarmato.newCingolo(camera)

--------------------------------------------------------------------------------
--TANK
--------------------------------------------------------------------------------
	corpoCarrarmato = carrarmato.newTank(cingolo, camera)
	local joints = {}
	for i=1, 4, 1 do
		joints[i] = physics.newJoint("rope", cingolo.ruote[i], corpoCarrarmato.corpo, 0, 0, 0, 0)
		joints[4+i] = physics.newJoint("distance", cingolo.ruote[i], corpoCarrarmato.corpo, cingolo.ruote[i].x, cingolo.ruote[i].y, corpoCarrarmato.corpo.x, corpoCarrarmato.corpo.y)
	end

--------------------------------------------------------------------------------
--CANNONE, PULSANTE SPARO, PULSANTE ROT. CANN. DX, PULSANTE ROT. CANN. SX
--------------------------------------------------------------------------------
	cannon = cannone.newCannon({corpoCarrarmato = corpoCarrarmato.corpo, camera = camera})

	sparo = pulsanti.pulsanteSparo()

	sx = pulsanti.pulsanteCannoneSx()

	dx = pulsanti.pulsanteCannoneDx()

--------------------------------------------------------------------------------
--BACKGROUND
--------------------------------------------------------------------------------
  cielo = display.newImage("images/sky.jpg")
  cielo.x = display.contentCenterX
  cielo.y = display.contentCenterY
  cielo:scale(5,4)
--------------------------------------------------------------------------------
--LAYOUT TERRENO
--------------------------------------------------------------------------------

  local scaleFactor = 1.0
  local physicsData = (require "images.terreno1").physicsData(scaleFactor)
  local shape = display.newImage("images/terreno1.png")
  shape.myName = "terreno"
  physics.addBody( shape, "static", physicsData:get("terreno1") )
  shape.y=display.contentHeight
  shape.x=3000

--------------------------------------------------------------------------------
--PULSANTI MOVIMENTO TANK
--------------------------------------------------------------------------------

  m.rotate.left = pulsanti.pulsantiMovimentoCingolo().rotate.sx()
  m.rotate.right = pulsanti.pulsantiMovimentoCingolo().rotate.dx()

--------------------------------------------------------------------------------
--JOINT
--------------------------------------------------------------------------------
  pivotJointCannon = physics.newJoint("pivot", cannon, corpoCarrarmato.corpo, cannon.x, cannon.y)

  weldJoint = physics.newJoint("weld", cingolo.quadro[14], corpoCarrarmato.corpo, cingolo.quadro[14].x, cingolo.quadro[14].y-60)

--------------------------------------------------------------------------------
--CAMERA
--------------------------------------------------------------------------------
  camera:add(shape, 5, false)
  camera:add(cielo, 7, false)
  camera:add(cannon, 1, false)

  camera:track()

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
											pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3]})
										  end)

  m.rotate.right:addEventListener("touch",  function(event)
												pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3]})
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
	Runtime:addEventListener("collision",   function(event)
												local ret = collisioni.onCollision(event, aereiTable, bombeTable,  corpoCarrarmato.corpo)
												if(ret==10)then
													score=score+10
													scoreText.text="score: "..score
												elseif(ret==-1) then
													go = display.newImage("images/go.jpg")
													go.y=display.contentCenterY
													go.x=display.contentCenterX
													timer.performWithDelay( 1500, endGame )
												elseif(ret==20)then
													life=life-20
													lifeText.text="life: "..life
													if ( life == 0 ) then
													go = display.newImage("images/go.jpg")
													go.y=display.contentCenterY
													go.x=display.contentCenterX
													timer.performWithDelay( 1500, endGame )
													end
													
												end
											end)
											
    Runtime:addEventListener("enterFrame",  function(event)
												pulsanti.pulsantiMovimentoCingolo().enterFrame(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3], tank=corpoCarrarmato.corpo})
												cielo.y=corpoCarrarmato.corpo.y
												cielo.x=corpoCarrarmato.corpo.x
												--cannon.rotation=corpoCarrarmato.corpo.rotation+cannon.rotation
												--rotazioneCannone=cannon.rotation
												--rotazioneCarrarmato=corpoCarrarmato.corpo.rotation
												--rotazioneTot=rotazioneCannone+rotazioneCarrarmato
												--lifeText.text="life: "..rotazioneTot
												--cannon:setRotazione(rotazioneTot)
											end)
											
    gameLoopTimer = timer.performWithDelay(10000, function()
													gameLoop.loop(aereo, aereiTable, bombeTable, camera, corpoCarrarmato.corpo)
												  end, 0)
												  
    bombLoopTimer = timer.performWithDelay(1000, function()
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
		--timer.cancell(gameLoopTimer)
		--timer.cancell(bombLoopTimer)
		
	 -- CANCELLA TUTTI I TIMER
	 for id, value in pairs(timer._runlist) do
     timer.cancel(value)
end

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
    camera:destroy()
	scoreText:removeSelf()
	scoreText = nil
	lifeText:removeSelf()
	lifeText = nil
	sx:removeSelf()
	sx = nil
	dx:removeSelf()
	dx = nil
	sparo:removeSelf()
	sparo = nil
	go:removeSelf()
	go = nil
	display.remove(go)
	m.rotate.left:removeSelf()
	m.rotate.left = nil
	m.rotate.right:removeSelf()
	m.rotate.right = nil
    Runtime:removeEventListener( "enterFrame", enterFrame )
	Runtime:removeEventListener("collision", function(event)
													collisioni.onCollision(event, aereiTable, bombTable,  corpoCarrarmato)
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
