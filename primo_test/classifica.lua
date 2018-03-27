
local composer = require( "composer" )
local scene = composer.newScene()
local sounds = require('lib.sounds')

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local database = require("class.database").readDatabase()

local function gotoMenu()
	composer.gotoScene("menu")
end

local function gotoMenuLivelli()
	composer.gotoScene("menuLivelli")
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	sceneGroup:insert( database )
	
	local home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 500
	home.y = 1000
	
	local bottoneGioca = display.newImageRect(sceneGroup, "images/pulsanti/play.png",150, 150)
	sceneGroup:insert( bottoneGioca )
	bottoneGioca.x = 1300
	bottoneGioca.y = 1000
	
	
	local distanzaText = display.newText("Distanza",  0, 0, native.systemFont, 80)
	local punteggioText = display.newText("Punteggio", 0, 0, native.systemFont, 80)
	sceneGroup:insert( distanzaText )
	sceneGroup:insert( punteggioText )
	distanzaText.x = display.contentCenterX-30
	distanzaText.y = 70
	punteggioText.x = distanzaText.x+750
	punteggioText.y = 70
	
	bottoneGioca:addEventListener("touch", function(event)
												local t = event.target
												if "began" == event.phase then
													display.getCurrentStage():setFocus( event.target, event.id )
													bottoneGioca2 = display.newImageRect("images/pulsanti/playp.png",150, 150)
													bottoneGioca2.x = 1300
													bottoneGioca2.y = 1000
													sounds.play('tap', { channel=2})
													--composer.gotoScene("menuLivelli")
													
												elseif "ended" == event.phase then
													bottoneGioca2:removeSelf()
													bottoneGioca2 = nil
													timer.performWithDelay( 10,composer.gotoScene( "menuLivelli", { time=800, effect="crossFade" } ))
													display.getCurrentStage():setFocus( event.target, nil )
												end
								 end)
		

			
	home:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						homep = display.newImageRect("images/pulsanti/homep.png",150, 150)
						homep.x = 500
						homep.y = 1000
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
					elseif "ended" == event.phase then
						homep:removeSelf()
						homep = nil
						timer.performWithDelay( 100,composer.gotoScene( "menu", { time=800, effect="crossFade" } ))
						display.getCurrentStage():setFocus( event.target, nil )
					end
					end )
	
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		--display.remove(home)
		--display.remove(database)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

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
