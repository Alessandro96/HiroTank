require("sqlite3")
local M={}
local path = system.pathForFile("data.db", system.DocumentsDirectory)
local db=sqlite3.open(path)

function M.writeDatabase(score, metri)
	if(newGame==1) then
		local classificaT1 = [[CREATE TABLE IF NOT EXISTS classificaT1 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
		db:exec(classificaT1)

		local contaRigheT1=[[CREATE VIEW IF NOT EXISTS contaRigheT1 AS
												SELECT COUNT (*) as contatore FROM classificaT1;]]
		db:exec(contaRigheT1)

		for row in db:nrows("SELECT * FROM contaRigheT1") do
			if(row.contatore==0) then
				for i=1, 8, 1 do
					db:exec([[INSERT INTO classificaT1 VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
				end
			end
		end
		if(score>maxT1.punteggio)then
			maxT1.punteggio=score
		end
		if(metri>maxT1.distanza)then
			maxT1.distanza=metri
		end
		local query=[[INSERT INTO classificaT1 VALUES(null,]].. score..[[, ]]..metri..[[);]]
		db:exec(query)

	elseif(newGame==2) then
		local classificaT2 = [[CREATE TABLE IF NOT EXISTS classificaT2 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
		db:exec(classificaT2)

		local contaRigheT2=[[CREATE VIEW IF NOT EXISTS contaRigheT2 AS
												SELECT COUNT (*) as contatore FROM classificaT2;]]
		db:exec(contaRigheT2)

		for row in db:nrows("SELECT * FROM contaRigheT2") do
			if(row.contatore==0) then
				for i=1, 8, 1 do
					db:exec([[INSERT INTO classificaT2 VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
				end
			end
		end

		if(score>maxT2.punteggio)then
			maxT2.punteggio=score
		end
		if(metri>maxT2.distanza)then
			maxT2.distanza=metri
		end
		local query=[[INSERT INTO classificaT2 VALUES(null,]].. score..[[, ]]..metri..[[);]]
		db:exec(query)
	elseif(newGame==3) then
		local classificaT3 = [[CREATE TABLE IF NOT EXISTS classificaT3 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
		db:exec(classificaT3)

		local contaRigheT3=[[CREATE VIEW IF NOT EXISTS contaRigheT3 AS
												SELECT COUNT (*) as contatore FROM classificaT3;]]
		db:exec(contaRigheT3)

		for row in db:nrows("SELECT * FROM contaRigheT3") do
			if(row.contatore==0) then
				for i=1, 8, 1 do
					db:exec([[INSERT INTO classificaT3 VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
				end
			end
		end
		if(score>maxT3.punteggio)then
			maxT3.punteggio=score
		end
		if(metri>maxT3.distanza)then
			maxT3.distanza=metri
		end
		local query=[[INSERT INTO classificaT3 VALUES(null,]].. score..[[, ]]..metri..[[);]]
		db:exec(query)
	end
end

function M.readDatabase()
	local widget=require("widget")
	local cont = 1
	local tableInfo = {}

	if(selezioneClassifica==1) then
		local classificaT1 = [[CREATE TABLE IF NOT EXISTS classificaT1 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
		db:exec(classificaT1)

		local ordinaClassificaT1=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT1 AS
							    						SELECT punteggio, distanza FROM classificaT1
							    						ORDER BY distanza DESC;]]
		db:exec(ordinaClassificaT1)

		local contaRigheT1=[[CREATE VIEW IF NOT EXISTS contaRigheT1 AS
												SELECT COUNT (*) as contatore FROM classificaT1;]]
		db:exec(contaRigheT1)

		for row in db:nrows("SELECT * FROM contaRigheT1") do
			if(row.contatore==0) then
				for i=1, 8, 1 do
					db:exec([[INSERT INTO classificaT1 VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
				end
			end
		end

		for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
			rowTextIndice:setFillColor(1,0,0)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextDistanza:setFillColor(1,0,0)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2-70
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(1,0,0)
			rowTextPunteggio.anchorX =1
			rowTextPunteggio.x=row.contentWidth-300
			rowTextPunteggio.y = rowHeight*0.5
		end

		local tableView = widget.newTableView{
		  height = display.contentHeight-300,
	    width = display.contentWidth,
			y=display.contentCenterY,
			x=display.contentCenterX,
			onRowRender=onRowRender
		}
		for i=1, cont-1, 1 do
			tableView:insertRow{
				rowHeight=70
			}
		end
		return tableView

	elseif(selezioneClassifica==2) then
		local classificaT2 = [[CREATE TABLE IF NOT EXISTS classificaT2 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
		db:exec(classificaT2)

		local ordinaClassificaT2=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT2 AS
							    						SELECT punteggio, distanza FROM classificaT2
							    						ORDER BY distanza DESC;]]
		db:exec(ordinaClassificaT2)

		local contaRigheT2=[[CREATE VIEW IF NOT EXISTS contaRigheT2 AS
												SELECT COUNT (*) as contatore FROM classificaT2;]]
		db:exec(contaRigheT2)

		for row in db:nrows("SELECT * FROM contaRigheT2") do
			if(row.contatore==0) then
				for i=1, 8, 1 do
					db:exec([[INSERT INTO classificaT2 VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
				end
			end
		end

		for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
			rowTextIndice:setFillColor(1,0,0)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextDistanza:setFillColor(1,0,0)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2-70
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(1,0,0)
			rowTextPunteggio.anchorX =1
			rowTextPunteggio.x=row.contentWidth-300
			rowTextPunteggio.y = rowHeight*0.5
		end

		local tableView = widget.newTableView{
		  height = display.contentHeight-300,
	    width = display.contentWidth,
			y=display.contentCenterY,
			x=display.contentCenterX,
			onRowRender=onRowRender
		}
		for i=1, cont-1, 1 do
			tableView:insertRow{
				rowHeight=70
			}
		end
		return tableView
	elseif(selezioneClassifica==3) then
		local classificaT3 = [[CREATE TABLE IF NOT EXISTS classificaT3 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
		db:exec(classificaT3)

		local ordinaClassificaT3=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT3 AS
															SELECT punteggio, distanza FROM classificaT3
															ORDER BY distanza DESC;]]
		db:exec(ordinaClassificaT3)

		local contaRigheT3=[[CREATE VIEW IF NOT EXISTS contaRigheT3 AS
												SELECT COUNT (*) as contatore FROM classificaT3;]]
		db:exec(contaRigheT3)

		for row in db:nrows("SELECT * FROM contaRigheT3") do
			if(row.contatore==0) then
				for i=1, 8, 1 do
					db:exec([[INSERT INTO classificaT3 VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
				end
			end
		end

		for row in db:nrows("SELECT * FROM ordineDistanzaT3") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
			rowTextIndice:setFillColor(1,0,0)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextDistanza:setFillColor(1,0,0)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2-70
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(1,0,0)
			rowTextPunteggio.anchorX =1
			rowTextPunteggio.x=row.contentWidth-300
			rowTextPunteggio.y = rowHeight*0.5
		end

		local tableView = widget.newTableView{
			height = display.contentHeight-300,
			width = display.contentWidth,
			y=display.contentCenterY,
			x=display.contentCenterX,
			onRowRender=onRowRender
		}
		for i=1, cont-1, 1 do
			tableView:insertRow{
				rowHeight=70
			}
		end
		return tableView
	end
end

return M
