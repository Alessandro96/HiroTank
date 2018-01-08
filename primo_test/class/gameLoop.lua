local M = {}

function M.loop(aereo, aereiTable, bombeTable, camera, corpoCarrarmato)

	aereo.creaAereo(aereiTable, camera, corpoCarrarmato)

	for i = #aereiTable, 1, -1 do
		local thisAereo = aereiTable[i]

		if ( thisAereo.x < -100 or
			 thisAereo.x > display.contentWidth + 100 or
			 thisAereo.y < -100 or
			 thisAereo.y > display.contentHeight + 100 )
		then
			display.remove( thisAereo )
			table.remove( aereiTable, i )
		end
	end

	for i = #bombeTable, 1, -1 do
		local thisBomba = bombeTable[i]

		if (thisBomba.x <-100 or
			thisBomba.x > display.contentWidth + 100 or
			thisBomba.y < -100 or
			thisBomba.y > display.contentHeight + 100 )
		then
			display.remove(thisBomba)
			table.remove(bombeTable, i)
		end
	end
end

return M
