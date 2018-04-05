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

local function mOn()
	audio.setVolume( 0.5, { channel=1 } )
	sounds.play('tap', { channel=2})
end

local function mOff()
	audio.setVolume( 0, { channel=1 } )
	sounds.play('tap', { channel=2})
end

local function sOn()
	audio.setVolume( 0.5, { channel=2 } )
	audio.setVolume( 0.5, { channel=3 } )
	sounds.play('tap', { channel=2})
end

local function sOff()
	sounds.play('tap', { channel=2})
	audio.setVolume( 0, { channel=3 } )
	audio.setVolume( 0, { channel=2 } )
end


local function gotoMenu()
		composer.gotoScene("menu")
		sounds.play('tap', { channel=2})
end

-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	local bg = display.newImageRect("images/BG.png", 1800*1.3, 893*1.3)
	sceneGroup:insert( bg )
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY



	local bottoneM1 = display.newImageRect(sceneGroup, "images/pulsanti/mon.png",300, 300)
	sceneGroup:insert( bottoneM1 )
	bottoneM1.x = 500
	bottoneM1.y = 250

	local bottoneM2 = display.newImageRect(sceneGroup, "images/pulsanti/moff.png",300, 300)
	sceneGroup:insert( bottoneM2 )
	bottoneM2.x = 1400
	bottoneM2.y = 250

	local bottoneM3 = display.newImageRect(sceneGroup, "images/pulsanti/aon.png",300, 300)
	sceneGroup:insert( bottoneM3 )
	bottoneM3.x = 500
	bottoneM3.y = 750

	local bottoneM4 = display.newImageRect(sceneGroup, "images/pulsanti/aoff.png",300, 300)
	sceneGroup:insert( bottoneM4 )
	bottoneM4.x = 1400
	bottoneM4.y = 750

	local home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 100
	home.y = 1000

	
	
	bottoneM1:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						b1p = display.newImageRect("images/pulsanti/monp.png",300, 300)
						b1p.x = 500
						b1p.y = 250
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
					elseif "ended" == event.phase then
						if (b1p~=nil) then
						b1p:removeSelf()
						b1p = nil
						end
						mOn()
						display.getCurrentStage():setFocus( event.target, nil )
					end
	end )
	
	bottoneM2:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						b2p = display.newImageRect("images/pulsanti/moffp.png",300, 300)
						b2p.x = 1400
						b2p.y = 250
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
					elseif "ended" == event.phase then
						if (b2p~=nil) then
						b2p:removeSelf()
						b2p = nil
						end
						mOff()
						display.getCurrentStage():setFocus( event.target, nil )
					end
	end )
	
	bottoneM3:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						b3p = display.newImageRect("images/pulsanti/aonp.png",300, 300)
						b3p.x = 500
						b3p.y = 750
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
					elseif "ended" == event.phase then
						if (b3p~=nil) then
						b3p:removeSelf()
						b3p = nil
						end
						sOn()
						display.getCurrentStage():setFocus( event.target, nil )
					end
	end )
	
	bottoneM4:addEventListener("touch", function(event)
					local t = event.target
					if "began" == event.phase then
						b4p = display.newImageRect("images/pulsanti/aoffp.png",300, 300)
						b4p.x = 1400
						b4p.y = 750
						display.getCurrentStage():setFocus( event.target, event.id )
						sounds.play('tap', { channel=2})
					elseif "ended" == event.phase then
						if (b4p~=nil) then
						b4p:removeSelf()
						b4p = nil
						end
						sOff()
						display.getCurrentStage():setFocus( event.target, nil )
					end
	end )
	
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
