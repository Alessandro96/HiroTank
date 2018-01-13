--------------------------------------INIZIO------------------------------------

local M ={}

function M.newCannon(params)
  local cannon = display.newImageRect("images/cannone.png", 97, 10)
  cannon.x = params.corpoCarrarmato.x+15
  cannon.y = params.corpoCarrarmato.y+20
  physics.addBody( cannon, "dynamic", { density=0, friction=100, bounce=0, isSensor=true} )
  cannon.anchorX=0.953
  cannon.anchorY=0.5
  cannon.rotation=0
  params.camera:add(cannon, 1, false)
  
  function cannon:setRotazione(x)
	cannon.rotation = x
	print(x)
  end
	
  return cannon
  
end



return M
