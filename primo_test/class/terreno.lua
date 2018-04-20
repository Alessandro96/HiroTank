local m={}

function m.newTerreno(camera)
	--------------------------------------------------------------------------------
--CARICAMENTO TERRENO TIPOLOGIA "GROUND"
--------------------------------------------------------------------------------
	if (newGame == 1) then

	  local scaleFactor = 1.0
	  local physicsData = (require "images.groundbase").physicsData(scaleFactor)
	  groundDefault = display.newImage("images/groundbase.png")
	  groundDefault.myName = "terreno"
	  physics.addBody( groundDefault, "static", physicsData:get("groundbase") )
	  groundDefault.y=display.contentHeight
	  groundDefault.x=position
	  camera:add(groundDefault, 5, false)

	  local physicsData = (require "images.t1").physicsData(scaleFactor)
	  ground1 = display.newImage("images/t1.png")
	  ground1.myName = "terreno"
	  physics.addBody( ground1, "static", physicsData:get("t1") )
	  ground1.y=-7000
	  ground1.x=-3000
	  camera:add(ground1, 5, false)

	  local physicsData = (require "images.t2").physicsData(scaleFactor)
	  ground2 = display.newImage("images/t2.png")
	  ground2.myName = "terreno"
	  physics.addBody( ground2, "static", physicsData:get("t2") )
	  ground2.y=-3000
	  ground2.x=-7000
	  camera:add(ground2, 5, false)

	  local physicsData = (require "images.t10").physicsData(scaleFactor)
	  ground3 = display.newImage("images/t10.png")
	  ground3.myName = "terreno"
	  physics.addBody( ground3, "static", physicsData:get("t10") )
	  ground3.y=-3000
	  ground3.x=-7000
	  camera:add(ground3, 5, false)

	  local physicsData = (require "images.t40").physicsData(scaleFactor)
	  ground4 = display.newImage("images/t40.png")
	  ground4.myName = "terreno"
	  physics.addBody( ground4, "static", physicsData:get("t40") )
	  ground4.y=-9000
	  ground4.x=-3000
	  camera:add(ground4, 5, false)

	  local physicsData = (require "images.t11").physicsData(scaleFactor)
	  ground5 = display.newImage("images/t11.png")
	  ground5.myName = "terreno"
	  physics.addBody( ground5, "static", physicsData:get("t11") )
	  ground5.y=-3000
	  ground5.x=-7000
	  camera:add(ground5, 5, false)

	  local physicsData = (require "images.t12").physicsData(scaleFactor)
	  ground6 = display.newImage("images/t12.png")
	  ground6.myName = "terreno"
	  physics.addBody( ground6, "static", physicsData:get("t12") )
	  ground6.y=-3000
	  ground6.x=-7000
	  camera:add(ground6, 5, false)


	--------------------------------------------------------------------------------
	--CARICAMENTO TERRENO TIPOLOGIA "NEVE"
	--------------------------------------------------------------------------------
	elseif (newGame == 2) then

	  local scaleFactor = 1.0
	  local physicsData = (require "images.nevebase").physicsData(scaleFactor)
	  neveDefault = display.newImage("images/nevebase.png")
	  neveDefault.myName = "terreno"
	  physics.addBody( neveDefault, "static", physicsData:get("nevebase") )
	  neveDefault.y=display.contentHeight
	  neveDefault.x=position
	  camera:add(neveDefault, 5, false)

	  local physicsData = (require "images.t3").physicsData(scaleFactor)
	  neve1 = display.newImage("images/t3.png")
	  neve1.myName = "terreno"
	  physics.addBody( neve1, "static", physicsData:get("t3") )
	  neve1.y=-9000
	  neve1.x=-3000
	  camera:add(neve1, 5, false)


	  local physicsData = (require "images.t5").physicsData(scaleFactor)
	  neve2 = display.newImage("images/t5.png")
	  neve2.myName = "terreno"
	  physics.addBody( neve2, "static", physicsData:get("t5") )
	  neve2.y=-13000
	  neve2.x=-3000
	  camera:add(neve2, 5, false)

	  local physicsData = (require "images.t6").physicsData(scaleFactor)
	  neve3 = display.newImage("images/t6.png")
	  neve3.myName = "terreno"
	  physics.addBody( neve3, "static", physicsData:get("t6") )
	  neve3.y=-13000
	  neve3.x=-3000
	  camera:add(neve3, 5, false)

	  local physicsData = (require "images.n1").physicsData(scaleFactor)
	  neve4 = display.newImage("images/n1.png")
	  neve4.myName = "terreno"
	  physics.addBody( neve4, "static", physicsData:get("n1") )
	  neve4.y=-13000
	  neve4.x=-3000
	  camera:add(neve4, 5, false)

	  local physicsData = (require "images.n2").physicsData(scaleFactor)
	  neve5 = display.newImage("images/n2.png")
	  neve5.myName = "terreno"
	  physics.addBody(neve5, "static", physicsData:get("n2") )
	  neve5.y=-13000
	  neve5.x=-3000
	  camera:add(neve5, 5, false)

	  local physicsData = (require "images.n3").physicsData(scaleFactor)
	  neve6 = display.newImage("images/n3.png")
	  neve6.myName = "terreno"
	  physics.addBody(neve6, "static", physicsData:get("n3") )
	  neve6.y=-13000
	  neve6.x=-3000
	  camera:add(neve6, 5, false)

	end

	--------------------------------------------------------------------------------
	--CARICAMENTO TERRENO TIPOLOGIA "SUNSET"
	--------------------------------------------------------------------------------
	if (newGame == 3) then

	  local scaleFactor = 1.0
	  local physicsData = (require "images.sunsetbase").physicsData(scaleFactor)
	  sunsetDefault = display.newImage("images/sunsetbase.png")
	  sunsetDefault.myName = "terreno"
	  physics.addBody( sunsetDefault, "static", physicsData:get("sunsetbase") )
	  sunsetDefault.y=display.contentHeight
	  sunsetDefault.x=position
	  camera:add(sunsetDefault, 5, false)

		local physicsData = (require "images.s1").physicsData(scaleFactor)
	  sunset1 = display.newImage("images/s1.png")
	  sunset1.myName = "terreno"
	  physics.addBody( sunset1, "static", physicsData:get("s1") )
	  sunset1.y=-7000
	  sunset1.x=-3000
	  camera:add(sunset1, 5, false)

	  local physicsData = (require "images.s2").physicsData(scaleFactor)
	  sunset2 = display.newImage("images/s2.png")
	  sunset2.myName = "terreno"
	  physics.addBody( sunset2, "static", physicsData:get("s2") )
	  sunset2.y=-3000
	  sunset2.x=-7000
	  camera:add(sunset2, 5, false)

	  local physicsData = (require "images.s3").physicsData(scaleFactor)
	  sunset3 = display.newImage("images/s3.png")
	  sunset3.myName = "terreno"
	  physics.addBody( sunset3, "static", physicsData:get("s3") )
	  sunset3.y=-3000
	  sunset3.x=-7000
	  camera:add(sunset3, 5, false)

	  local physicsData = (require "images.s4").physicsData(scaleFactor)
	  sunset4 = display.newImage("images/s4.png")
	  sunset4.myName = "terreno"
	  physics.addBody( sunset4, "static", physicsData:get("s4") )
	  sunset4.y=-9000
	  sunset4.x=-3000
	  camera:add(sunset4, 5, false)

	  local physicsData = (require "images.s5").physicsData(scaleFactor)
	  sunset5 = display.newImage("images/s5.png")
	  sunset5.myName = "terreno"
	  physics.addBody( sunset5, "static", physicsData:get("s5") )
	  sunset5.y=-3000
	  sunset5.x=-7000
	  camera:add(sunset5, 5, false)

	  local physicsData = (require "images.s6").physicsData(scaleFactor)
	  sunset6 = display.newImage("images/s6.png")
	  sunset6.myName = "terreno"
	  physics.addBody( sunset6, "static", physicsData:get("s6") )
	  sunset6.y=-3000
	  sunset6.x=-7000
	  camera:add(sunset6, 5, false)
	end

	--------------------------------------------------------------------------------
	--CARICAMENTO TERRENO TIPOLOGIA "NOTTE"
	--------------------------------------------------------------------------------
	if (newGame == 4) then

	  local scaleFactor = 1.0
	  local physicsData = (require "images.nottebase").physicsData(scaleFactor)
	  notteDefault = display.newImage("images/nottebase.png")
	  notteDefault.myName = "terreno"
	  physics.addBody( notteDefault, "static", physicsData:get("nottebase") )
	  notteDefault.y=display.contentHeight-60
	  notteDefault.x=position
	  camera:add(notteDefault, 5, false)

		local physicsData = (require "images.u1").physicsData(scaleFactor)
	  notte1 = display.newImage("images/u1.png")
	  notte1.myName = "terreno"
	  physics.addBody( notte1, "static", physicsData:get("u1") )
	  notte1.y=-7000
	  notte1.x=-3000
	  camera:add(notte1, 5, false)

	  local physicsData = (require "images.u2").physicsData(scaleFactor)
	  notte2 = display.newImage("images/u2.png")
	  notte2.myName = "terreno"
	  physics.addBody( notte2, "static", physicsData:get("u2") )
	  notte2.y=-3000
	  notte2.x=-7000
	  camera:add(notte2, 5, false)

	  local physicsData = (require "images.u3").physicsData(scaleFactor)
	  notte3 = display.newImage("images/u3.png")
	  notte3.myName = "terreno"
	  physics.addBody(notte3, "static", physicsData:get("u3") )
	  notte3.y=-3000
	  notte3.x=-7000
	  camera:add(notte3, 5, false)

	  local physicsData = (require "images.u4").physicsData(scaleFactor)
	  notte4 = display.newImage("images/u4.png")
	  notte4.myName = "terreno"
	  physics.addBody( notte4, "static", physicsData:get("u4") )
	  notte4.y=-9000
	  notte4.x=-3000
	  camera:add(notte4, 5, false)

	  local physicsData = (require "images.u5").physicsData(scaleFactor)
	  notte5 = display.newImage("images/u5.png")
	  notte5.myName = "terreno"
	  physics.addBody( notte5, "static", physicsData:get("u5") )
	  notte5.y=-3000
	  notte5.x=-7000
	  camera:add(notte5, 5, false)

	  local physicsData = (require "images.u6").physicsData(scaleFactor)
	  notte6 = display.newImage("images/u6.png")
	  notte6.myName = "terreno"
	  physics.addBody( notte6, "static", physicsData:get("u6") )
	  notte6.y=-3000
	  notte6.x=-7000
	  camera:add(notte6, 5, false)
	end
	
end

return m
