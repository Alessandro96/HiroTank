
local composer = require( "composer")
local sounds = require('lib.sounds')

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

	local bg = display.newImageRect("images/BG.png", 1800*1.3, 893*1.3)
	sceneGroup:insert( bg )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	local options = 
{
    text = "Developers : Alessandro Renzi, Francesco Trinca, Lorenzo Cancello \n--------------------\n Antonio Trinca per l'ispirazione del gioco \n Open Game Art per la skin di Hiroo \n Andrea Paparcone per l'alpha testing\n Enersis Mo per la musica  \n Matiti per il logo \n \n Un ringraziamento speciale a tutti quelli che hanno supportato Hiroo Tank \n  \n ENJOY THE GAME",    
    x = display.contentCenterX,
    y = display.contentCenterY+150,
    width = 1800,
    font = "Manga.otf",   
    fontSize = 55,
    align = "center"  -- Alignment parameter
}
 
local myText = display.newText( options )
sceneGroup:insert( myText)
--myText:setFillColor( 1, 0, 0 )

	local home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 100
	home.y = 1000
	
	local tanks = display.newImage(sceneGroup, "images/tanks.png")
	sceneGroup:insert( home )
	tanks.x = display.contentCenterX-100
	tanks.y = display.contentCenterY-400

	
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
