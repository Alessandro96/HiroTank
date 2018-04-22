
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
local terreno = require("class.terreno")
local aereiTable = {}
local cloudTable = {}
local cuoreTable = {}
local bombeTable = {}
local gameLoop = require("class.gameLoop")
m.result = "none"
m.rotate = {}
metri = nil
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
	metri = (math.round(((cannon.x-256)/100)*10)*0.1)+9
	metamappa = (math.round(((position)/100)*10)*0.1)+6.5
	posizioneText.text="m : "..metri

	if (verificaFumo == true) then
	smoke.x = cannon.x-20
	smoke.y = cannon.y-140
	end

	if (cannon.y > 1700 and inVita == true) then
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
	if (composer.getVariable("newGame")==1) then
		bgGround = display.newImage("images/bgground.png")
	  cont=cont+4000
		bgGround.x = cont
		bgGround.y = display.contentCenterY+60
	  camera:add(bgGround, 6, false)
	end

	if (composer.getVariable("newGame")==2) then
		bgNeve = display.newImage("images/snowground.png")
	  cont=cont+4000
		bgNeve.x = cont
		bgNeve.y = display.contentCenterY+60
	  camera:add(bgNeve, 6, false)
	end

if (composer.getVariable("newGame")==3) then
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

if (composer.getVariable("newGame")==4) then
	bgNotte = display.newImage("images/bgNotteStelle.png")
  cont=cont+4000
	bgNotte.x = cont
	bgNotte.y = display.contentCenterY+60
  camera:add(bgNotte, 6, false)
end


	---------------------------------------------------------
	-- GENERATORE DINAMICO MAPPA "GROUND"
	---------------------------------------------------------
	if ( whereFrom == 1 and composer.getVariable("newGame") == 1) then

		ground1.y=display.contentHeight
		ground1.x=position

	elseif ( whereFrom == 2 and composer.getVariable("newGame") == 1 ) then

		ground2.y=display.contentHeight
		ground2.x=position


	elseif ( whereFrom == 3 and composer.getVariable("newGame") == 1 ) then

		ground3.y=display.contentHeight
		ground3.x=position


	elseif ( whereFrom == 4 and composer.getVariable("newGame") == 1 ) then

		ground4.y=display.contentHeight
		ground4.x=position

	elseif ( whereFrom == 5 and composer.getVariable("newGame") == 1) then

		ground5.y=display.contentHeight
		ground5.x=position

	elseif ( whereFrom == 6 and composer.getVariable("newGame") == 1) then

		ground6.y=display.contentHeight
		ground6.x=position

	---------------------------------------------------------
	-- GENERATORE DINAMICO MAPPA "NEVE"
	---------------------------------------------------------

	elseif ( whereFrom == 1 and composer.getVariable("newGame") == 2 ) then

		neve1.y=display.contentHeight
		neve1.x=position

	elseif ( whereFrom == 2 and composer.getVariable("newGame") == 2 ) then

		neve2.y=display.contentHeight
		neve2.x=position


	elseif ( whereFrom == 3 and composer.getVariable("newGame") == 2 ) then

		neve3.y=display.contentHeight
		neve3.x=position


	elseif ( whereFrom == 4 and composer.getVariable("newGame") == 2 ) then

		neve4.y=display.contentHeight
		neve4.x=position

	elseif ( whereFrom == 5 and composer.getVariable("newGame") == 2) then

		neve5.y=display.contentHeight
		neve5.x=position

	elseif ( whereFrom == 6 and composer.getVariable("newGame") == 2) then

		neve6.y=display.contentHeight
		neve6.x=position

		---------------------------------------------------------
		-- GENERATORE DINAMICO MAPPA "SUNSET"
		---------------------------------------------------------

	  elseif ( whereFrom == 1 and composer.getVariable("newGame") == 3) then

			sunset1.y=display.contentHeight
			sunset1.x=position



		elseif ( whereFrom == 2 and composer.getVariable("newGame") == 3 ) then

			sunset2.y=display.contentHeight
			sunset2.x=position


		elseif ( whereFrom == 3 and composer.getVariable("newGame") == 3 ) then

			sunset3.y=display.contentHeight
			sunset3.x=position


		elseif ( whereFrom == 4 and composer.getVariable("newGame") == 3 ) then

			sunset4.y=display.contentHeight
			sunset4.x=position


		elseif ( whereFrom == 5 and composer.getVariable("newGame") == 3) then

			sunset5.y=display.contentHeight
			sunset5.x=position


		elseif ( whereFrom == 6 and composer.getVariable("newGame") == 3) then

			sunset6.y=display.contentHeight
			sunset6.x=position

			---------------------------------------------------------
			-- GENERATORE DINAMICO MAPPA "NOTTE"
			---------------------------------------------------------

		elseif ( whereFrom == 1 and composer.getVariable("newGame") == 4 ) then

				notte1.y=display.contentHeight-60
			  notte1.x=position

			elseif ( whereFrom == 2 and composer.getVariable("newGame") == 4 ) then

				notte2.y=display.contentHeight-60
				notte2.x=position


			elseif ( whereFrom == 3 and composer.getVariable("newGame") == 4 ) then

				notte3.y=display.contentHeight-60
				notte3.x=position


			elseif ( whereFrom == 4 and composer.getVariable("newGame") == 4 ) then

				notte4.y=display.contentHeight-60
				notte4.x=position

			elseif ( whereFrom == 5 and composer.getVariable("newGame") == 4) then

				notte5.y=display.contentHeight-60
				notte5.x=position

			elseif ( whereFrom == 6 and composer.getVariable("newGame") == 4) then

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

	scoreText = display.newText("score: "..score, 140, 170,"Manga.otf" , 80)
	scoreText:setFillColor(0,0,0)
	posizioneText = display.newText("posizione: "..0, display.contentWidth-300, 100, "Manga.otf", 80)
	posizioneText:setFillColor(0,0,0)
	maxScoreIcon = display.newImageRect("images/coppa.png",70, 70)
	maxScoreIcon.x = 70
	maxScoreIcon.y = 250
	maxScoreText = display.newText(""..primoInClassifica.punteggio, 120, 250, "Manga.otf", 80)
	maxScoreText.anchorX = 0
	maxScoreText:setFillColor(0,0,0)
	maxPosizioneIcon = display.newImageRect("images/piedi.png",70, 70)
	maxPosizioneIcon.x = display.contentWidth-360
	maxPosizioneIcon.y = 180
	maxPosizioneText = display.newText(""..primoInClassifica.distanza, display.contentWidth-310, 180, "Manga.otf", 80)
	maxPosizioneText.anchorX = 0
	maxPosizioneText:setFillColor(0,0,0)

	if(composer.getVariable("newGame")==1)then
		scoreText:setFillColor(101/255,67/255,33/255)
		posizioneText:setFillColor(101/255,67/255,33/255)
		maxScoreText:setFillColor(101/255,67/255,33/255)
		maxPosizioneText:setFillColor(101/255,67/255,33/255)

	elseif(composer.getVariable("newGame")==2)then
		scoreText:setFillColor(0/255,49/255,83/255)
		posizioneText:setFillColor(0/255,49/255,83/255)
		maxScoreText:setFillColor(0/255,49/255,83/255)
		maxPosizioneText:setFillColor(0/255,49/255,83/255)

	elseif(composer.getVariable("newGame")==3)then
		scoreText:setFillColor(49/255,0/255,98/255)
		posizioneText:setFillColor(49/255,0/255,98/255)
		maxScoreText:setFillColor(49/255,0/255,98/255)
		maxPosizioneText:setFillColor(49/255,0/255,98/255)

	elseif(composer.getVariable("newGame")==4)then
		scoreText:setFillColor(224/255,1,1)
		posizioneText:setFillColor(224/255,1,1)
		maxScoreText:setFillColor(224/255,1,1)
		maxPosizioneText:setFillColor(224/255,1,1)

	end

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
  if (composer.getVariable("newGame") == 1) then
		groundBG = display.newImage("images/bgground.png")
		groundBG.x = cont
		groundBG.y = display.contentCenterY+60
		camera:add(groundBG, 6, false)

  elseif (composer.getVariable("newGame") == 2) then
		neveBG = display.newImage("images/snowground.png")
	  neveBG.x = cont
		neveBG.y = display.contentCenterY+60
		camera:add(neveBG, 6, false)

  elseif (composer.getVariable("newGame") == 3) then
	monteBase = display.newImage("images/mont.png")
	monteBase.x = cont
	monteBase.y = display.contentCenterY+120
	alberiBase = display.newImage("images/alb.png")
	alberiBase.x = cont
	alberiBase.y = display.contentCenterY+260
	camera:add(monteBase, 6, false)
	camera:add(alberiBase, 6, false)


  elseif (composer.getVariable("newGame") == 4) then
	notteBG = display.newImage("images/bgNotteStelle.png")
  notteBG.x = cont
	notteBG.y = display.contentCenterY+60
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
--CARICAMENTO TERRENO
--------------------------------------------------------------------------------

terreno.newTerreno(camera)

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

   bombLoopTimer = timer.performWithDelay(1300, function()
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
