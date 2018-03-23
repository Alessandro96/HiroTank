---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
local sounds = require('lib.sounds')
local scene = composer.newScene()
require("lib.LD_LoaderX")

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local btn = nil
local myLevel = {}
local bottoneM1

newGame = 0

local function gotoGame1()
	newGame = 1
	--audio.stop( 1 )
	composer.gotoScene("game")
	sounds.play('tap', { channel=2})
end

local function gotoGame2()
	newGame = 2
	--audio.stop( 1 )
	composer.gotoScene("game")
	sounds.play('tap', { channel=2})
end

local function gotoGame3()
	newGame = 3
	--audio.stop( 1 )
	composer.gotoScene("game")
	sounds.play('tap', { channel=2})
end

local function gotoGame4()
	newGame = 4
	--audio.stop( 1 )
	composer.gotoScene("game")
	sounds.play('tap', { channel=2})
end


local function gotoMenu()
		composer.gotoScene("menu")
		sounds.play('tap', { channel=2})
end

-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view

	--local myLevel = {}
	--myLevel= LD_Loader:new(self.view)
	--myLevel:loadLevel("Level02") -- set your scene/level name here
	--local oggettiMenu = myLevel:layerObjectsWithClass("Layer 1", "menu")
	local bg = display.newImageRect("images/bg.png", 1800*1.3, 893*1.3)
	sceneGroup:insert( bg )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

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

	bottoneM1:addEventListener("tap", gotoGame1)
	bottoneM2:addEventListener("tap", gotoGame2)
	bottoneM3:addEventListener("tap", gotoGame3)
	home:addEventListener("tap", gotoMenu)

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
