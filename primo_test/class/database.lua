require("sqlite3")
local M={}

function M.createDatabase()

	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db=sqlite3.open(path)

	local classificaT1 = [[CREATE TABLE IF NOT EXISTS classificaT1 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER, nome);]]
	db:exec(classificaT1)

	local contaRigheT1=[[CREATE VIEW IF NOT EXISTS contaRigheT1 AS SELECT COUNT (*) as contatore FROM classificaT1;]]
	db:exec(contaRigheT1)

	local ordinaClassificaT1=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT1 AS	SELECT punteggio, distanza, nome FROM classificaT1	ORDER BY distanza DESC;]]
	db:exec(ordinaClassificaT1)

	local ordinaClassificaPunteggioT1 = [[CREATE VIEW IF NOT EXISTS ordinePunteggioT1 AS	SELECT punteggio, distanza, nome FROM classificaT1	ORDER BY punteggio DESC;]]
	db:exec(ordinaClassificaPunteggioT1)

	local classificaT2 = [[CREATE TABLE IF NOT EXISTS classificaT2 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER, nome);]]
	db:exec(classificaT2)

	local contaRigheT2=[[CREATE VIEW IF NOT EXISTS contaRigheT2 AS	SELECT COUNT (*) as contatore FROM classificaT2;]]
	db:exec(contaRigheT2)

	local ordinaClassificaT2=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT2 AS	SELECT punteggio, distanza, nome FROM classificaT2	ORDER BY distanza DESC;]]
	db:exec(ordinaClassificaT2)

	local ordinaClassificaPunteggioT2 = [[CREATE VIEW IF NOT EXISTS ordinePunteggioT2 AS	SELECT punteggio, distanza, nome FROM classificaT2	ORDER BY punteggio DESC;]]
	db:exec(ordinaClassificaPunteggioT2)

	local classificaT3 = [[CREATE TABLE IF NOT EXISTS classificaT3 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER, nome);]]
	db:exec(classificaT3)

	local contaRigheT3=[[CREATE VIEW IF NOT EXISTS contaRigheT3 AS	SELECT COUNT (*) as contatore FROM classificaT3;]]
	db:exec(contaRigheT3)

	local ordinaClassificaT3=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT3 AS	SELECT punteggio, distanza, nome FROM classificaT3	ORDER BY distanza DESC;]]
	db:exec(ordinaClassificaT3)

	local ordinaClassificaPunteggioT3 = [[CREATE VIEW IF NOT EXISTS ordinePunteggioT3 AS	SELECT punteggio, distanza, nome FROM classificaT3	ORDER BY punteggio DESC;]]
	db:exec(ordinaClassificaPunteggioT3)

	local classificaT4 = [[CREATE TABLE IF NOT EXISTS classificaT4 (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER, nome);]]
	db:exec(classificaT4)

	local contaRigheT4=[[CREATE VIEW IF NOT EXISTS contaRigheT4 AS	SELECT COUNT (*) as contatore FROM classificaT4;]]
	db:exec(contaRigheT4)

	local ordinaClassificaT4=[[CREATE VIEW IF NOT EXISTS ordineDistanzaT4 AS	SELECT punteggio, distanza, nome FROM classificaT4	ORDER BY distanza DESC;]]
	db:exec(ordinaClassificaT4)

	local ordinaClassificaPunteggioT4 = [[CREATE VIEW IF NOT EXISTS ordinePunteggioT4 AS	SELECT punteggio, distanza, nome FROM classificaT4	ORDER BY punteggio DESC;]]
	db:exec(ordinaClassificaPunteggioT4)

	for row in db:nrows("SELECT * FROM contaRigheT1") do
		if(row.contatore==0) then
			db:exec([[INSERT INTO classificaT1 VALUES(null,]].. (0)..[[, ]]..(0)..[[, "lorenzo");]])
		end
	end

	for row in db:nrows("SELECT * FROM contaRigheT2") do
		if(row.contatore==0) then
			db:exec([[INSERT INTO classificaT2 VALUES(null,]]..(0)..[[, ]]..(0)..[[, "lorenzo");]])
		end
	end

	for row in db:nrows("SELECT * FROM contaRigheT3") do
		if(row.contatore==0) then
			db:exec([[INSERT INTO classificaT3 VALUES(null,]]..(0)..[[, ]]..(0)..[[, "lorenzo");]])
		end
	end

	for row in db:nrows("SELECT * FROM contaRigheT4") do
		if(row.contatore==0) then
			db:exec([[INSERT INTO classificaT4 VALUES(null,]]..(0)..[[, ]]..(0)..[[, "lorenzo");]])
		end
	end

	if ( db and db:isopen() ) then
    db:close()
	end
end

function M.writeDatabase(score, metri, nome)

	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db=sqlite3.open(path)
	if(newGame==1) then
		local query=[[INSERT INTO classificaT1 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)

	elseif(newGame==2) then
		local query=[[INSERT INTO classificaT2 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)

	elseif(newGame==3) then
		local query=[[INSERT INTO classificaT3 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)

	elseif(newGame==4) then
		local query=[[INSERT INTO classificaT4 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)
	end
	if ( db and db:isopen() ) then
    db:close()
	end
end

function M.readDatabase()

	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db=sqlite3.open(path)

	local widget=require("widget")
	local cont = 1
	local tableInfo = {}

	if(selezioneClassifica==1) then

		for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
			local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, native.systemFont, 80)
			rowTextIndice:setFillColor(1,0,0)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextNome:setFillColor(1,0,0)
			rowTextNome.anchorX =0
			rowTextNome.x=300
			rowTextNome.y = rowHeight*0.5
			rowTextDistanza:setFillColor(1,0,0)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2+120
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(1,0,0)
			rowTextPunteggio.anchorX =0.5
			rowTextPunteggio.x=row.contentWidth-350
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
		if ( db and db:isopen() ) then
    	db:close()
		end
		return tableView

	elseif(selezioneClassifica==2) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
			local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, native.systemFont, 80)
			rowTextIndice:setFillColor(1,0,0)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextNome:setFillColor(1,0,0)
			rowTextNome.anchorX =0
			rowTextNome.x=300
			rowTextNome.y = rowHeight*0.5
			rowTextDistanza:setFillColor(1,0,0)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2+120
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(1,0,0)
			rowTextPunteggio.anchorX =0.5
			rowTextPunteggio.x=row.contentWidth-350
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
		if ( db and db:isopen() ) then
    	db:close()
		end
		return tableView
	elseif(selezioneClassifica==3) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT3") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
			local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, native.systemFont, 80)
			rowTextIndice:setFillColor(1,0,0)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextNome:setFillColor(1,0,0)
			rowTextNome.anchorX =0
			rowTextNome.x=300
			rowTextNome.y = rowHeight*0.5
			rowTextDistanza:setFillColor(1,0,0)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2+120
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(1,0,0)
			rowTextPunteggio.anchorX =0.5
			rowTextPunteggio.x=row.contentWidth-350
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
		if ( db and db:isopen() ) then
    	db:close()
		end
		return tableView

	elseif(selezioneClassifica==4) then

			for row in db:nrows("SELECT * FROM ordineDistanzaT4") do
				tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
				cont=cont+1
			end

			function onRowRender(event)
				local row = event.row
				local rowHeight = row.contentHeight
				local rowWidth = row.contentWidth
				local rowTextIndice = display.newText(row, row.index..".",  0, 0, native.systemFont, 80)
				local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, native.systemFont, 80)
				local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, native.systemFont, 80)
				local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, native.systemFont, 80)
				rowTextIndice:setFillColor(1,0,0)
				rowTextIndice.anchorX =0
				rowTextIndice.x=200
				rowTextIndice.y = rowHeight*0.5
				rowTextNome:setFillColor(1,0,0)
				rowTextNome.anchorX =0
				rowTextNome.x=300
				rowTextNome.y = rowHeight*0.5
				rowTextDistanza:setFillColor(1,0,0)
				rowTextDistanza.anchorX =0.5
				rowTextDistanza.x=row.contentWidth/2+120
				rowTextDistanza.y = rowHeight*0.5
				rowTextPunteggio:setFillColor(1,0,0)
				rowTextPunteggio.anchorX =0.5
				rowTextPunteggio.x=row.contentWidth-350
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
			if ( db and db:isopen() ) then
	    	db:close()
			end
			return tableView
	end
end

function M.aggiornaPunteggiMax(maxT1Punteggio, maxT2Punteggio, maxT3Punteggio, maxT4Punteggio, maxT1Distanza, maxT2Distanza, maxT3Distanza, maxT4Distanza)

	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db=sqlite3.open(path)

	for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
		maxT1Distanza.text=" "..row.distanza
		break
	end

	for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
		maxT2Distanza.text=" "..row.distanza
		break
	end

	for row in db:nrows("SELECT * FROM ordineDistanzaT3") do
		maxT3Distanza.text=" "..row.distanza
		break
	end

	for row in db:nrows("SELECT * FROM ordineDistanzaT4") do
		maxT4Distanza.text=" "..row.distanza
		break
	end

	for row in db:nrows("SELECT * FROM ordinePunteggioT1") do
		maxT1Punteggio.text=" "..row.punteggio
		break
	end

	for row in db:nrows("SELECT * FROM ordinePunteggioT2") do
		maxT2Punteggio.text=" "..row.punteggio
		break
	end

	for row in db:nrows("SELECT * FROM ordinePunteggioT3") do
		maxT3Punteggio.text=" "..row.punteggio
		break
	end

	for row in db:nrows("SELECT * FROM ordinePunteggioT4") do
		maxT4Punteggio.text=" "..row.punteggio
		break
	end

	if ( db and db:isopen() ) then
    db:close()
	end
end

function M.primoInClassifica()

	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db=sqlite3.open(path)

	local primaPosizione = {distanza=0, punteggio=0}

	if(newGame==1) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT1") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	elseif(newGame==2) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT2") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	elseif(newGame==3) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT3") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT3") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	elseif(newGame==4) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT4") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT4") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	end
	if ( db and db:isopen() ) then
    db:close()
	end
	return primaPosizione
end

return M
