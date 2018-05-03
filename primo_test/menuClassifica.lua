
local composer = require( "composer")
local database = require("class.database")
local sounds = require('lib.sounds')

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local bg = display.newImageRect("images/BG.png", 1800*1.3, 893*1.3)
	sceneGroup:insert( bg )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY


	local home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 500
	home.y = 1000

	local bottoneGioca = display.newImageRect(sceneGroup, "images/pulsanti/play.png",150, 150)
	sceneGroup:insert( bottoneGioca )
	bottoneGioca.x = 1300
	bottoneGioca.y = 1000

	local bottoneM1 = display.newImageRect(sceneGroup, "images/livello1.png",800, 300)
	sceneGroup:insert( bottoneM1 )
	bottoneM1.x = 500
	bottoneM1.y = 250
	local cerchio1 = display.newCircle(sceneGroup, bottoneM1.x, bottoneM1.y+170, 20)
	cerchio1:setFillColor(0,127/255,1)

	local bottoneM2 = display.newImageRect(sceneGroup, "images/livello2.png",800, 300)
	sceneGroup:insert( bottoneM2 )
	bottoneM2.x = 1400
	bottoneM2.y = 250
	local cerchio2 = display.newCircle(sceneGroup, bottoneM2.x, bottoneM2.y+170, 20)
	cerchio2:setFillColor(0,127/255,1)

	local bottoneM3 = display.newImageRect(sceneGroup, "images/livello3.png",800, 300)
	sceneGroup:insert( bottoneM3 )
	bottoneM3.x = 500
	bottoneM3.y = 750
	local cerchio3 = display.newCircle(sceneGroup, bottoneM3.x, bottoneM3.y-170, 20)
	cerchio3:setFillColor(0,127/255,1)

	local bottoneM4 = display.newImageRect(sceneGroup, "images/livello4.png",800, 300)
	sceneGroup:insert( bottoneM4 )
	bottoneM4.x = 1400
	bottoneM4.y = 750

	bottoneM1:addEventListener("tap", function()
																			composer.setVariable("newGame",1)
																			sounds.play('tap', { channel=2})
																			composer.gotoScene("class.classifica")
																		end)
	bottoneM2:addEventListener("tap", function()
																			composer.setVariable("newGame",2)
																			sounds.play('tap', { channel=2})
																			composer.gotoScene("class.classifica")
																		end)
  bottoneM3:addEventListener("tap", function()
																			composer.setVariable("newGame",3)
																			sounds.play('tap', { channel=2})
																			composer.gotoScene("class.classifica")
																		end)
	bottoneM4:addEventListener("tap", function()
																			composer.setVariable("newGame",4)
																			sounds.play('tap', { channel=2})
																			composer.gotoScene("class.classifica")
																		end)
	cerchio1:addEventListener("tap", function()
																			database.aggiungiPunteggi(1)
																		end)
	cerchio2:addEventListener("tap", function()
																			database.aggiungiPunteggi(2)
																		end)
	cerchio3:addEventListener("tap", function()
																			database.aggiungiPunteggi(3)
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
																			if (homep~=nil) then
																			homep:removeSelf()
																			homep = nil
																			end
																			timer.performWithDelay( 100,composer.gotoScene( "menu", { time=800, effect="crossFade" } ))
																			display.getCurrentStage():setFocus( event.target, nil )
																		end
																end )

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
																							if (bottoneGioca2 ~= nil) then
																							bottoneGioca2:removeSelf()
																							bottoneGioca2 = nil
																							end
																							timer.performWithDelay( 10,composer.gotoScene( "menuLivelli", { time=800, effect="crossFade" } ))
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
