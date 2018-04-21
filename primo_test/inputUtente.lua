
local composer = require( "composer" )
local sounds = require('lib.sounds')
local database = require("class.database")
require("lib.LD_LoaderX")

local scene = composer.newScene()
local home
local textField
local nomeUtente
local myLevel = {}


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function textListener( event )
	if ( "began" == event.phase ) then

	elseif ( event.phase == "submitted" ) then
		native.setKeyboardFocus( textField )
		nomeUtente = event.target.text
		timer.performWithDelay( 500, function() print("ok") end)
		database.writeDatabase(composer.getVariable("score"), composer.getVariable("metri"), nomeUtente)
		composer.setVariable("score", 0)
		composer.setVariable("metri", 0)
		timer.performWithDelay( 200, function()
											timer.performWithDelay( 500,composer.gotoScene( "class.classifica", { time=800, effect="crossFade" } ))
								end)
	elseif( event.phase == "ended" ) then
		native.setKeyboardFocus( nil )
		print("fine")
	end

end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local myLevel = {}
	myLevel= LD_Loader:new(self.view)
	myLevel:loadLevel("Level01") -- set your scene/level name here
	local sceneGroup = self.view

	-- Code here runs when the scene is first created but has not yet appeared on screen

	home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 100
	home.y = 1000

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
		-- Code here runs when the scene is still off screen (but is about to come on screen

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		textField = native.newTextField( display.contentCenterX-70, display.contentCenterY-20, 300, 100)
		sceneGroup:insert( textField )
		textField:resizeFontToFitHeight()
		textField:addEventListener("userInput", textListener)
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		textField:removeSelf()
		textField = nil

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
