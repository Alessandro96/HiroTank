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

return M
