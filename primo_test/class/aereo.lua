local M = {}

function M.creaAereo(aereiTable, camera, corpoCarrarmato)
	local scaleFactor = 1.0
  local physicsData = (require "images.aereo").physicsData(scaleFactor)
  local newAereo = display.newImage("images/aereo.png")
	table.insert( aereiTable, newAereo )
  physics.addBody(newAereo, "dynamic", physicsData:get("aereo") )
	newAereo.myName = "aereo"
	newAereo.x = corpoCarrarmato.x+1200
	newAereo.y = corpoCarrarmato.y-390
	newAereo.gravityScale=0
	newAereo:setLinearVelocity(-300,0 )
	camera:add(newAereo,1,false)
end

function M.fire(aereiTable, bombeTable, camera)
	if(#aereiTable>=1) then
		for i=1, #aereiTable, 1 do
			local newBomba = display.newImageRect("images/bomba.png", 30, 50 )
			physics.addBody(newBomba, "dynamic", {isSensor=true})
			table.insert(bombeTable, newBomba)
			newBomba.isBullet = true
			newBomba.myName = "bomba"
			newBomba.x = aereiTable[i].x
			newBomba.y = aereiTable[i].y + 60
			camera:add(newBomba,1,false)
		end
	end
end

return M
