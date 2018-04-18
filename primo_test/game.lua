
local composer = require( "composer" )
local sounds = require('lib.sounds')

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )
system.activate( "multitouch" )

local physics = require("physics")
physics.start()
local widget = require( "widget" )
local perspective = require("lib.perspective")
local m = {}
local proiettile = require("class.proiettile")
local cannone = require("class.cannon")
local pulsanti = require("class.pulsanti")
local aereo = require("class.aereo")
local aereo2 = require("class.aereo")
local collisioni = require("class.collisioni")
local carrarmato = require("class.carrarmato")
local database = require("class.database")
local aereiTable = {}
local cloudTable = {}
local cuoreTable = {}
local bombeTable = {}
local gameLoop = require("class.gameLoop")
m.result = "none"
m.rotate = {}
metri = nil
local cielo
local mont
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
local scoreText, maxScoreText, maxScoreIcon
local posizioneText, maxPosizioneText, maxPosizioneIcon
lifeText = ""  --serve globale, thanks
local messaggioRecordPunteggio
local inVita = true
local terrainTable = {}
position = 300
cont = -600
metamappa = 20
whereFrom = 0
local verifica = true
local controlloPunteggio = true
local controlloDistanza = true
local mappaAttuale = -1
metri = 0
local primoInClassifica = {}
local musicTrackTank
local musicTrackBack
verificaFumo = false

local function screenOff()
	go = display.newImage("images/go.jpg")
	go.y=display.contentCenterY
	go.x=display.contentCenterX
	--audio.setVolume( 0, { channel=6 } )
end

local function sbloccaPulsante()
	pSparo:setEnabled( true )
	if (pulsanteSparo~= nil)then
		pulsanteSparo:removeSelf()
		pulsanteSparo = nil
	end
end

local function fuocoCarro( event )

    if ( "ended" == event.phase and inVita==true ) then
        print( "Button was pressed and released" )
		local ball = proiettile.newBall({x=cannon.x, y=cannon.y, cannonRotation=cannon.rotation})
		sounds.play('cannon', { channel=2})
		ball:shoot(camera)
		pSparo:setEnabled( false )
		timer.performWithDelay( 1000, sbloccaPulsante )
		pulsanteSparo = display.newImageRect("images/pulsanti/bombap.png",160, 160)
		pulsanteSparo.x = display.screenOriginX + pulsanteSparo.contentWidth+120
		pulsanteSparo.y = display.contentHeight - pulsanteSparo.contentHeight + 30
    end
end


local function enterFrame(event)
	pulsanti.pulsantiMovimentoCingolo().enterFrame(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3], tank=corpoCarrarmato.corpo})
	cielo.x=corpoCarrarmato.corpo.x
	metri = (math.round(((cannon.x-256)/100)*10)*0.1)+9
	metamappa = (math.round(((position)/100)*10)*0.1)+6.5
	posizioneText.text="m : "..metri
	
	if (verificaFumo == true) then
	smoke.x = cannon.x-20
	smoke.y = cannon.y-140
	end
	
	if (cannon.y > 1200 and inVita == true) then 
		inVita = false 
		life = 0
		database.writeDatabase(score, metri)
		screenOff()
		timer.performWithDelay( 1300, function()
									timer.performWithDelay( 500,composer.gotoScene( "inputUtente", { time=800, effect="crossFade" } ))
							end)
	end
	
	if (inVita == true) then
		cannon.rotation = corpoCarrarmato.corpo.rotation+tempRotazione
		if ((metri> metamappa )and (metri < metamappa+5)) then
			createTerrain()
		end
	else
	
	
	end
	if ((score>primoInClassifica.punteggio) and (controlloPunteggio==true)) then
		local messaggioRecordPunteggio = display.newText("new best score!!!", display.contentCenterX, display.contentCenterY-200, native.systemFont , 60)
		messaggioRecordPunteggio:setFillColor(0.6,0.5,0)
		controlloPunteggio=false
		timer.performWithDelay(2000, function()
																		messaggioRecordPunteggio:removeSelf()
																		messaggioRecordPunteggio=nil
																 end)
	end
	if (metri>primoInClassifica.distanza and controlloDistanza==true) then
		local messaggioRecordDistanza = display.newText("new record!!!", display.contentCenterX, display.contentCenterY-200, native.systemFont , 60)
		messaggioRecordDistanza:setFillColor(0.6,0.5,0)
		controlloDistanza=false
		timer.performWithDelay(2000, function()
																		messaggioRecordDistanza:removeSelf()
																		messaggioRecordDistanza=nil
																 end)
	end
	if(controlloPunteggio==false)then
		maxScoreText.text=""..score
	end
	if(controlloDistanza==false)then
		maxPosizioneText.text=""..metri
	end
end

function createTerrain()
	position = position+2000
	whereFrom = math.random(6)

	if (whereFrom == mappaAttuale) then
		if (whereFrom == 6) then
			whereFrom = whereFrom -1
		else
			whereFrom = whereFrom +1
		end
	end
	mappaAttuale = whereFrom

if (newGame==3) then
	monte = display.newImage("images/mont.png")
	alberi = display.newImage("images/alb.png")
  cont=cont+4000
	monte.x = cont
	monte.y = display.contentCenterY+120
	alberi.x = cont
	alberi.y = display.contentCenterY+260
  camera:add(monte, 7, false)
	camera:add(alberi, 6, false)
end

if (newGame==4) then
	bgNotte = display.newImage("images/bgNotteStelle.png")
  cont=cont+4000
	bgNotte.x = cont
	bgNotte.y = display.contentCenterY+60
  camera:add(bgNotte, 6, false)
end


	---------------------------------------------------------
	-- GENERATORE DINAMICO MAPPA "GROUND"
	---------------------------------------------------------
	if ( whereFrom == 1 and newGame == 1) then

		ground1.y=display.contentHeight
		ground1.x=position

	elseif ( whereFrom == 2 and newGame == 1 ) then

		ground2.y=display.contentHeight
		ground2.x=position


	elseif ( whereFrom == 3 and newGame == 1 ) then

		ground3.y=display.contentHeight
		ground3.x=position


	elseif ( whereFrom == 4 and newGame == 1 ) then

		ground4.y=display.contentHeight
		ground4.x=position

	elseif ( whereFrom == 5 and newGame == 1) then

		ground5.y=display.contentHeight
		ground5.x=position

	elseif ( whereFrom == 6 and newGame == 1) then

		ground6.y=display.contentHeight
		ground6.x=position

	---------------------------------------------------------
	-- GENERATORE DINAMICO MAPPA "NEVE"
	---------------------------------------------------------

	elseif ( whereFrom == 1 and newGame == 2 ) then

		neve1.y=display.contentHeight
		neve1.x=position

	elseif ( whereFrom == 2 and newGame == 2 ) then

		neve2.y=display.contentHeight
		neve2.x=position


	elseif ( whereFrom == 3 and newGame == 2 ) then

		neve3.y=display.contentHeight
		neve3.x=position


	elseif ( whereFrom == 4 and newGame == 2 ) then

		neve4.y=display.contentHeight
		neve4.x=position

	elseif ( whereFrom == 5 and newGame == 2) then

		neve5.y=display.contentHeight
		neve5.x=position

	elseif ( whereFrom == 6 and newGame == 2) then

		neve6.y=display.contentHeight
		neve6.x=position

		---------------------------------------------------------
		-- GENERATORE DINAMICO MAPPA "SUNSET"
		---------------------------------------------------------

	  elseif ( whereFrom == 1 and newGame == 3) then

			sunset1.y=display.contentHeight
			sunset1.x=position



		elseif ( whereFrom == 2 and newGame == 3 ) then

			sunset2.y=display.contentHeight
			sunset2.x=position


		elseif ( whereFrom == 3 and newGame == 3 ) then

			sunset3.y=display.contentHeight
			sunset3.x=position


		elseif ( whereFrom == 4 and newGame == 3 ) then

			sunset4.y=display.contentHeight
			sunset4.x=position


		elseif ( whereFrom == 5 and newGame == 3) then

			sunset5.y=display.contentHeight
			sunset5.x=position


		elseif ( whereFrom == 6 and newGame == 3) then

			sunset6.y=display.contentHeight
			sunset6.x=position

			---------------------------------------------------------
			-- GENERATORE DINAMICO MAPPA "NOTTE"
			---------------------------------------------------------

		elseif ( whereFrom == 1 and newGame == 4 ) then

				notte1.y=display.contentHeight-60
			  notte1.x=position

			elseif ( whereFrom == 2 and newGame == 4 ) then

				notte2.y=display.contentHeight-60
				notte2.x=position


			elseif ( whereFrom == 3 and newGame == 4 ) then

				notte3.y=display.contentHeight-60
				notte3.x=position


			elseif ( whereFrom == 4 and newGame == 4 ) then

				notte4.y=display.contentHeight-60
				notte4.x=position

			elseif ( whereFrom == 5 and newGame == 4) then

				notte5.y=display.contentHeight-60
				notte5.x=position

			elseif ( whereFrom == 6 and newGame == 4) then

				notte6.y=display.contentHeight-60
				notte6.x=position


	elseif (verifica == false) then

		shape.y=display.contentHeight
		shape.x=position
		verifica = true
	end
end
---------------------------------------------------------
-- GENERATORE nuvole
---------------------------------------------------------

local function cloudGen()
	local nuvole = math.random(4)

	if (nuvole == 1) then
	local cloud1 = display.newImageRect("images/nuvole/cloud.png", 100 * 2, 63 * 2)
	cloud1.y = display.contentCenterY
	cloud1.x = cannon.x +1500
	table.insert( cloudTable, cloud1)
	camera:add(cloud1, 1, false)

	elseif (nuvole == 2) then
	local cloud2 = display.newImageRect("images/nuvole/cloud2.png", 100 * 3, 63 * 3)
	cloud2.y = display.contentCenterY
	cloud2.x = cannon.x +1500
	table.insert( cloudTable, cloud2)
	camera:add(cloud2, 1, false)

	elseif (nuvole == 3) then
	local cloud3 = display.newImageRect("images/nuvole/cloud3.png", 100 * 1.5, 63 * 1.5)
	cloud3.y = display.contentCenterY-50
	cloud3.x = cannon.x +1500
	table.insert( cloudTable, cloud3)
	camera:add(cloud3, 1, false)

	elseif (nuvole == 4) then
	local cloud4 = display.newImageRect("images/nuvole/cloud4.png", 100 *3 , 63 *3 )
	cloud4.y = display.contentCenterY-50
	cloud4.x = cannon.x +1500
	table.insert( cloudTable, cloud4)
	camera:add(cloud4, 1, false)
	end

end

------------------------------
--FUMO
------------------------------
local options2 = {width = 256, height = 512, numFrames = 16, sheetContentWidth = 1024, sheetContentHeight = 2048}
local sheet2 = graphics.newImageSheet("images/smoke2.png", options2 )
local sequenceData2 = { name="seq2", sheet=sheet2, start=1, count=16, time=800, loopCount=0 }
---------------------------------------------------------
--SUONI
---------------------------------------------------------

audio.setVolume( 0, { channel=1 } )
audio.setVolume( 0, { channel=5 } )
audio.setVolume( 0, { channel=6 } )
audio.stop(6)
musicTrackTank = audio.loadStream( "sounds/tank.mp3" )
musicTrackEngine = audio.loadStream( "sounds/engine.mp3" )
musicTrackBack = audio.loadStream( "sounds/ghostpocalypse.mp3" )
if (musica == true )then audio.setVolume( 0.2, { channel=7 } ) end
if (suoni == true )then
	audio.setVolume( 0.2, { channel=6 } )
	audio.setVolume( 0.8, { channel=5 } )
end
audio.play( musicTrackEngine, { channel=5, loops=-1 } )
audio.play( musicTrackBack, { channel=7, loops=-1 } )
---------------------------------------------------------


local function onCollision(event)
	local ret = collisioni.onCollision(event, aereiTable, bombeTable,  corpoCarrarmato, camera)
	--print(inVita)
	if(ret==10)then
		score=score+10
		scoreText.text="score: "..score
	elseif(ret==-1) then
		if(inVita==true)then
			composer.setVariable("score",score)
			composer.setVariable("metri",metri)
			inVita = false
			screenOff()
			timer.performWithDelay( 1200, function()
								timer.performWithDelay( 500,composer.gotoScene( "inputUtente", { time=800, effect="crossFade" } ))
							end)
		end
	elseif(ret==20)then
		if(life>0)then
		if (life == 40 and verificaFumo == false) then
			smoke = display.newSprite(sheet2, sequenceData2)
			smoke.x = cannon.x-20
			smoke.y = cannon.y-140
			verificaFumo = true
			camera:add(smoke, 4, false)
			smoke:play()
		end
		cuoreDaRimuovere = #cuoreTable
		cuoreTable[cuoreDaRimuovere]:removeSelf()
		cuoreTable[cuoreDaRimuovere] = nil
		table.remove( cuoreTable, cuoreDaRimuovere )
		life=life-20
		sounds.play('colpo', { channel=2})
		elseif(life<=0)then
			life=0
			inVita = false
		end
		if(life==0 and inVita==true)then
			composer.setVariable("score",score)
			composer.setVariable("metri",metri)
			inVita = false
			screenOff()
			timer.performWithDelay( 1200, function()
								timer.performWithDelay( 500,composer.gotoScene( "inputUtente", { time=800, effect="crossFade" } ))
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
 -- physics.setDrawMode("hybrid")

 --------------------------------------------------------------------------------
 --PRIMO IN CLASSIFICA
 --------------------------------------------------------------------------------
 	primoInClassifica = database.primoInClassifica()

------------------------------------------------------------------------------
--SCRITTE PUNTEGGIO E DISTANZA
------------------------------------------------------------------------------

	scoreText = display.newText("score: "..score, 140, 170, native.systemFont, 60)
	scoreText:setFillColor(0,0,0)
	posizioneText = display.newText("posizione: "..0, display.contentWidth-300, 100, native.systemFont, 60)
	posizioneText:setFillColor(0,0,0)
	maxScoreIcon = display.newImageRect("images/coppa.png",70, 70)
	maxScoreIcon.x = 70
	maxScoreIcon.y = 250
	maxScoreText = display.newText(""..primoInClassifica.punteggio, 120, 250, native.systemFont, 60)
	maxScoreText.anchorX = 0
	maxScoreText:setFillColor(0,0,0)
	maxPosizioneIcon = display.newImageRect("images/piedi.png",70, 70)
	maxPosizioneIcon.x = display.contentWidth-360
	maxPosizioneIcon.y = 180
	maxPosizioneText = display.newText(""..primoInClassifica.distanza, display.contentWidth-310, 180, native.systemFont, 60)
	maxPosizioneText.anchorX = 0
	maxPosizioneText:setFillColor(0,0,0)

---------------------------------------
--PULSANTE SPARO CANNONE
---------------------------------------

	pSparo = widget.newButton(
	    {
	        width = 160,
	        height = 160,
	        defaultFile = "images/pulsanti/bomba.png",
	        overFile = "images/pulsanti/bombap.png",
	        --label = "button",
	        onEvent = fuocoCarro
	    }
	)

	pSparo.x = display.screenOriginX+pSparo.contentWidth+120
	pSparo.y = display.contentHeight-pSparo.contentHeight+30


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

	sx = pulsanti.pulsanteCannoneSx()

	dx = pulsanti.pulsanteCannoneDx()

--------------------------------------------------------------------------------
--BACKGROUND
--------------------------------------------------------------------------------
    if (newGame == 1) then
	cielo = display.newImage("images/sky.jpg")
	cielo.x = display.contentCenterX
	cielo.y = display.contentCenterY
	cielo:scale(5,4)

  elseif (newGame == 2) then
	cielo = display.newImage("images/sky.jpg")
	cielo.x = display.contentCenterX
	cielo.y = display.contentCenterY
	cielo:scale(5,4)

  elseif (newGame == 3) then
	monteBase = display.newImage("images/mont.png")
	monteBase.x = cont
	monteBase.y = display.contentCenterY+120
	alberiBase = display.newImage("images/alb.png")
	alberiBase.x = cont
	alberiBase.y = display.contentCenterY+260
	cielo = display.newImage("images/sky.jpg")
	cielo.x = display.contentCenterX
	cielo.y = display.contentCenterY
	cielo:scale(5,4)
	camera:add(monteBase, 6, false)
	camera:add(alberiBase, 6, false)
	--cielo:scale(5,4)

  elseif (newGame == 4) then
	notteBG = display.newImage("images/bgNotteStelle.png")
  notteBG.x = cont
	notteBG.y = display.contentCenterY+60
	cielo = display.newImage("images/sky.jpg")
	cielo.x = display.contentCenterX
	cielo.y = display.contentCenterY
	cielo:scale(5,4)
	camera:add(notteBG, 6, false)

  end
--------------------------------------------------------------------------------
--TASTI HOME-RESTART
--------------------------------------------------------------------------------
home = display.newImageRect("images/pulsanti/home.png",150, 150)
home.x = display.contentWidth-80
home.y = 80
home:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						homep = display.newImageRect("images/pulsanti/homep.png",150, 150)
						homep.x = display.contentWidth-80
						homep.y = 80
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
						audio.setVolume( 0, { channel=6 } )
					elseif "ended" == event.phase then
						if (homep~=nil) then
						homep:removeSelf()
						homep = nil
						end
						--display.remove( homep )
						timer.performWithDelay( 100,composer.gotoScene( "menu", { time=800, effect="crossFade" } ))
						display.getCurrentStage():setFocus( event.target, nil )
					end
					end )
--------------------------------------------------------------------------------
--CARICAMENTO TERRENO TIPOLOGIA "GROUND"
--------------------------------------------------------------------------------
if (newGame == 1) then

  local scaleFactor = 1.0
  local physicsData = (require "images.groundbase").physicsData(scaleFactor)
  groundDefault = display.newImage("images/groundbase.png")
  groundDefault.myName = "terreno"
  physics.addBody( groundDefault, "static", physicsData:get("groundbase") )
  groundDefault.y=display.contentHeight
  groundDefault.x=position
  camera:add(groundDefault, 5, false)

  local physicsData = (require "images.t1").physicsData(scaleFactor)
  ground1 = display.newImage("images/t1.png")
  ground1.myName = "terreno"
  physics.addBody( ground1, "static", physicsData:get("t1") )
  ground1.y=-7000
  ground1.x=-3000
  camera:add(ground1, 5, false)

  local physicsData = (require "images.t2").physicsData(scaleFactor)
  ground2 = display.newImage("images/t2.png")
  ground2.myName = "terreno"
  physics.addBody( ground2, "static", physicsData:get("t2") )
  ground2.y=-3000
  ground2.x=-7000
  camera:add(ground2, 5, false)

  local physicsData = (require "images.t10").physicsData(scaleFactor)
  ground3 = display.newImage("images/t10.png")
  ground3.myName = "terreno"
  physics.addBody( ground3, "static", physicsData:get("t10") )
  ground3.y=-3000
  ground3.x=-7000
  camera:add(ground3, 5, false)

  local physicsData = (require "images.t40").physicsData(scaleFactor)
  ground4 = display.newImage("images/t40.png")
  ground4.myName = "terreno"
  physics.addBody( ground4, "static", physicsData:get("t40") )
  ground4.y=-9000
  ground4.x=-3000
  camera:add(ground4, 5, false)

  local physicsData = (require "images.t11").physicsData(scaleFactor)
  ground5 = display.newImage("images/t11.png")
  ground5.myName = "terreno"
  physics.addBody( ground5, "static", physicsData:get("t11") )
  ground5.y=-3000
  ground5.x=-7000
  camera:add(ground5, 5, false)

  local physicsData = (require "images.t12").physicsData(scaleFactor)
  ground6 = display.newImage("images/t12.png")
  ground6.myName = "terreno"
  physics.addBody( ground6, "static", physicsData:get("t12") )
  ground6.y=-3000
  ground6.x=-7000
  camera:add(ground6, 5, false)


--------------------------------------------------------------------------------
--CARICAMENTO TERRENO TIPOLOGIA "NEVE"
--------------------------------------------------------------------------------
elseif (newGame == 2) then

  local scaleFactor = 1.0
  local physicsData = (require "images.nevebase").physicsData(scaleFactor)
  neveDefault = display.newImage("images/nevebase.png")
  neveDefault.myName = "terreno"
  physics.addBody( neveDefault, "static", physicsData:get("nevebase") )
  neveDefault.y=display.contentHeight
  neveDefault.x=position
  camera:add(neveDefault, 5, false)

  local physicsData = (require "images.t3").physicsData(scaleFactor)
  neve1 = display.newImage("images/t3.png")
  neve1.myName = "terreno"
  physics.addBody( neve1, "static", physicsData:get("t3") )
  neve1.y=-9000
  neve1.x=-3000
  camera:add(neve1, 5, false)


  local physicsData = (require "images.t5").physicsData(scaleFactor)
  neve2 = display.newImage("images/t5.png")
  neve2.myName = "terreno"
  physics.addBody( neve2, "static", physicsData:get("t5") )
  neve2.y=-13000
  neve2.x=-3000
  camera:add(neve2, 5, false)

  local physicsData = (require "images.t6").physicsData(scaleFactor)
  neve3 = display.newImage("images/t6.png")
  neve3.myName = "terreno"
  physics.addBody( neve3, "static", physicsData:get("t6") )
  neve3.y=-13000
  neve3.x=-3000
  camera:add(neve3, 5, false)

  local physicsData = (require "images.n1").physicsData(scaleFactor)
  neve4 = display.newImage("images/n1.png")
  neve4.myName = "terreno"
  physics.addBody( neve4, "static", physicsData:get("n1") )
  neve4.y=-13000
  neve4.x=-3000
  camera:add(neve4, 5, false)

  local physicsData = (require "images.n2").physicsData(scaleFactor)
  neve5 = display.newImage("images/n2.png")
  neve5.myName = "terreno"
  physics.addBody(neve5, "static", physicsData:get("n2") )
  neve5.y=-13000
  neve5.x=-3000
  camera:add(neve5, 5, false)

  local physicsData = (require "images.n3").physicsData(scaleFactor)
  neve6 = display.newImage("images/n3.png")
  neve6.myName = "terreno"
  physics.addBody(neve6, "static", physicsData:get("n3") )
  neve6.y=-13000
  neve6.x=-3000
  camera:add(neve6, 5, false)

end

--------------------------------------------------------------------------------
--CARICAMENTO TERRENO TIPOLOGIA "SUNSET"
--------------------------------------------------------------------------------
if (newGame == 3) then

  local scaleFactor = 1.0
  local physicsData = (require "images.sunsetbase").physicsData(scaleFactor)
  sunsetDefault = display.newImage("images/sunsetbase.png")
  sunsetDefault.myName = "terreno"
  physics.addBody( sunsetDefault, "static", physicsData:get("sunsetbase") )
  sunsetDefault.y=display.contentHeight
  sunsetDefault.x=position
  camera:add(sunsetDefault, 5, false)

	local physicsData = (require "images.s1").physicsData(scaleFactor)
  sunset1 = display.newImage("images/s1.png")
  sunset1.myName = "terreno"
  physics.addBody( sunset1, "static", physicsData:get("s1") )
  sunset1.y=-7000
  sunset1.x=-3000
  camera:add(sunset1, 5, false)

  local physicsData = (require "images.s2").physicsData(scaleFactor)
  sunset2 = display.newImage("images/s2.png")
  sunset2.myName = "terreno"
  physics.addBody( sunset2, "static", physicsData:get("s2") )
  sunset2.y=-3000
  sunset2.x=-7000
  camera:add(sunset2, 5, false)

  local physicsData = (require "images.s3").physicsData(scaleFactor)
  sunset3 = display.newImage("images/s3.png")
  sunset3.myName = "terreno"
  physics.addBody( sunset3, "static", physicsData:get("s3") )
  sunset3.y=-3000
  sunset3.x=-7000
  camera:add(sunset3, 5, false)

  local physicsData = (require "images.s4").physicsData(scaleFactor)
  sunset4 = display.newImage("images/s4.png")
  sunset4.myName = "terreno"
  physics.addBody( sunset4, "static", physicsData:get("s4") )
  sunset4.y=-9000
  sunset4.x=-3000
  camera:add(sunset4, 5, false)

  local physicsData = (require "images.s5").physicsData(scaleFactor)
  sunset5 = display.newImage("images/s5.png")
  sunset5.myName = "terreno"
  physics.addBody( sunset5, "static", physicsData:get("s5") )
  sunset5.y=-3000
  sunset5.x=-7000
  camera:add(sunset5, 5, false)

  local physicsData = (require "images.s6").physicsData(scaleFactor)
  sunset6 = display.newImage("images/s6.png")
  sunset6.myName = "terreno"
  physics.addBody( sunset6, "static", physicsData:get("s6") )
  sunset6.y=-3000
  sunset6.x=-7000
  camera:add(sunset6, 5, false)
end

--------------------------------------------------------------------------------
--CARICAMENTO TERRENO TIPOLOGIA "NOTTE"
--------------------------------------------------------------------------------
if (newGame == 4) then

  local scaleFactor = 1.0
  local physicsData = (require "images.nottebase").physicsData(scaleFactor)
  notteDefault = display.newImage("images/nottebase.png")
  notteDefault.myName = "terreno"
  physics.addBody( notteDefault, "static", physicsData:get("nottebase") )
  notteDefault.y=display.contentHeight-60
  notteDefault.x=position
  camera:add(notteDefault, 5, false)

	local physicsData = (require "images.u1").physicsData(scaleFactor)
  notte1 = display.newImage("images/u1.png")
  notte1.myName = "terreno"
  physics.addBody( notte1, "static", physicsData:get("u1") )
  notte1.y=-7000
  notte1.x=-3000
  camera:add(notte1, 5, false)

  local physicsData = (require "images.u2").physicsData(scaleFactor)
  notte2 = display.newImage("images/u2.png")
  notte2.myName = "terreno"
  physics.addBody( notte2, "static", physicsData:get("u2") )
  notte2.y=-3000
  notte2.x=-7000
  camera:add(notte2, 5, false)

  local physicsData = (require "images.u3").physicsData(scaleFactor)
  notte3 = display.newImage("images/u3.png")
  notte3.myName = "terreno"
  physics.addBody(notte3, "static", physicsData:get("u3") )
  notte3.y=-3000
  notte3.x=-7000
  camera:add(notte3, 5, false)

  local physicsData = (require "images.u4").physicsData(scaleFactor)
  notte4 = display.newImage("images/u4.png")
  notte4.myName = "terreno"
  physics.addBody( notte4, "static", physicsData:get("u4") )
  notte4.y=-9000
  notte4.x=-3000
  camera:add(notte4, 5, false)

  local physicsData = (require "images.u5").physicsData(scaleFactor)
  notte5 = display.newImage("images/u5.png")
  notte5.myName = "terreno"
  physics.addBody( notte5, "static", physicsData:get("u5") )
  notte5.y=-3000
  notte5.x=-7000
  camera:add(notte5, 5, false)

  local physicsData = (require "images.u6").physicsData(scaleFactor)
  notte6 = display.newImage("images/u6.png")
  notte6.myName = "terreno"
  physics.addBody( notte6, "static", physicsData:get("u6") )
  notte6.y=-3000
  notte6.x=-7000
  camera:add(notte6, 5, false)
end

-------------------------------------------------------------------------------
--LIFE HEART
-------------------------------------------------------------------------------
local cuore1 = display.newImage("images/heart.png")
cuore1.y=70
cuore1.x=70
table.insert( cuoreTable, cuore1 )

local cuore2 = display.newImage("images/heart.png")
cuore2.y=70
cuore2.x=170
table.insert( cuoreTable, cuore2 )

local cuore3 = display.newImage("images/heart.png")
cuore3.y=70
cuore3.x=270
table.insert( cuoreTable, cuore3 )

local cuore4 = display.newImage("images/heart.png")
cuore4.y=70
cuore4.x=370
table.insert( cuoreTable, cuore4 )

local cuore5 = display.newImage("images/heart.png")
cuore5.y=70
cuore5.x=470
table.insert( cuoreTable, cuore5 )


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
  camera:add(cielo, 7, false)

  camera:setBounds(-1920000,1920000,-2000,780)

  camera:track()


 sounds.play('start', { channel=2})

--------------------------------------------------------------------------------
--NON RICHIAMO NESSUNA FUNZIONE PERCHE' SONO TUTTE FUNZIONI ANONIME
--------------------------------------------------------------------------------
sx:addEventListener("touch", function(event)
									local t = event.target
									if "began" == event.phase then
										pulsanteSx2 = display.newImageRect("images/pulsanti/upp.png", 150, 150)
										pulsanteSx2.x = display.screenOriginX + pulsanteSx2.contentWidth+15
										pulsanteSx2.y = display.contentHeight - pulsanteSx2.contentHeight - 150
										display.getCurrentStage():setFocus( event.target, event.id )
										sounds.play('tap', { channel=2})
										if (tempRotazione >= 130 and tempRotazione <=180 ) then tempRotazione = tempRotazione-10 end
									elseif "ended" == event.phase then
										if (pulsanteSx2~= nil)then
											pulsanteSx2:removeSelf()
											pulsanteSx2 = nil
										end
										--display.remove( pulsanteSx2 )
										display.getCurrentStage():setFocus( event.target, nil )
									end
								end)

  dx:addEventListener("touch", function(event)
									local t = event.target
									if "began" == event.phase then
										pulsanteDx2 = display.newImageRect("images/pulsanti/downp.png", 150, 150)
										pulsanteDx2.x = display.screenOriginX + pulsanteDx2.contentWidth + 253
										pulsanteDx2.y = display.contentHeight - pulsanteDx2.contentHeight - 150
										display.getCurrentStage():setFocus( event.target, event.id )
										sounds.play('tap', { channel=2})
										if (tempRotazione >= 120 and tempRotazione <180 ) then tempRotazione = tempRotazione+10 end
									elseif "ended" == event.phase then
										if (pulsanteDx2~= nil)then
											pulsanteDx2:removeSelf()
											pulsanteDx2 = nil
										end
										--display.remove( pulsanteDx2 )
										display.getCurrentStage():setFocus( event.target, nil )
									end
								end)

  m.rotate.left:addEventListener("touch", function(event)
											local t = event.target
											if "began" == event.phase then
												pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3]})
												pulsanteSx3 = display.newImageRect("images/pulsanti/sxp.png",160,160)
												pulsanteSx3.x = display.screenOriginX + pulsanteSx3.contentWidth + 1250
												pulsanteSx3.y = display.contentHeight - pulsanteSx3.contentHeight - 8
												if (suoni == true) then audio.setVolume( 0.2, { channel=6 } ) end
												audio.play( musicTrackTank, { channel=6, loops=-1 } )


											elseif "ended" == event.phase then
												pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3]})
												if (pulsanteSx3~= nil)then
													pulsanteSx3:removeSelf()
													pulsanteSx3 = nil
												end
												audio.setVolume( 0, { channel=6 } )
												display.getCurrentStage():setFocus( event.target, nil )
											end
										  end)

  m.rotate.right:addEventListener("touch",  function(event)
												local t = event.target
												if "began" == event.phase then
													pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3]})
													pulsanteDx3 = display.newImageRect("images/pulsanti/dxp.png",160,160)
													pulsanteDx3.x = display.screenOriginX + pulsanteDx3.contentWidth + 1550
													pulsanteDx3.y = display.contentHeight - pulsanteDx3.contentHeight - 10
													if (suoni == true) then audio.setVolume( 0.2, { channel=6 } ) end
													audio.play( musicTrackTank, { channel=6, loops=-1 } )

												elseif "ended" == event.phase then
													pulsanti.pulsantiMovimentoCingolo().touch(event, {m=m, ruota1=cingolo.ruote[1], ruota2=cingolo.ruote[4], ruota3=cingolo.ruote[2], ruota4=cingolo.ruote[3]})
													if (pulsanteDx3~= nil)then
														pulsanteDx3:removeSelf()
														pulsanteDx3 = nil
													end
													audio.setVolume( 0, { channel=6 } )
													display.getCurrentStage():setFocus( event.target, nil )
												end
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
  --print(metri)
	Runtime:addEventListener("collision", onCollision)

  Runtime:addEventListener("enterFrame", enterFrame)

  if (newGame~= 4) then
	cloudGen()

   cloudLoopTimer = timer.performWithDelay(5000, cloudGen, 0)
	end 
   gameLoopTimer = timer.performWithDelay(10000, function()
																					gameLoop.loop(aereo, aereiTable, bombeTable, camera, corpoCarrarmato.corpo, position)
												  							end, 0)

   gameLoopTimer2 = timer.performWithDelay(15000, function()
																					gameLoop.loop2(aereo2, aereiTable,  camera, corpoCarrarmato.corpo, metri)
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
		audio.stop(5)
		audio.stop(6)
		audio.stop(7)
		audio.stop(2)
		--audio.stop( 6)
		--audio.stop( 7)
		for i = #cuoreTable, 1, -1 do
		table.remove( aereiTable, i )
		cuoreTable[i]:removeSelf()
		cuoreTable[i] = nil
		end
		maxScoreIcon:removeSelf()
		maxScoreIcon = nil
		maxPosizioneIcon:removeSelf()
		maxPosizioneIcon = nil
		maxPosizioneText:removeSelf()
		maxPosizioneText = nil
		maxScoreText:removeSelf()
		maxScoreText = nil
		scoreText:removeSelf()
		scoreText = nil
		home:removeSelf()
		home = nil
		posizioneText:removeSelf()
		posizioneText = nil
		sx:removeSelf()
		sx = nil
		dx:removeSelf()
		dx = nil
		pSparo:removeSelf()
		pSparo = nil
		m.rotate.left:removeSelf()
		m.rotate.left = nil
		m.rotate.right:removeSelf()
		m.rotate.right = nil
		inVita = true
		display.remove(go)
		display.remove(pulsanteDx2)
		display.remove(pulsanteSx2)
		display.remove(pulsanteDx3)
		display.remove(pulsanteSx3)
		display.remove(pulsanteSparo)
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
