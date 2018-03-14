
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
local sx, dx, sparo
cannon = 0
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
local go = nil
local tempRotazione = 180
scoreText = "" --serve globale, thanks
lifeText = ""  --serve globale, thanks
local inVita = true
local terrainTable = {}
position = 1300

local function screenOff()
	go = display.newImage("images/go.jpg")
	go.y=display.contentCenterY
	go.x=display.contentCenterX
end

local function enterFrame(event)
	--scoreText2 = display.newText("pos: "..cannon.x, 400, 400, native.systemFont, 60)
    --scoreText2:setFillColor(0,0,0)
	pulsanti.pulsantiMovimentoCingolo().enterFrame(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3], tank=corpoCarrarmato.corpo})
	cielo.x=corpoCarrarmato.corpo.x
	posizioneText.text="posizione: "..math.round(((cannon.x-256)/100)*10)*0.1
	if (inVita == true) then
		cannon.rotation = corpoCarrarmato.corpo.rotation+tempRotazione
		if (cannon.x >= position/2 and cannon.x <= position/2 +18 ) then
			--print("OKKKKKKKKKKKKKKKKKKKKKKK")
			createTerrain()
		end
	else
	end
end

function createTerrain()

	position = position+4000
	local whereFrom = math.random(4)
  print("OKKKKKKKKKKKKKKKKKKKKKKK--------------->"..whereFrom)
	if ( whereFrom == 1 ) then

		local physicsData = (require "images.T1").physicsData(scaleFactor)
		local shape1 = display.newImage("images/T1.png")
		table.insert( terrainTable, shape1 )
		shape1.myName = "terreno"
		physics.addBody( shape1, "static", physicsData:get("T1") )
		shape1.y=display.contentHeight
		shape1.x=position
		camera:add(shape1, 5, false)

	elseif ( whereFrom == 2 ) then
		local physicsData = (require "images.T2").physicsData(scaleFactor)
		local shape2 = display.newImage("images/T2.png")
		table.insert( terrainTable, shape2 )
		shape2.myName = "terreno"
		physics.addBody( shape2, "static", physicsData:get("T2") )
		shape2.y=display.contentHeight
		shape2.x=position
		camera:add(shape2, 5, false)

	elseif ( whereFrom == 3 ) then
		local physicsData = (require "images.T3").physicsData(scaleFactor)
		local shape3 = display.newImage("images/T3.png")
		table.insert( terrainTable, shape3 )
		shape3.myName = "terreno"
		physics.addBody( shape3, "static", physicsData:get("T3") )
		shape3.y=display.contentHeight
		shape3.x=position
		camera:add(shape3, 5, false)

elseif ( whereFrom == 4 ) then
	local physicsData = (require "images.T4").physicsData(scaleFactor)
	local shape4 = display.newImage("images/T4.png")
	table.insert( terrainTable, shape4 )
	shape4.myName = "terreno"
	physics.addBody( shape4, "static", physicsData:get("T4") )
	shape4.y=display.contentHeight
	shape4.x=position
	camera:add(shape4, 5, false)

elseif ( whereFrom == 5 ) then
	local physicsData = (require "images.T5").physicsData(scaleFactor)
	local shape5 = display.newImage("images/T5.png")
	table.insert( terrainTable, shape5 )
	shape5.myName = "terreno"
	physics.addBody( shape5, "static", physicsData:get("T5") )
	shape5.y=display.contentHeight
	shape5.x=position
	camera:add(shape5, 5, false)
	end
end


local function onCollision(event)
	local ret = collisioni.onCollision(event, aereiTable, bombeTable,  corpoCarrarmato)
	--print(inVita)
	if(ret==10)then
		score=score+10
		scoreText.text="score: "..score
	elseif(ret==-1) then
		if(inVita==true)then
			inVita = false
			screenOff()
			timer.performWithDelay( 1200, function()
																			timer.performWithDelay( 500,composer.gotoScene( "menu", { time=800, effect="crossFade" } ))
																		end)
		end
	elseif(ret==20)then
		if(life>0)then
			life=life-20
			lifeText.text="life: "..life
		elseif(life<=0)then
			life=0
		end
		if(life==0 and inVita==true)then
			inVita = false
			screenOff()
			timer.performWithDelay( 1200, function()
																			timer.performWithDelay( 500,composer.gotoScene( "menu", { time=800, effect="crossFade" } ))
																		end)
		else
		end
	end
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	system.activate( "multitouch" )
	-- Code here runs when the scene is first created but has not yet appeared on screen

  physics.pause()
  camera = perspective.createView()
  --physics.setDrawMode("hybrid")

  scoreText = display.newText("score: "..score, 200, 100, native.systemFont, 60)
  scoreText:setFillColor(0,0,0)
  lifeText = display.newText("life: "..life, 200, 170, native.systemFont, 60)
  lifeText:setFillColor(0,0,0)
  posizioneText = display.newText("posizione: "..0, display.contentWidth-300, 100, native.systemFont, 60)
  posizioneText:setFillColor(0,0,0)


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
	--scoreText2 = display.newText("pos: "..cannon.x, 400, 400, native.systemFont, 60)

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
  local physicsData = (require "images.T4").physicsData(scaleFactor)
  local shape = display.newImage("images/T4.png")
	table.insert( terrainTable, shape4 )
  shape.myName = "terreno"
  physics.addBody( shape, "static", physicsData:get("T4") )
  shape.y=display.contentHeight
  shape.x=position



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
  camera:add(cielo, 6, false)
  camera:setBounds(-1920000,1920000,-2000,780)

  camera:track()

--------------------------------------------------------------------------------
--NON RICHIAMO NESSUNA FUNZIONE PERCHE' SONO TUTTE FUNZIONI ANONIME
--------------------------------------------------------------------------------

  sx:addEventListener("tap", function() tempRotazione = tempRotazione-10 end)
  dx:addEventListener("tap", function() tempRotazione = tempRotazione+10 end)

  sparo:addEventListener("tap", function()
									local ball = proiettile.newBall({x=cannon.x, y=cannon.y, cannonRotation=cannon.rotation})
									ball:shoot(camera)
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
	Runtime:addEventListener("collision", onCollision)

  Runtime:addEventListener("enterFrame", enterFrame)

  gameLoopTimer = timer.performWithDelay(10000, function()
																					gameLoop.loop(aereo, aereiTable, bombeTable, terrainTable, camera, corpoCarrarmato.corpo, position)
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
		m.rotate.left:removeSelf()
		m.rotate.left = nil
		m.rotate.right:removeSelf()
		m.rotate.right = nil
		inVita = true
		display.remove(go)
		Runtime:removeEventListener( "enterFrame", enterFrame )
		Runtime:removeEventListener("collision", onCollision--[[function(event)
													collisioni.onCollision(event, aereiTable, bombTable,  corpoCarrarmato)
												end]])
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
