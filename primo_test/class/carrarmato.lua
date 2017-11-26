
-------------------------------------INIZIO-------------------------------------

local M = {}

function M.newTank(tankCollider)
  local tank = display.newImageRect("images/tank1.png", 120, 45)
	tank.x = display.contentCenterX-700
	tank.y = display.contentCenterY+300
	physics.addBody(tank, {filter = tankCollider})
  return tank
end

function M.pulsanteDx()
  local pulsanteDx = display.newImageRect("images/dx.png", 60, 40)
  pulsanteDx.x = display.contentWidth - display.screenOriginX - pulsanteDx.contentWidth - 10
  pulsanteDx.y = display.contentHeight - pulsanteDx.contentHeight - 10
  pulsanteDx.result = "rotate:right"
  return pulsanteDx
end

function M.pulsanteSx()
  local pulsanteSx = display.newImageRect("images/sx.png", 60, 40)
  pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth + 10
  pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 10
  pulsanteSx.result = "rotate:left"
  return pulsanteSx
end

function M.newChassis(tankX, tankY, chassisCollider)
  local chassis = display.newImageRect("images/blocco.png", 120, 15)
  chassis.x = tankX
  chassis.y = tankY
  physics.addBody(chassis, {filter =  chassisCollider})
  return chassis
end

function M.newSospensioneSx(chassisX, chassisY, chassisCollider)
  local sospensione1 = display.newImageRect("images/blocco.png", 15, 33)
  sospensione1.x = chassisX-40
  sospensione1.y = chassisY+10
  physics.addBody(sospensione1, {filter =  chassisCollider})
  return sospensione1
end

function M.newSospensioneDx(chassisX, chassisY, chassisCollider)
  local sospensione2 = display.newImageRect("images/blocco.png", 15, 33)
  sospensione2.x = chassisX+40
  sospensione2.y = chassisY+10
  physics.addBody(sospensione2, {filter =  chassisCollider})
  return sospensione2
end

function M.newRuotaSx(sospensione1X, sospensione1Y, tankCollider)
  local ruota1 = display.newImageRect("images/ruota.png", 30,30)
  ruota1.x = sospensione1X
  ruota1.y = sospensione1Y+30
  physics.addBody(ruota1, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})
  return ruota1
end

function M.newRuotaDx(sospensione2X, sospensione2Y, tankCollider)
  local ruota2 = display.newImageRect("images/ruota.png", 30,30)
  ruota2.x = sospensione2X
  ruota2.y = sospensione2Y+30
  physics.addBody(ruota2, {radius=15, friction = 10, bounce = 0.5, filter = tankCollider})
  return ruota2
end

return M
