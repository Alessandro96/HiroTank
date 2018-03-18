
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
metri = nil
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
position = 300
metamappa = 20
whereFrom = 0
local verifica = true
local mappaAttuale = -1

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
	metri = (math.round(((cannon.x-256)/100)*10)*0.1)+9
	metamappa = (math.round(((position)/100)*10)*0.1)+6.5
	posizioneText.text="m : "..metri
	if (inVita == true) then
		cannon.rotation = corpoCarrarmato.corpo.rotation+tempRotazione
		if ((metri> metamappa )and (metri < metamappa+5)) then
			print("OKKKKKKKKKKKKKKKKKKKKKKK")
			createTerrain()
		end
	else
	end
end

function createTerrain()
	
	
	position = position+2000
	whereFrom = math.random(4)
	
	if (whereFrom == mappaAttuale) then 
		if (whereFrom == 4) then 
			whereFrom = whereFrom -1
		else 
			whereFrom = whereFrom +1
		end
	end
	
	print("W : "..whereFrom.."      MA :"..mappaAttuale)
	
	mappaAttuale = whereFrom
		
	
  
 
  
	if ( whereFrom == 1 and verifica == true) then

		shape1.y=display.contentHeight
		shape1.x=position

	elseif ( whereFrom == 2 and verifica == true ) then
		
		shape2.y=display.contentHeight
		shape2.x=position
		

	elseif ( whereFrom == 3 and verifica == true ) then
		
		shape3.y=display.contentHeight
		shape3.x=position


	elseif ( whereFrom == 4 and verifica == true ) then
	
		shape4.y=display.contentHeight
		shape4.x=position

	elseif ( whereFrom == 5 and verifica == true) then
	
		shape5.y=display.contentHeight
		shape5.x=position
		
	elseif (verifica == false) then
	
		shape.y=display.contentHeight
		shape.x=position
		verifica = true
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
  local physicsData = (require "images.t1").physicsData(scaleFactor)
  shape = display.newImage("images/t1.png")
  shape.myName = "terreno"
  physics.addBody( shape, "static", physicsData:get("t1") )
  shape.y=display.contentHeight
  shape.x=position
  
  local physicsData = (require "images.t1").physicsData(scaleFactor)
  shape1 = display.newImage("images/t1.png")
  shape1.myName = "terreno"
  physics.addBody( shape1, "static", physicsData:get("t1") )
  shape1.y=-7000
  shape1.x=-3000
  camera:add(shape1, 5, false)
  
  local physicsData = (require "images.t2").physicsData(scaleFactor)
  shape2 = display.newImage("images/t2.png")
  shape2.myName = "terreno"
  physics.addBody( shape2, "static", physicsData:get("t2") )
  shape2.y=-3000
  shape2.x=-7000
  camera:add(shape2, 5, false)
		
  local physicsData = (require "images.t3").physicsData(scaleFactor)
  shape3 = display.newImage("images/t3.png")
  shape3.myName = "terreno"
  physics.addBody( shape3, "static", physicsData:get("t3") )
  shape3.y=-9000
  shape3.x=-3000
  camera:add(shape3, 5, false)

  local physicsData = (require "images.t4").physicsData(scaleFactor)
  shape4 = display.newImage("images/t4.png")
  shape4.myName = "terreno"
  physics.addBody( shape4, "static", physicsData:get("t4") )
  shape4.y=-9000
  shape4.x=-3000
  camera:add(shape4, 5, false)

 -- local physicsData = (require "images.t5").physicsData(scaleFactor)
  --shape5 = display.newImage("images/t5.png")
  --shape5.myName = "terreno"
  --physics.addBody( shape5, "static", physicsData:get("t5") )
  --shape5.y=-13000
 -- shape5.x=-3000
  --camera:add(shape5, 5, false)




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
		posizioneText:removeSelf()
		posizioneText = nil
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
