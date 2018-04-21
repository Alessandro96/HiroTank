
local composer = require( "composer" )
local scene = composer.newScene()
local sounds = require('lib.sounds')
local database = require("class.database")

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local tableView
local distanzaText
local punteggioText
local nomeText
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	if (composer.getVariable("newGame")==1) then
		local bgGround = display.newImage("images/bgground.png")
		sceneGroup:insert( bgGround )
		bgGround.x = display.contentCenterX
		bgGround.y = display.contentCenterY-210
		distanzaText = display.newText("Distanza",  0, 0, "Manga.otf", 80)
		punteggioText = display.newText("Punteggio", 0, 0, "Manga.otf", 80)
		nomeText = display.newText("Nome", 0, 0, "Manga.otf", 80)
		distanzaText:setFillColor(101/255,67/255,33/255)
		punteggioText:setFillColor(101/255,67/255,33/255)
		nomeText:setFillColor(101/255,67/255,33/255)
	end

	if (composer.getVariable("newGame")==2) then
		local bgNeve = display.newImage("images/snowground.png")
		sceneGroup:insert( bgNeve )
		bgNeve.x = display.contentCenterX
		bgNeve.y = display.contentCenterY-100
		distanzaText = display.newText("Distanza",  0, 0, "Manga.otf", 80)
		punteggioText = display.newText("Punteggio", 0, 0, "Manga.otf", 80)
		nomeText = display.newText("Nome", 0, 0, "Manga.otf", 80)
		distanzaText:setFillColor(0/255,49/255,83/255)
		punteggioText:setFillColor(0/255,49/255,83/255)
		nomeText:setFillColor(0/255,49/255,83/255)
	end

	if (composer.getVariable("newGame")==3) then
		local monte = display.newImage("images/mont.png")
		local alberi = display.newImage("images/alb.png")
		sceneGroup:insert( monte )
		sceneGroup:insert( alberi )
		monte.x = display.contentCenterX
		monte.y = display.contentCenterY
		alberi.x = display.contentCenterX
		alberi.y = display.contentCenterY+50
		distanzaText = display.newText("Distanza",  0, 0, "Manga.otf", 80)
		punteggioText = display.newText("Punteggio", 0, 0, "Manga.otf", 80)
		nomeText = display.newText("Nome", 0, 0, "Manga.otf", 80)
		distanzaText:setFillColor(49/255,0/255,98/255)
		punteggioText:setFillColor(49/255,0/255,98/255)
		nomeText:setFillColor(49/255,0/255,98/255)
	end

	if (composer.getVariable("newGame")==4) then
		local bgNotte = display.newImage("images/bgNotteStelle.png")
		sceneGroup:insert( bgNotte )
		bgNotte.x = display.contentCenterX
		bgNotte.y = display.contentCenterY-210
		distanzaText = display.newText("Distanza",  0, 0, "Manga.otf", 80)
		punteggioText = display.newText("Punteggio", 0, 0, "Manga.otf", 80)
		nomeText = display.newText("Nome", 0, 0, "Manga.otf", 80)
		distanzaText:setFillColor(224/255,1,1)
		punteggioText:setFillColor(224/255,1,1)
		nomeText:setFillColor(224/255,1,1)
	end

	local home = display.newImageRect(sceneGroup, "images/pulsanti/home.png",150, 150)
	sceneGroup:insert( home )
	home.x = 500
	home.y = 1000

	local bottoneGioca = display.newImageRect(sceneGroup, "images/pulsanti/play.png",150, 150)
	sceneGroup:insert( bottoneGioca )
	bottoneGioca.x = 1300
	bottoneGioca.y = 1000

	tableView = database.readDatabase()
	sceneGroup:insert(tableView)

	sceneGroup:insert( nomeText )
	sceneGroup:insert( distanzaText )
	sceneGroup:insert( punteggioText )
	distanzaText.x = display.contentCenterX+150
	distanzaText.y = 70
	punteggioText.x = distanzaText.x+500
	punteggioText.y = 70
	nomeText.x = distanzaText.x-700
	nomeText.y = 70

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

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		native.setKeyboardFocus( nil )
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
