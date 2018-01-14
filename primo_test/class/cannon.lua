--------------------------------------INIZIO------------------------------------

local M ={}

function M.newCannon(params)
  x = 0
  local cannon = display.newImageRect("images/cannone.png", 97, 10)
  cannon.x = params.corpoCarrarmato.x+40
  cannon.y = params.corpoCarrarmato.y-2
  physics.addBody( cannon, "dynamic", { density=0, friction=100, bounce=0, isSensor=true} )
  cannon.isFixedRotation = true
  cannon:scale(1.2,1.5)
  cannon.anchorX=0.953
  cannon.anchorY=0.5
  params.camera:add(cannon, 1, false)

  function cannon:setRotazione(cc,x)
	   cannon.rotation=c
	   print(x)
	   end
  return cannon
end



return M
