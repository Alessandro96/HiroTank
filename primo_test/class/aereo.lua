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

function M.creaAereo2(aereiTable2, camera, corpoCarrarmato)
  local scaleFactor = 1.0
  local physicsData = (require "images.aereo2").physicsData(scaleFactor)
  local newAereo2 = display.newImage("images/aereo2.png")
  table.insert( aereiTable2, newAereo2 )
  physics.addBody(newAereo2, "dynamic", physicsData:get("aereo2") )
  newAereo2.myName = "aereo2"
  newAereo2.x = corpoCarrarmato.x+1200
  newAereo2.y = corpoCarrarmato.y-390
  newAereo2.gravityScale=0
  newAereo2:setLinearVelocity(-300,0 )
  camera:add(newAereo2,1,false)
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

function M.fire2(aereiTable2, bombeTable2, camera)
	if(#aereiTable2>=1) then
		for i=1, #aereiTable2, 1 do
			local newBomba2 = display.newImageRect("images/bomba2.png", 30, 50 )
			physics.addBody(newBomba2, "dynamic", {isSensor=true})
			table.insert(bombeTable2, newBomba2)
			newBomba2.isBullet = true
			newBomba2.myName = "bomba2"
			newBomba2.x = aereiTable[i].x
			newBomba2.y = aereiTable[i].y + 60
			camera:add(newBomba2,1,false)
		end
	end
end

return M
