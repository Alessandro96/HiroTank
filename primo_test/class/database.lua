require("sqlite3")
local M={}
local path = system.pathForFile("data.db", system.DocumentsDirectory)
db=sqlite3.open(path)

function M.writeDatabase(score, metri)
	local createTable = [[CREATE TABLE IF NOT EXISTS classifica (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
	db:exec(createTable)

	local contaRighe=[[CREATE VIEW IF NOT EXISTS contaRighe AS
											SELECT COUNT (*) as contatore FROM classifica;]]
	db:exec(contaRighe)

	for row in db:nrows("SELECT * FROM contaRighe") do
		if(row.contatore==0) then
			for i=1, 8, 1 do
				db:exec([[INSERT INTO classifica VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
			end
		end
	end

	local query=[[INSERT INTO classifica VALUES(null,]].. score..[[, ]]..metri..[[);]]
	db:exec(query)
end

function M.readDatabase()
	local widget=require("widget")
	local cont = 1
	local tableInfo = {}

	local createTable = [[CREATE TABLE IF NOT EXISTS classifica (id INTEGER PRIMARY KEY autoincrement, punteggio INTEGER, distanza INTEGER);]]
	db:exec(createTable)

	local ordinaClassifica=[[CREATE VIEW IF NOT EXISTS ordineDistanza AS
						    						SELECT punteggio, distanza FROM classifica
						    						ORDER BY distanza DESC;]]
	db:exec(ordinaClassifica)

	local contaRighe=[[CREATE VIEW IF NOT EXISTS contaRighe AS
											SELECT COUNT (*) as contatore FROM classifica;]]
	db:exec(contaRighe)

	for row in db:nrows("SELECT * FROM contaRighe") do
		if(row.contatore==0) then
			for i=1, 8, 1 do
				db:exec([[INSERT INTO classifica VALUES(null,]].. (i*10-i+2)..[[, ]]..(i*100)..[[);]])
			end
		end
	end

	for row in db:nrows("SELECT * FROM ordineDistanza") do
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

return M
