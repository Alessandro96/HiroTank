local M = {}

function M.onCollision(event, aereiTable,  tank)

	if ( event.phase == "began" ) then

		local obj1 = event.object1
		local obj2 = event.object2


		if ( ( obj1.myName == "colpoCarro" and obj2.myName == "aereo" ) or
			 ( obj1.myName == "aereo" and obj2.myName == "colpoCarro" ) )
		then
			-- Remove both the laser and asteroid
			display.remove( obj1 )
			display.remove( obj2 )

			for i = #aereiTable, 1, -1 do
				if ( aereiTable[i] == obj1 or aereiTable[i] == obj2 ) then
					table.remove( aereiTable, i )
					break
				end
			end

			-- Increase score
			--score = score + 10
			--scoreText.text = "Score: " .. score

		elseif ( ( obj1.myName == "tank" and obj2.myName == "bomba" ) or
				 ( obj1.myName == "bomba" and obj2.myName == "tank" ) )
		then

				--life = life - 20
				--lifeText.text = "Life: " .. life

				--if ( life == 0 ) then
					--endGame()
      tank:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1))
		end
	end
end

return M
