local M = {}

function M.loop(aereo, aereiTable, bombeTable, camera, corpoCarrarmato, position)

	aereo.creaAereo(aereiTable, camera, corpoCarrarmato)	

	for i = #aereiTable, 1, -1 do
		local thisAereo = aereiTable[i]

		if ( thisAereo.x < -100000 or
			 thisAereo.x > display.contentWidth + 100000 or
			 thisAereo.y < -100000 or
			 thisAereo.y > display.contentHeight + 100000 )
		then
			display.remove( thisAereo )
			table.remove( aereiTable, i )
		end
	end

	for i = #bombeTable, 1, -1 do
		local thisBomba = bombeTable[i]

		if (thisBomba.x <-1000 or
			thisBomba.x > display.contentWidth + 1000 or
			thisBomba.y < -1000 or
			thisBomba.y > display.contentHeight + 1000 )
		then
			display.remove(thisBomba)
			table.remove(bombeTable, i)
		end
	end

	
end

function M.loop2(aereo2, aereiTable, camera, corpoCarrarmato, metri)
	
	if (metri > 380) then
	aereo2.creaAereo2(aereiTable, camera, corpoCarrarmato)
	
	for i = #aereiTable, 1, -1 do
		
		local thisAereo = aereiTable[i]

		if ( thisAereo.x < -300000 or
			 thisAereo.x > display.contentWidth + 300000 or
			 thisAereo.y < -300000 or
			 thisAereo.y > display.contentHeight + 300000 )
		then
			display.remove( thisAereo )
			table.remove( aereiTable, i )
		end
	end
	end
	
end



return M
