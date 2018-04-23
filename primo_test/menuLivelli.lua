local composer = require( "composer" )
local sounds = require('lib.sounds')
local database = require("class.database")
local scene = composer.newScene()
require("lib.LD_LoaderX")

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local btn = nil
local myLevel = {}
local bg
local sbloccoMappe
local home
local lucchetto2, lucchetto3, lucchetto4
local bottoneM1, bottoneM2, bottoneM3, bottoneM4
local coppa1, coppa2, coppa3, coppa4
local piedi1, piedi2, piedi3, piedi4
local maxT1Punteggio, maxT1Distanza
local maxT2Punteggio, maxT2Distanza
local maxT3Punteggio, maxT3Distanza
local maxT4Punteggio, maxT4Distanza
local messaggioSblocco2, messaggioSblocco3, messaggioSblocco4

newGame = 0

-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view

	bg = display.newImageRect("images/BG.png", 1800*1.3, 893*1.3)
	sceneGroup:insert( bg )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	sbloccoMappe=database.sbloccaMappe()

	home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = display.contentWidth/2-10
	home.y = 1000

	bottoneM1 = display.newImageRect(sceneGroup, "images/livello1.png",800, 300)
	sceneGroup:insert( bottoneM1 )
	bottoneM1.x = 500
	bottoneM1.y = 250

	bottoneM2 = display.newImageRect(sceneGroup, "images/livello2.png",800, 300)
	sceneGroup:insert( bottoneM2 )
	bottoneM2.x = 1400
	bottoneM2.y = 250
	if(sbloccoMappe.sbloccoM2==false) then
		bottoneM2.alpha=0.4
		lucchetto2 = display.newImageRect(sceneGroup, "images/lucchetto.png",300, 280)
		sceneGroup:insert( lucchetto2 )
		lucchetto2.x = 1400
		lucchetto2.y = 250
	end

	bottoneM3 = display.newImageRect(sceneGroup, "images/livello3.png",800, 300)
	sceneGroup:insert( bottoneM3 )
	bottoneM3.x = 500
	bottoneM3.y = 750
	if(sbloccoMappe.sbloccoM3==false) then
		bottoneM3.alpha=0.4
		lucchetto3 = display.newImageRect(sceneGroup, "images/lucchetto.png",300, 280)
		sceneGroup:insert( lucchetto3 )
		lucchetto3.x = 500
		lucchetto3.y = 750
	end

	bottoneM4 = display.newImageRect(sceneGroup, "images/livello4.png",800, 300)
	sceneGroup:insert( bottoneM4 )
	bottoneM4.x = 1400
	bottoneM4.y = 750
	if(sbloccoMappe.sbloccoM4==false) then
		bottoneM4.alpha=0.4
		lucchetto4 = display.newImageRect(sceneGroup, "images/lucchetto.png",300, 280)
		sceneGroup:insert( lucchetto4 )
		lucchetto4.x = 1400
		lucchetto4.y = 750
	end

	coppa1 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
	sceneGroup:insert( coppa1 )
	coppa1.x = bottoneM1.x+230
	coppa1.y = 440

	piedi1 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
	sceneGroup:insert( piedi1 )
	piedi1.x = bottoneM1.x-250
	piedi1.y = 440

	maxT1Punteggio=display.newText("cavoletto", bottoneM1.x+255, 440, "Manga.otf", 50)
	maxT1Distanza=display.newText("cavoletto", bottoneM1.x-220, 440, "Manga.otf", 50)
	sceneGroup:insert(maxT1Punteggio)
	sceneGroup:insert(maxT1Distanza)
	maxT1Punteggio:setFillColor(0,0,0)
	maxT1Distanza:setFillColor(0,0,0)
	maxT1Punteggio.anchorX=0
	maxT1Distanza.anchorX=0

	maxT2Punteggio=display.newText("cavoletto", bottoneM2.x+255, 440, "Manga.otf", 50)
	maxT2Distanza=display.newText("cavoletto", bottoneM2.x-220, 440, "Manga.otf", 50)
	sceneGroup:insert(maxT2Punteggio)
	sceneGroup:insert(maxT2Distanza)
	maxT2Punteggio:setFillColor(0,0,0)
	maxT2Distanza:setFillColor(0,0,0)
	maxT2Punteggio.anchorX=0
	maxT2Distanza.anchorX=0
	maxT2Punteggio.alpha=0
	maxT2Distanza.alpha=0

	if(sbloccoMappe.sbloccoM2==true) then
		coppa2 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
		sceneGroup:insert( coppa2 )
		coppa2.x = bottoneM2.x+230
		coppa2.y = 440

		piedi2 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
		sceneGroup:insert( piedi2 )
		piedi2.x = bottoneM2.x-250
		piedi2.y = 440

		maxT2Punteggio.alpha=1
		maxT2Distanza.alpha=1
	elseif(sbloccoMappe.sbloccoM2==false) then
		messaggioSblocco2 = display.newText("Raggiungi 300 m e accumula 150 punti \n         nella prima mappa", bottoneM2.x, bottoneM2.y+220, "Manga.otf", 50)
		sceneGroup:insert( messaggioSblocco2 )
		messaggioSblocco2:setFillColor(0,0,0)
	end

	maxT3Punteggio=display.newText("cavoletto", bottoneM3.x+255, 950, "Manga.otf", 50)
	maxT3Distanza=display.newText("cavoletto", bottoneM3.x-220, 950, "Manga.otf", 50)
	sceneGroup:insert(maxT3Punteggio)
	sceneGroup:insert(maxT3Distanza)
	maxT3Punteggio:setFillColor(0,0,0)
	maxT3Distanza:setFillColor(0,0,0)
	maxT3Punteggio.anchorX=0
	maxT3Distanza.anchorX=0
	maxT3Punteggio.alpha=0
	maxT3Distanza.alpha=0

	if(sbloccoMappe.sbloccoM3==true) then
		coppa3 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
		sceneGroup:insert( coppa3 )
		coppa3.x = bottoneM3.x+230
		coppa3.y = 950

		piedi3 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
		sceneGroup:insert( piedi3 )
		piedi3.x = bottoneM3.x-250
		piedi3.y = 950

		maxT3Punteggio.alpha=1
		maxT3Distanza.alpha=1
	elseif(sbloccoMappe.sbloccoM3==false) then
		messaggioSblocco3 = display.newText("Raggiungi 400 m e accumula 200 punti \n        nella seconda mappa", bottoneM3.x, bottoneM3.y+220, "Manga.otf", 50)
		sceneGroup:insert( messaggioSblocco3 )
		messaggioSblocco3:setFillColor(0,0,0)
	end

	maxT4Punteggio=display.newText("cavoletto", bottoneM4.x+255, 950, "Manga.otf", 50)
	maxT4Distanza=display.newText("cavoletto", bottoneM4.x-220, 950, "Manga.otf", 50)
	sceneGroup:insert(maxT4Punteggio)
	sceneGroup:insert(maxT4Distanza)
	maxT4Punteggio:setFillColor(0,0,0)
	maxT4Distanza:setFillColor(0,0,0)
	maxT4Punteggio.anchorX=0
	maxT4Distanza.anchorX=0
	maxT4Punteggio.alpha=0
	maxT4Distanza.alpha=0

	if(sbloccoMappe.sbloccoM4==true) then
		coppa4 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
		sceneGroup:insert( coppa4 )
		coppa4.x = bottoneM4.x+230
		coppa4.y = 950

		piedi4 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
		sceneGroup:insert( piedi4 )
		piedi4.x = bottoneM4.x-250
		piedi4.y = 950

		maxT4Punteggio.alpha=1
		maxT4Distanza.alpha=1
	elseif(sbloccoMappe.sbloccoM4==false) then
		messaggioSblocco4 = display.newText("Raggiungi 500 m e accumula 250 punti \n        nella terza mappa", bottoneM4.x, bottoneM4.y+220, "Manga.otf", 50)
		sceneGroup:insert( messaggioSblocco4 )
		messaggioSblocco4:setFillColor(0,0,0)
	end

	bottoneM1:addEventListener("tap", function()
																			composer.setVariable("newGame",1)
																			composer.gotoScene("game")
																			sounds.play('tap', { channel=2})
																		end)

	if(sbloccoMappe.sbloccoM2==true) then
		bottoneM2:addEventListener("tap", function()
																				composer.setVariable("newGame", 2)
																				composer.gotoScene("game")
																				sounds.play('tap', { channel=2})
																			end)
	end
	if(sbloccoMappe.sbloccoM3==true) then
		bottoneM3:addEventListener("tap", function()
																				composer.setVariable("newGame", 3)
																				composer.gotoScene("game")
																				sounds.play('tap', { channel=2})
																			end)
	end
	if(sbloccoMappe.sbloccoM4==true) then
		bottoneM4:addEventListener("tap", function()
																				composer.setVariable("newGame", 4)
																				composer.gotoScene("game")
																				sounds.play('tap', { channel=2})
																				end)
  end

	home:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						homep = display.newImageRect("images/pulsanti/homep.png",150, 150)
						homep.x = display.contentWidth/2-10
						homep.y = 1000
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
					elseif "ended" == event.phase then
						if (homep~=nil) then
						homep:removeSelf()
						homep = nil
						end
						timer.performWithDelay( 100,composer.gotoScene( "menu", { time=800, effect="crossFade" } ))
						display.getCurrentStage():setFocus( event.target, nil )
					end
					end )

	-- Touch event listener for button
	function onButtonClick( event )
		print ("touch")
		if event.phase == "began" then

			composer.gotoScene( "scene2", "zoomOutInFade", 300  )

			return true
		end
	end

	-- btn = myLevel:getLayerObject( "layer1","btnNext" )
	-- btn.onPress = onButtonClick

	print( "\n1: create event")
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
    local sceneGroup = self.view
	local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
				database.aggiornaPunteggiMax(maxT1Punteggio, maxT2Punteggio, maxT3Punteggio, maxT4Punteggio, maxT1Distanza, maxT2Distanza, maxT3Distanza, maxT4Distanza)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
		local prevScene = composer.getSceneName( "previous" )
		-- remove previous scene's view
		if (prevScene) then
			composer.removeScene( prevScene )
		end
    end

	print( "1: show event - ", phase )


end


-- Called when scene is about to move offscreen:
function scene:hide( event )
	local sceneGroup = self.view

	print( "1: hide event" )

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------

return scene
