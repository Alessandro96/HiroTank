local composer = require( "composer" )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )

-- Go to the menu screen
musica = true
suoni = true

local h = display.contentHeight
local w = display.contentWidth
local x = display.contentCenterX
local y = display.contentCenterY

local splashscreen = native.newVideo( x, y, w, h )
splashscreen:load( "images/video.mp4")
splashscreen:play()

local function removeSplash(event)
splashscreen:removeSelf()
splashscreen = nil
end

timer.performWithDelay(2000,removeSplash)
composer.gotoScene( "menu" )
