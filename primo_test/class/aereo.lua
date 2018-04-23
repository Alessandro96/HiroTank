local M = {}

function M.creaAereo(aereiTable, camera, corpoCarrarmato)
  local scaleFactor = 1.0
  local physicsData = (require "images.aereo").physicsData(scaleFactor)
  local newAereo = display.newImage("images/aereo.png")
  table.insert( aereiTable, newAereo )
  physics.addBody(newAereo, "dynamic", physicsData:get("aereo") )
  newAereo.myName = "aereo"
  newAereo.x = corpoCarrarmato.x+1200
  newAereo.y = display.screenOriginY+320
  newAereo.gravityScale=0
  newAereo:setLinearVelocity(-300,0 )
  camera:add(newAereo,1,false)
end

function M.creaAereo2(aereiTable, camera, corpoCarrarmato)
  local scaleFactor = 1.0
  local physicsData = (require "images.aereo2").physicsData(scaleFactor)
  local newAereo2 = display.newImage("images/aereo2.png")
  newAereo2.v1 = display.newImageRect("images/teschio.png", 50 , 50)
  physics.addBody(newAereo2.v1, "dynamic")
  newAereo2.v2 = display.newImageRect("images/teschio.png", 50 , 50)
  physics.addBody(newAereo2.v2, "dynamic")
  newAereo2.vita = 2
  table.insert( aereiTable, newAereo2 )
  physics.addBody(newAereo2, "dynamic", physicsData:get("aereo2") )
  newAereo2.myName = "aereo2"
  newAereo2.x = corpoCarrarmato.x+2000
  newAereo.y = display.screenOriginY+320
  newAereo2.gravityScale=0
  newAereo2:setLinearVelocity(-300,0 )
  newAereo2.v1.x = newAereo2.x - 50
  newAereo2.v1.y = newAereo2.y - 70
  newAereo2.v1.gravityScale=0
  newAereo2.v1:setLinearVelocity(-300,0 )
  newAereo2.v2.x = newAereo2.x + 50
  newAereo2.v2.y = newAereo2.y - 70
  newAereo2.v2.gravityScale=0
  newAereo2.v2:setLinearVelocity(-300,0 )
  camera:add(newAereo2,1,false)
  camera:add(newAereo2.v1,1,false)
  camera:add(newAereo2.v2,1,false)
end



function M.fire(aereiTable, bombeTable, camera)
	if(#aereiTable>=1) then
		for i=1, #aereiTable, 1 do
      if(aereiTable[i].myName=="aereo") then
			local newBomba = display.newImageRect("images/bomba.png", 30, 50 )
			physics.addBody(newBomba, "dynamic", {isSensor=true})
			table.insert(bombeTable, newBomba)
			newBomba.isBullet = true
			newBomba.myName = "bomba"
			newBomba.x = aereiTable[i].x
			newBomba.y = aereiTable[i].y + 60
			camera:add(newBomba,1,false)

    elseif(aereiTable[i].myName=="aereo2") then
      local newBomba2 = display.newImageRect("images/bomba2.png", 30, 50 )
			physics.addBody(newBomba2, "dynamic", {isSensor=true})
			table.insert(bombeTable, newBomba2)
			newBomba2.isBullet = true
			newBomba2.myName = "bomba2"
			newBomba2.x = aereiTable[i].x
			newBomba2.y = aereiTable[i].y + 60
			camera:add(newBomba2,1,false)
		end
		end
	end
end



return M
