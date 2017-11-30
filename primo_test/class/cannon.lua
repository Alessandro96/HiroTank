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
  local pulsanteDx = display.newImageRect("images/bottone.png", 75, 75)
  pulsanteDx.x = display.screenOriginX + pulsanteDx.contentWidth + 253
  pulsanteDx.y = display.contentHeight - pulsanteDx.contentHeight - 150
  return pulsanteDx
end

function M.pulsanteSx()
  local pulsanteSx = display.newImageRect("images/bottone.png", 75, 75)
  pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth+15
    pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 150
  return pulsanteSx
end

function M.pulsanteSparo()
  local pulsanteSparo = display.newImage("images/missile2.png")
  pulsanteSparo.x = display.screenOriginX + pulsanteSparo.contentWidth+130
  pulsanteSparo.y = display.contentHeight - pulsanteSparo.contentHeight - 90
  return pulsanteSparo
end

return M
