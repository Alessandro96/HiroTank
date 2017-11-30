local M = {}

function M.creaAereo(aereiTable, camera, aereiText)
	local newAereo = display.newImageRect("images/aereo.png", 450, 130 )
	table.insert( aereiTable, newAereo )
	physics.addBody(newAereo, "dynamic", {radius=200} )
	newAereo.myName = "aereo"
	newAereo.x = 2000
	newAereo.y = 430
	newAereo.gravityScale=0
	newAereo:setLinearVelocity(-300,0 )
	camera:add(newAereo,1,false)
end

function M.fire(aereiTable, bombeTable, camera, bombeText)
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
