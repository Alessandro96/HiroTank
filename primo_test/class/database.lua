require("sqlite3")
local composer = require("composer")
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
	if(composer.getVariable("newGame")==1) then
		local query=[[INSERT INTO classificaT1 VALUES(null,]]..score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)

	elseif(composer.getVariable("newGame")==2) then
		local query=[[INSERT INTO classificaT2 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)

	elseif(composer.getVariable("newGame")==3) then
		local query=[[INSERT INTO classificaT3 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)

	elseif(composer.getVariable("newGame")==4) then
		local query=[[INSERT INTO classificaT4 VALUES(null,]].. score..[[, ]]..metri..[[, ']]..nome..[[' );]]
		db:exec(query)
	end
	if ( db and db:isopen() ) then
    db:close()
	end
end

function M.readDatabase()

	local path
	local db

	local widget=require("widget")
	local cont = 1
	local tableInfo = {}

	if(composer.getVariable("newGame")==1) then
		path = system.pathForFile("data.db", system.DocumentsDirectory)
		db=sqlite3.open(path)

		for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, "Manga.otf", 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, "Manga.otf", 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, "Manga.otf", 80)
			local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, "Manga.otf", 80)
			rowTextIndice:setFillColor(101/255,67/255,33/255)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextNome:setFillColor(101/255,67/255,33/255)
			rowTextNome.anchorX =0
			rowTextNome.x=300
			rowTextNome.y = rowHeight*0.5
			rowTextDistanza:setFillColor(101/255,67/255,33/255)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2+120
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(101/255,67/255,33/255)
			rowTextPunteggio.anchorX =0.5
			rowTextPunteggio.x=row.contentWidth-350
			rowTextPunteggio.y = rowHeight*0.5
		end

		local tableView = widget.newTableView({
			hideBackground = true,
			height = display.contentHeight-300,
			width = display.contentWidth,
			y=display.contentCenterY,
			x=display.contentCenterX,
			onRowRender=onRowRender
		})

		for i=1, cont-1, 1 do
			tableView:insertRow{
				rowHeight=70,
				rowColor = {default = {255,255,255,0}, over = {255,255,255,0}},
				lineColor = {101/255,67/255,33/255}
			}
		end
		if ( db and db:isopen() ) then
    	db:close()
		end
		return tableView

	elseif(composer.getVariable("newGame")==2) then
		path = system.pathForFile("data.db", system.DocumentsDirectory)
		db=sqlite3.open(path)

		for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, "Manga.otf", 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, "Manga.otf", 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, "Manga.otf", 80)
			local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, "Manga.otf", 80)
			rowTextIndice:setFillColor(0/255,49/255,83/255)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextNome:setFillColor(0/255,49/255,83/255)
			rowTextNome.anchorX =0
			rowTextNome.x=300
			rowTextNome.y = rowHeight*0.5
			rowTextDistanza:setFillColor(0/255,49/255,83/255)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2+120
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(0/255,49/255,83/255)
			rowTextPunteggio.anchorX =0.5
			rowTextPunteggio.x=row.contentWidth-350
			rowTextPunteggio.y = rowHeight*0.5
		end

		local tableView = widget.newTableView{
			hideBackground = true,
		  height = display.contentHeight-300,
			width = display.contentWidth,
			y=display.contentCenterY,
			x=display.contentCenterX,
			onRowRender=onRowRender
		}

		for i=1, cont-1, 1 do
			tableView:insertRow{
				rowHeight=70,
				rowColor = {default = {255, 255, 255, 0}, over = {255, 255, 255, 0}},
				lineColor = {0/255,49/255,83/255}
			}
		end
		if ( db and db:isopen() ) then
    	db:close()
		end
		return tableView
	elseif(composer.getVariable("newGame")==3) then
		path = system.pathForFile("data.db", system.DocumentsDirectory)
		db=sqlite3.open(path)

		for row in db:nrows("SELECT * FROM ordineDistanzaT3") do
			tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
			cont=cont+1
		end

		function onRowRender(event)
			local row = event.row
			local rowHeight = row.contentHeight
			local rowWidth = row.contentWidth
			local rowTextIndice = display.newText(row, row.index..".",  0, 0, "Manga.otf", 80)
			local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, "Manga.otf", 80)
			local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, "Manga.otf", 80)
			local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, "Manga.otf", 80)
			rowTextIndice:setFillColor(49/255,0/255,98/255)
			rowTextIndice.anchorX =0
			rowTextIndice.x=200
			rowTextIndice.y = rowHeight*0.5
			rowTextNome:setFillColor(49/255,0/255,98/255)
			rowTextNome.anchorX =0
			rowTextNome.x=300
			rowTextNome.y = rowHeight*0.5
			rowTextDistanza:setFillColor(49/255,0/255,98/255)
			rowTextDistanza.anchorX =0.5
			rowTextDistanza.x=row.contentWidth/2+120
			rowTextDistanza.y = rowHeight*0.5
			rowTextPunteggio:setFillColor(49/255,0/255,98/255)
			rowTextPunteggio.anchorX =0.5
			rowTextPunteggio.x=row.contentWidth-350
			rowTextPunteggio.y = rowHeight*0.5
		end

		local tableView = widget.newTableView{
			hideBackground = true,
			height = display.contentHeight-300,
			width = display.contentWidth,
			y=display.contentCenterY,
			x=display.contentCenterX,
			onRowRender=onRowRender
		}
		for i=1, cont-1, 1 do
			tableView:insertRow{
				rowHeight=70,
				rowColor = {default = {255, 255, 255, 0}, over = {255, 255, 255, 0}},
				lineColor = {49/255,0/255,98/255},
			}
		end
		if ( db and db:isopen() ) then
    	db:close()
		end
		return tableView

	elseif(composer.getVariable("newGame")==4) then
			path = system.pathForFile("data.db", system.DocumentsDirectory)
			db=sqlite3.open(path)

			for row in db:nrows("SELECT * FROM ordineDistanzaT4") do
				tableInfo[cont]={distanza=row.distanza, punteggio=row.punteggio, nome=row.nome}
				cont=cont+1
			end

			function onRowRender(event)
				local row = event.row
				local rowHeight = row.contentHeight
				local rowWidth = row.contentWidth
				local rowTextIndice = display.newText(row, row.index..".",  0, 0, "Manga.otf", 80)
				local rowTextDistanza = display.newText(row, tableInfo[row.index].distanza, 0, 0, "Manga.otf", 80)
				local rowTextPunteggio = display.newText(row, tableInfo[row.index].punteggio, 0, 0, "Manga.otf", 80)
				local rowTextNome = display.newText(row, tableInfo[row.index].nome, 0, 0, "Manga.otf", 80)
				rowTextIndice:setFillColor(224/255,1,1)
				rowTextIndice.anchorX =0
				rowTextIndice.x=200
				rowTextIndice.y = rowHeight*0.5
				rowTextNome:setFillColor(224/255,1,1)
				rowTextNome.anchorX =0
				rowTextNome.x=300
				rowTextNome.y = rowHeight*0.5
				rowTextDistanza:setFillColor(224/255,1,1)
				rowTextDistanza.anchorX =0.5
				rowTextDistanza.x=row.contentWidth/2+120
				rowTextDistanza.y = rowHeight*0.5
				rowTextPunteggio:setFillColor(224/255,1,1)
				rowTextPunteggio.anchorX =0.5
				rowTextPunteggio.x=row.contentWidth-350
				rowTextPunteggio.y = rowHeight*0.5
			end

			local tableView = widget.newTableView{
				hideBackground = true,
			  height = display.contentHeight-300,
		    width = display.contentWidth,
				y=display.contentCenterY,
				x=display.contentCenterX,
				onRowRender=onRowRender
			}

			for i=1, cont-1, 1 do
				tableView:insertRow{
					rowHeight=70,
					rowColor = {default = {255, 255, 255, 0}, over = {255, 255, 255, 0}},
					lineColor = {224/255,1,1}
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

	if(composer.getVariable("newGame")==1) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT1") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	elseif(composer.getVariable("newGame")==2) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT2") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	elseif(composer.getVariable("newGame")==3) then
		for row in db:nrows("SELECT * FROM ordineDistanzaT3") do
			primaPosizione.distanza=row.distanza
			break
		end
		for row in db:nrows("SELECT * FROM ordinePunteggioT3") do
			primaPosizione.punteggio=row.punteggio
			break
		end
	elseif(composer.getVariable("newGame")==4) then
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

function M.sbloccaMappe()

	local sbloccoMappe = {sbloccoM2=false, sbloccoM3=false, sbloccoM4=false}

	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db=sqlite3.open(path)

	for row in db:nrows("SELECT * FROM ordineDistanzaT1") do
		if(row.distanza>=300 and row.punteggio>=150)then
			sbloccoMappe.sbloccoM2=true
			break
		end
	end

	for row in db:nrows("SELECT * FROM ordineDistanzaT2") do
		if(row.distanza>=400 and row.punteggio>=200)then
			sbloccoMappe.sbloccoM3=true
			break
		end
	end

	for row in db:nrows("SELECT * FROM ordineDistanzaT3")  do
		if(row.distanza>=500 and row.punteggio>=250)then
			sbloccoMappe.sbloccoM4=true
			break
		end
	end

	return sbloccoMappe
end

return M
