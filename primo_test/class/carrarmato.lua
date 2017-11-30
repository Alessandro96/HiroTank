
-------------------------------------INIZIO-------------------------------------

local l = {}

function l.newTank(tankCollider)
  local tank = display.newImageRect("images/tank1.png", 120, 45)
	tank.x = display.contentCenterX-700
	tank.y = display.contentCenterY+300
  tank.myName = "tank"
	physics.addBody(tank, {filter = tankCollider})
  return tank
end

function l.pulsante()
  local m = {}
  m.rotate = {}

  function m.touch(event, params)
  	local t = event.target

  	if "began" == event.phase then
  		display.getCurrentStage():setFocus(t)
  		t.isFocus = true
  		params.m.result = t.result

  		if t.result == "rotate:left" then
  			params.m.rotate.left:rotate(params.ruota1, params.ruota2)
  		elseif t.result == "rotate:right" then
  			params.m.rotate.right:rotate(params.ruota1, params.ruota2)
  		end

  	  elseif t.isFocus then
  		  if "moved" == event.phase then
  		elseif "ended" == event.phase then
  			display.getCurrentStage():setFocus(nil)
  			t.isFocus = false
  			params.m.result = "none"
  		end
  	end
  end

  function m.enterFrame(event, params)
  	if params.m.result == "rotate:left" then
  			params.m.rotate.left:rotate(params.ruota1, params.ruota2)
			--params.tank:applyTorque(0.5)
  	elseif params.m.result == "rotate:right" then
  			params.m.rotate.right:rotate(params.ruota1, params.ruota2)
			--params.tank:applyTorque(-0.5)

  	elseif params.m.result == "none" then
  			params.ruota1:applyTorque(0)
         params.ruota2:applyTorque(0)
  	end
  end

  function m.rotate.dx()
    local pulsanteDx = display.newImage("images/dx.png")
    pulsanteDx.x = display.screenOriginX + pulsanteDx.contentWidth + 250
    pulsanteDx.y = display.contentHeight - pulsanteDx.contentHeight - 10
    pulsanteDx.result = "rotate:right"

    function pulsanteDx:rotate(ruota1, ruota2)
      ruota1:applyTorque(1)
      ruota2:applyTorque(1)
    end
    return pulsanteDx
  end

  function m.rotate.sx()
    local pulsanteSx = display.newImage("images/sx.png")
    pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth + 10
    pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 10
    pulsanteSx.result = "rotate:left"

    function pulsanteSx:rotate(ruota1, ruota2)
      ruota1:applyTorque(-1)
      ruota2:applyTorque(-1)
    end
    return pulsanteSx
  end

  return m
end

function l.newChassis(tankX, tankY, chassisCollider)
  local chassis = display.newImageRect("images/blocco.png", 120, 15)
  chassis.x = tankX
  chassis.y = tankY
  physics.addBody(chassis, {filter =  chassisCollider})
  return chassis
end

function l.newSospensioneSx(chassisX, chassisY, chassisCollider)
  local sospensione1 = display.newImageRect("images/blocco.png", 15, 33)
  sospensione1.x = chassisX-40
  sospensione1.y = chassisY+10
  physics.addBody(sospensione1, {filter =  chassisCollider})
  return sospensione1
end

function l.newSospensioneDx(chassisX, chassisY, chassisCollider)
  local sospensione2 = display.newImageRect("images/blocco.png", 15, 33)
  sospensione2.x = chassisX+40
  sospensione2.y = chassisY+10
  physics.addBody(sospensione2, {filter =  chassisCollider})
  return sospensione2
end

function l.newRuotaSx(sospensione1X, sospensione1Y, tankCollider)
  local ruota1 = display.newImageRect("images/ruota.png", 30,30)
  ruota1.x = sospensione1X
  ruota1.y = sospensione1Y+30
  physics.addBody(ruota1, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})
  return ruota1
end

function l.newRuotaDx(sospensione2X, sospensione2Y, tankCollider)
  local ruota2 = display.newImageRect("images/ruota.png", 30,30)
  ruota2.x = sospensione2X
  ruota2.y = sospensione2Y+30
  physics.addBody(ruota2, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})
  return ruota2
end

return l
