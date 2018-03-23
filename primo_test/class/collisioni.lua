local sounds = require('lib.sounds')
local M = {}
hit = 0
function M.onCollision(event, aereiTable, bombeTable, tank)

	if ( event.phase == "began" ) then

		local obj1 = event.object1
		local obj2 = event.object2



		if ( ( obj1.myName == "colpoCarro" and obj2.myName == "aereo" ) or
			 ( obj1.myName == "aereo" and obj2.myName == "colpoCarro" ) )
		then
			sounds.play('explosion', { channel=3})
			display.remove( obj1 )
			display.remove( obj2 )

			for i = #aereiTable, 1, -1 do
				if ( aereiTable[i] == obj1 or aereiTable[i] == obj2 ) then
					table.remove( aereiTable, i )
					break
				end
			end
			return 10

		elseif ( ( obj1.myName == "colpoCarro" and obj2.myName == "aereo2" ) or
				 ( obj1.myName == "aereo2" and obj2.myName == "colpoCarro" ) )
			then
				
				if(obj1.myName == "colpoCarro") then 
					display.remove( obj1 )
					obj2.vita = obj2.vita -1
					if (obj2.vita == 1) then
						display.remove(obj2.v2)
					elseif (obj2.vita == 0) then
						sounds.play('explosion', { channel=3})
						display.remove(obj2.v1)
					end
				elseif(obj2.myName == "colpoCarro") then 
					display.remove( obj2 )
					obj1.vita = obj1.vita -1
					if (obj1.vita == 1) then
						display.remove(obj1.v2)
					elseif (obj1.vita == 0) then
						sounds.play('explosion', { channel=3})
						display.remove(obj1.v1)
					end
				end

			  if (obj1.vita == 0 or obj2.vita == 0)  then
				display.remove( obj1 )
				display.remove( obj2 )
				sounds.play('explosion', { channel=3})
        
					for i = #aereiTable, 1, -1 do
						if ( aereiTable[i] == obj1 or aereiTable[i] == obj2 ) then
						--	print (aereiTable[i].vita)
							table.remove( aereiTable, i )
							break
						end
					end
				  end
				return 10

		elseif ( (obj1.myName == "bomba" and obj2.myName == "terreno" )or (obj1.myName == "terreno" and obj2.myName == "bomba" ) ) then

			if(obj2.myName=="bomba") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

		elseif ( (obj1.myName == "bomba2" and obj2.myName == "terreno" )or (obj1.myName == "terreno" and obj2.myName == "bomba2" ) ) then

			if(obj2.myName=="bomba2") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba2") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end


		elseif ( ( obj1.myName == "colpoCarro" and obj2.myName == "terreno" ) or
			 ( obj1.myName == "terreno" and obj2.myName == "colpoCarro" ) )
		 then
		    if(obj1.myName=="colpoCarro") then
			display.remove( obj1 )
			elseif (obj2.myName=="colpoCarro") then
			display.remove( obj2 )
		end

		elseif ( (obj1.myName == "hiro" and obj2.myName == "terreno" )or (obj2.myName == "hiro" and obj1.myName == "terreno" ) ) then

			if (obj1.myName == "hiro") then
				display.remove(obj1)
			else
			display.remove(obj2)
			end
			--tank.hiro:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return -1

		elseif (( obj1.myName == "tank" and obj2.myName == "bomba" ) or
		 				( obj2.myName == "tank" and obj1.myName == "bomba" )) then
			if(obj2.myName=="bomba") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

			--tank.corpo:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return 20

		elseif (( obj1.myName == "tank" and obj2.myName == "bomba2" ) or
						( obj2.myName == "tank" and obj1.myName == "bomba2" )) then
			if(obj2.myName=="bomba2") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba2") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

			--tank.corpo:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return 20

		elseif (( obj1.myName == "dietroCingolo" and obj2.myName == "bomba" ) or
						( obj2.myName == "dietroCingolo" and obj1.myName == "bomba" )) then
			if(obj2.myName=="bomba") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

			--tank.dietroCingolo:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return 20

		elseif (( obj1.myName == "dietroCingolo" and obj2.myName == "bomba2" ) or
						( obj2.myName == "dietroCingolo" and obj1.myName == "bomba2" )) then
			if(obj2.myName=="bomba2") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba2") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

			--tank.dietroCingolo:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return 20

		elseif (( obj1.myName == "davantiCingolo" and obj2.myName == "bomba" ) or
						( obj2.myName == "davantiCingolo" and obj1.myName == "bomba" )) then
			if(obj2.myName=="bomba") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

			--tank.davantiCingolo:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return 20

		elseif (( obj1.myName == "davantiCingolo" and obj2.myName == "bomba2" ) or
						( obj2.myName == "davantiCingolo" and obj1.myName == "bomba2" )) then
			if(obj2.myName=="bomba2") then
				display.remove(obj2)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj2) then
						table.remove(bombeTable, i)
						break
					end
				end
			elseif(obj1.myName=="bomba2") then
				display.remove(obj1)
				for i = #bombeTable, 1, -1 do
					if(bombeTable[i] == obj1) then
						table.remove(bombeTable, i)
						break
					end
				end
			end

			--tank.davantiCingolo:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
			return 20
		end
	end
end

return M
