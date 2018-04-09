---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
local sounds = require('lib.sounds')
local database = require("class.database")
local scene = composer.newScene()
require("lib.LD_LoaderX")
physics = require ("physics")
physics.start()


---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local btn = nil
local myLevel = {}
local musicTrack

-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view

	--local musicTrack = sounds.loadStream( "menu.wav")

	local myLevel = {}
	myLevel= LD_Loader:new(self.view)
	myLevel:loadLevel("Level02") -- set your scene/level name here
	--local oggettiMenu = myLevel:layerObjectsWithClass("Layer 1", "menu")
	database.createDatabase()

	--sounds.play('menu')

	local bottoneGioca = display.newImageRect(sceneGroup, "images/pulsanti/play.png",300, 300)
	bottoneGioca.x = 1500
	bottoneGioca.y = 250

	local bottoneScore = display.newImageRect(sceneGroup, "images/pulsanti/score.png",300, 300)
	bottoneScore.x = 1500
	bottoneScore.y = 550

	local bottoneSet = display.newImageRect(sceneGroup, "images/pulsanti/settings.png",300, 300)
	bottoneSet.x = 1500
	bottoneSet.y = 850

	bottoneGioca:addEventListener("touch", function(event)
												local t = event.target
												if "began" == event.phase then
													display.getCurrentStage():setFocus( event.target, event.id )
													bottoneGioca2 = display.newImageRect("images/pulsanti/playp.png",300, 300)
													bottoneGioca2.x = 1500
													bottoneGioca2.y = 250
													sounds.play('tap', { channel=2})
													--composer.gotoScene("menuLivelli")

												elseif "ended" == event.phase then
													if (bottoneGioca2 ~= nil) then
													bottoneGioca2:removeSelf()
													bottoneGioca2 = nil
													end
													timer.performWithDelay( 10,composer.gotoScene( "menuLivelli", { time=800, effect="crossFade" } ))
													display.getCurrentStage():setFocus( event.target, nil )
												end
								 end)

	bottoneSet:addEventListener("touch", function(event)
											local t = event.target
											if "began" == event.phase then
												display.getCurrentStage():setFocus( event.target, event.id )
												bottoneSet2 = display.newImageRect("images/pulsanti/settingsp.png",300, 300)
												bottoneSet2.x = 1500
												bottoneSet2.y = 850
												sounds.play('tap', { channel=2})
											elseif "ended" == event.phase then
												if(bottoneSet2 ~= nil)then
												bottoneSet2:removeSelf()
												bottoneSet2 = nil
												end
												timer.performWithDelay( 10,composer.gotoScene( "menuSet", { time=800, effect="crossFade" } ))
												display.getCurrentStage():setFocus( event.target, nil )
											end

								end)

	bottoneScore:addEventListener("touch", function(event)
											local t = event.target
											if "began" == event.phase then
												display.getCurrentStage():setFocus( event.target, event.id )
												bottoneScore2 = display.newImageRect("images/pulsanti/scorep.png",300, 300)
												bottoneScore2.x = 1500
												bottoneScore2.y = 550
												sounds.play('tap', { channel=2})
											elseif "ended" == event.phase then
												if (bottoneScore2~= nil)then
												bottoneScore2:removeSelf()
												bottoneScore2 = nil
												end
												timer.performWithDelay( 10,composer.gotoScene( "menuClassifica", { time=800, effect="crossFade" } ))
												display.getCurrentStage():setFocus( event.target, nil )
											end
																			 end)

	audio.setVolume( 0, { channel=7 } )
	if(musica==true) then audio.setVolume( 0.2, { channel=1 } )	end
	musicTrack = audio.loadStream( "sounds/menu.wav" )

	-- Touch event listener for button
	function mappa1()

			local newGame = 1
			print (newGame)
			composer.gotoScene( "gotoGame", "zoomOutInFade", 300  )

	end

	print( "\n1: create event")
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
    local sceneGroup = self.view
	local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
		audio.play( musicTrack, { channel=1, loops=-1 } )
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
