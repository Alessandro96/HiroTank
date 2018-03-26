
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

selezioneClassifica=0
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen


	local home = display.newImageRect(sceneGroup, "images/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 100
	home.y = 1000

	local bottoneM1 = display.newImageRect(sceneGroup, "images/livello1.png",1200, 600)
	sceneGroup:insert( bottoneM1 )
	bottoneM1.x = 500
	bottoneM1.y = 250

	local bottoneM2 = display.newImageRect(sceneGroup, "images/livello2.png",1200, 600)
	sceneGroup:insert( bottoneM2 )
	bottoneM2.x = 1400
	bottoneM2.y = 250

	local bottoneM3 = display.newImageRect(sceneGroup, "images/livello3.png",1200, 600)
	sceneGroup:insert( bottoneM3 )
	bottoneM3.x = 500
	bottoneM3.y = 750

	local bottoneM4 = display.newImageRect(sceneGroup, "images/nomappa.png",1200, 600)
	sceneGroup:insert( bottoneM4 )
	bottoneM4.x = 1400
	bottoneM4.y = 750

	bottoneM1:addEventListener("tap", function()
																			selezioneClassifica=1
																			composer.gotoScene("classifica")
																		end)
	bottoneM2:addEventListener("tap", function()
																			selezioneClassifica=2
																			composer.gotoScene("classifica")
																		end)
  bottoneM3:addEventListener("tap", function()
																			selezioneClassifica=3
																			composer.gotoScene("classifica")
																		end)
	home:addEventListener("tap", function() composer.gotoScene("menu") end)

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