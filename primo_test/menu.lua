---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
local sounds = require('lib.sounds')
local scene = composer.newScene()
require("lib.LD_LoaderX")
physics = require ("physics")
physics.start()


---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local btn = nil
local myLevel = {}
local bottoneGioca

local musicTrack

local function gotoGame()
		composer.gotoScene("menuLivelli")
		sounds.play('tap', { channel=2})
end

local function gotoSet()
		composer.gotoScene("menuSet")
		sounds.play('tap', { channel=2})
end

local function gotoClassifica()
		composer.gotoScene("classifica")
		sounds.play('tap', { channel=2})
end


-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	
	--local musicTrack = sounds.loadStream( "menu.wav")

	local myLevel = {}
	myLevel= LD_Loader:new(self.view)
	myLevel:loadLevel("Level02") -- set your scene/level name here
	--local oggettiMenu = myLevel:layerObjectsWithClass("Layer 1", "menu")
	
	sounds.play('menu')

	bottoneGioca = display.newImageRect(sceneGroup, "images/play.png",300, 300)
	bottoneGioca.x = 1500
	bottoneGioca.y = 250

	bottoneScore = display.newImageRect(sceneGroup, "images/score.png",300, 300)
	bottoneScore.x = 1500
	bottoneScore.y = 550

	bottoneSet = display.newImageRect(sceneGroup, "images/settings.png",300, 300)
	bottoneSet.x = 1500
	bottoneSet.y = 850

	bottoneGioca:addEventListener("tap", gotoGame)
	bottoneSet:addEventListener("tap", gotoSet)
	bottoneScore:addEventListener("tap", gotoClassifica)
	
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
