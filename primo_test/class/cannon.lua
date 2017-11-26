--------------------------------------INIZIO------------------------------------

local M ={}

function M.newCannon(params)
  local cannon = display.newImageRect("images/Untitled.png", 40, 60  )
  cannon.x = params.tankX+20
  cannon.y = params.tankY-40
  physics.addBody( cannon, "dynamic", { density=0, friction=100, bounce=0, isSensor=true} )
  cannon.rotation=0
  params.camera:add(cannon, 1, false)
  return cannon
end

function M.pulsanteDx()
  local pulsanteDx = display.newImageRect("images/bottone.png", 50, 50)
  pulsanteDx.x = display.contentCenterX+150
  pulsanteDx.y = display.contentCenterY
  return pulsanteDx
end

function M.pulsanteSx()
  local pulsanteSx = display.newImageRect("images/bottone.png", 50, 50)
  pulsanteSx.x = display.contentCenterX-150
  pulsanteSx.y = display.contentCenterY
  return pulsanteSx
end

function M.pulsanteSparo()
  local pulsanteSparo = display.newImageRect("images/missile2.png", 34, 67)
  pulsanteSparo.x = 100
  pulsanteSparo.y = 200
  return pulsanteSparo
end

return M
