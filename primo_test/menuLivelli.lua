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
local bottoneM1
local maxT1Punteggio, maxT1Distanza
local maxT2Punteggio, maxT2Distanza
local maxT3Punteggio, maxT3Distanza

newGame = 0

local function gotoGame4()
	newGame = 4
	--audio.stop( 1 )
	composer.gotoScene("game")
	sounds.play('tap', { channel=2})
end

-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	local bg = display.newImageRect("images/BG.png", 1800*1.3, 893*1.3)
	sceneGroup:insert( bg )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	local home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 100
	home.y = 1000

	local bottoneM1 = display.newImageRect(sceneGroup, "images/livello1.png",800, 300)
	sceneGroup:insert( bottoneM1 )
	bottoneM1.x = 500
	bottoneM1.y = 250

	local bottoneM2 = display.newImageRect(sceneGroup, "images/livello2.png",800, 300)
	sceneGroup:insert( bottoneM2 )
	bottoneM2.x = 1400
	bottoneM2.y = 250

	local bottoneM3 = display.newImageRect(sceneGroup, "images/livello3.png",800, 300)
	sceneGroup:insert( bottoneM3 )
	bottoneM3.x = 500
	bottoneM3.y = 750

	local coppa1 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
	sceneGroup:insert( coppa1 )
	coppa1.x = bottoneM1.x+230
	coppa1.y = 440

	local piedi1 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
	sceneGroup:insert( piedi1 )
	piedi1.x = bottoneM1.x-250
	piedi1.y = 440

	local coppa2 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
	sceneGroup:insert( coppa2 )
	coppa2.x = bottoneM2.x+230
	coppa2.y = 440

	local piedi2 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
	sceneGroup:insert( piedi2 )
	piedi2.x = bottoneM2.x-250
	piedi2.y = 440

	local coppa3 = display.newImageRect(sceneGroup, "images/coppa.png",70, 70)
	sceneGroup:insert( coppa3 )
	coppa3.x = bottoneM3.x+230
	coppa3.y = 950

	local piedi3 = display.newImageRect(sceneGroup, "images/piedi.png",80, 80)
	sceneGroup:insert( piedi3 )
	piedi3.x = bottoneM3.x-250
	piedi3.y = 950

	maxT1Punteggio=display.newText("cavoletto", bottoneM1.x+255, 440, native.systemFont, 50)
	maxT1Distanza=display.newText("cavoletto", bottoneM1.x-220, 440, native.systemFont, 50)
	sceneGroup:insert(maxT1Punteggio)
	sceneGroup:insert(maxT1Distanza)
	maxT1Punteggio:setFillColor(0,0,0)
	maxT1Distanza:setFillColor(0,0,0)
	maxT1Punteggio.anchorX=0
	maxT1Distanza.anchorX=0

	maxT2Punteggio=display.newText("cavoletto", bottoneM2.x+255, 440, native.systemFont, 50)
	maxT2Distanza=display.newText("cavoletto", bottoneM2.x-220, 440, native.systemFont, 50)
	sceneGroup:insert(maxT2Punteggio)
	sceneGroup:insert(maxT2Distanza)
	maxT2Punteggio:setFillColor(0,0,0)
	maxT2Distanza:setFillColor(0,0,0)
	maxT2Punteggio.anchorX=0
	maxT2Distanza.anchorX=0

	maxT3Punteggio=display.newText("cavoletto", bottoneM3.x+255, 950, native.systemFont, 50)
	maxT3Distanza=display.newText("cavoletto", bottoneM3.x-220, 950, native.systemFont, 50)
	sceneGroup:insert(maxT3Punteggio)
	sceneGroup:insert(maxT3Distanza)
	maxT3Punteggio:setFillColor(0,0,0)
	maxT3Distanza:setFillColor(0,0,0)
	maxT3Punteggio.anchorX=0
	maxT3Distanza.anchorX=0

	local bottoneM4 = display.newImageRect(sceneGroup, "images/nomappa.png",1200, 600)
	sceneGroup:insert( bottoneM4 )
	bottoneM4.x = 1400
	bottoneM4.y = 750

	bottoneM1:addEventListener("tap", function()
																			newGame = 1
																			--audio.stop( 1 )
																			composer.gotoScene("game")
																			sounds.play('tap', { channel=2})
																		end)
	bottoneM2:addEventListener("tap", function()
																		  newGame = 2
																			--audio.stop( 1 )
																			composer.gotoScene("game")
																			sounds.play('tap', { channel=2})
																		end)
	bottoneM3:addEventListener("tap", function()
																			newGame = 3
																			--audio.stop( 1 )
																			composer.gotoScene("game")
																			sounds.play('tap', { channel=2})
																		end)
	home:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						homep = display.newImageRect("images/pulsanti/homep.png",150, 150)
						homep.x = 100
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
				database.aggiornaPunteggiMax(maxT1Punteggio, maxT2Punteggio, maxT3Punteggio, maxT1Distanza, maxT2Distanza, maxT3Distanza)
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
