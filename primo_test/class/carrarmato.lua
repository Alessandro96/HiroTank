local l = {}

function l.newCingolo(camera)
  local m={}
  m.chain = {}
  m.quadro = {}
  m.chain2 = {}
  m.revoluteJoints = {}
  m.pivot = {}
  m.ruote = {}
  local cont
  m.revoluteJoint2 = {}

  local physics = require("physics")
  physics.start()
  physics.setGravity(0,9.8)

  --------------------------------------------------------------------------------
  ---CINGHIA SUPERIORE(CHAIN[], ROSSO) E INFERIORE(CHAIN2[], BLU)
  --------------------------------------------------------------------------------
  for i=15, 35, 1 do
  m.chain[i] = display.newCircle(10*i, display.contentCenterY-100, 5)
  m.chain[i]:setFillColor(0.2,0.2,0.2)
  physics.addBody(m.chain[i], "dynamic", {friction=100, density=2})
  camera:add(m.chain[i], 2, false)
  end

  for i=15, 35, 1 do
  m.chain2[i] = display.newCircle(10*i, display.contentCenterY-65, 5)
  m.chain2[i]:setFillColor(0.2,0.2,0.2)
  physics.addBody(m.chain2[i], "dynamic", {friction=100, density=2})
  camera:add(m.chain2[i], 2, false)
  end

  --------------------------------------------------------------------------------
  ---JOINT TRA I RETTANGOLI DELLE CINGHIE
  --------------------------------------------------------------------------------
  for i=15, 34, 1 do
  m.revoluteJoints[i]={
    chainSuperiore =
    {
      pivot1=physics.newJoint("pivot", m.chain[i], m.chain[i+1], m.chain[i].x, m.chain[i].y),
      pivot2=physics.newJoint("rope", m.chain[i], m.chain[i+1], 0, 0, 0, 0),
      pivot3=physics.newJoint("distance", m.chain[i], m.chain[i+1], m.chain[i].x, m.chain[i].y, m.chain[i+1].x, m.chain[i+1].y)
    },
    chainInferiore =
    {
      pivot1=physics.newJoint("pivot", m.chain2[i], m.chain2[i+1], m.chain2[i].x, m.chain2[i].y),
      pivot2=physics.newJoint("rope", m.chain2[i], m.chain2[i+1], 0, 0, 0, 0),
      pivot3=physics.newJoint("distance", m.chain2[i], m.chain2[i+1], m.chain2[i].x, m.chain2[i].y, m.chain2[i+1].x, m.chain2[i+1].y)
    }
  }
  end

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE RUOTE
  --------------------------------------------------------------------------------
  for i=2, 3, 1 do
  cont=i*10
  m.ruote[i]=display.newImageRect("images/wheel.png",80,80)
  physics.addBody(m.ruote[i], "dynamic", {friction=10, density=1,radius=25})
  m.ruote[i].x = m.chain[cont].x-4
  m.ruote[i].y = m.chain2[15].y-15
  m.ruote[i]:setFillColor(0.3,0.3,0.3)
  end

  m.ruote[1]=display.newImageRect("images/wheel.png",80,80)
  physics.addBody(m.ruote[1], "dynamic", {friction=10, density=1,radius=25})
  m.ruote[1].x = m.chain[15].x
  m.ruote[1].y = m.chain2[15].y-15
  m.ruote[1]:setFillColor(0.3,0.3,0.3)

  m.ruote[4]=display.newImageRect("images/wheel.png",80,80)
  physics.addBody(m.ruote[4], "dynamic", {friction=10, density=1,radius=25})
  m.ruote[4].x = m.chain[35].x-5
  m.ruote[4].y = m.chain2[15].y-15
  m.ruote[4]:setFillColor(0.3,0.3,0.3)

 -- m.ruote[5]=display.newCircle(m.chain[20].x+45, m.chain2[15].y-15, 18)
 --physics.addBody(m.ruote[5], "dynamic", {friction=10, density=1})
 --m.ruote[5]:setFillColor(0,1,0)

  for i=1, 4, 1 do
    camera:add(m.ruote[i], 2, true)
  end

  --m.ruote[1]:scale(1.3,1)
  --m.ruote[4]:scale(1.3,1)

  --------------------------------------------------------------------------------
  ---RETTANGOLO CHE COLLEGA LE RUOTE
  --------------------------------------------------------------------------------
  m.quadro[14] = display.newRect(((m.ruote[3].x+m.ruote[2].x)/2), m.ruote[2].y, (m.ruote[4].x-m.ruote[1].x), 10)
  physics.addBody(m.quadro[14], "dynamic", {isSensor=true})
  m.quadro[14]:setFillColor(0,0,0)
  camera:add(m.quadro[14], 7, true)
  for i=1, 4, 1 do
    m.revoluteJoints[47+i]=physics.newJoint("pivot", m.ruote[i], m.quadro[14], m.ruote[i].x, m.ruote[i].y)
  end
  for i=1, 3, 1 do
	m.revoluteJoints[52+i]=physics.newJoint("distance", m.ruote[i], m.ruote[i+1], m.ruote[i].x, m.ruote[i].y, m.ruote[i+1].x, m.ruote[i+1].y)
  end

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE RETTANGOLI LATERALI SINISTRA (BIANCHI)
  --------------------------------------------------------------------------------
  m.quadro[1] = display.newCircle(m.chain2[15].x-8, m.chain2[15].y, 5)
  physics.addBody(m.quadro[1], "dynamic", {friction=100, density=2})
  --quadro[1].rotation=30

  m.quadro[2] = display.newCircle(m.chain2[15].x-15, m.chain2[15].y-7, 5)
  physics.addBody(m.quadro[2], "dynamic", {friction=100, density=2})
  --quadro[2].rotation=60

  m.quadro[3] = display.newCircle(m.chain2[15].x-17, m.chain2[15].y-15, 5)
  physics.addBody(m.quadro[3], "dynamic", {friction=100, density=2})
  --quadro[3].rotation=90

  m.quadro[4] = display.newCircle(m.chain2[15].x-15, m.chain2[15].y-23, 5)
  physics.addBody(m.quadro[4], "dynamic", {friction=100, density=2})
  --quadro[4].rotation=120

  m.quadro[5] = display.newCircle(m.chain2[15].x-8, m.chain2[15].y-30, 5)
  physics.addBody(m.quadro[5], "dynamic", {friction=100, density=2})
  --quadro[5].rotation=150

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE RETTANGOLI LATERALI DESTRA (BIANCHI)
  --------------------------------------------------------------------------------

  m.quadro[7] = display.newCircle(m.chain2[35].x+8, m.chain2[35].y, 5)
  physics.addBody(m.quadro[7], "dynamic", {friction=100, density=2})
  --quadro[7].rotation=150

  m.quadro[8] = display.newCircle(m.chain2[35].x+15, m.chain2[35].y-7,  5)
  physics.addBody(m.quadro[8], "dynamic", {friction=100, density=2})
  --quadro[8].rotation=120

  m.quadro[9] = display.newCircle(m.chain2[35].x+17, m.chain2[35].y-15, 5)
  physics.addBody(m.quadro[9], "dynamic", {friction=100, density=2})
  --quadro[9].rotation=90

  m.quadro[10] = display.newCircle(m.chain2[35].x+15, m.chain2[35].y-23 , 5)
  physics.addBody(m.quadro[10], "dynamic", {friction=100, density=2})
  --quadro[10].rotation=60

  m.quadro[11] = display.newCircle(m.chain2[35].x+8, m.chain2[35].y-30, 5)
  physics.addBody(m.quadro[11], "dynamic", {friction=100, density=2})
  --quadro[11].rotation=30

  for i=1, 11, 1 do
    if(i~=6)then
      camera:add(m.quadro[i], 2, false)
      m.quadro[i]:setFillColor(0.2,0.2,0.2)
    end
  end

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE JOINT TRA I RETTANGOLI LATERALI SINISTRA
  --------------------------------------------------------------------------------
  m.jointLati1 = {}
  m.jointLati2 = {}
  for i=2,7,1 do
    if(i==6) then
      --JOINT CON IL PRIMO RETTANGOLO SOTTO(BLU)
      m.revoluteJoints[40]=physics.newJoint("pivot", m.quadro[1], m.chain2[15], m.quadro[1].x, m.quadro[1].y)
	    m.jointLati1[i]=physics.newJoint("rope", m.quadro[1], m.chain2[15], 0, 0, 0, 0)
      m.jointLati2[i]=physics.newJoint("distance", m.quadro[1], m.chain2[15], m.quadro[1].x, m.quadro[1].y, m.chain2[15].x, m.chain2[15].y)

    elseif(i==7) then
      --JOINT CON IL PRIMO RETTANGOLO SOPRA (ROSSO)
      m.revoluteJoints[41]=physics.newJoint("pivot", m.quadro[5], m.chain[15], m.quadro[5].x, m.quadro[5].y)
	    m.jointLati1[i]=physics.newJoint("rope", m.quadro[5], m.chain[15], 0, 0, 0, 0)
      m.jointLati2[i]=physics.newJoint("distance", m.quadro[5], m.chain[15], m.quadro[5].x, m.quadro[5].y, m.chain[15].x, m.chain[15].y)

    elseif(i<=5) then
      --JOINT TRA I RETTANGOLI BIANCHI
      m.revoluteJoints[34+i]=physics.newJoint("pivot", m.quadro[i-1], m.quadro[i], m.quadro[i-1].x, m.quadro[i-1].y)
	    m.jointLati1[i]=physics.newJoint("rope", m.quadro[i-1], m.quadro[i], 0, 0, 0, 0)
      m.jointLati2[i]=physics.newJoint("distance", m.quadro[i-1], m.quadro[i], m.quadro[i-1].x, m.quadro[i-1].y, m.quadro[i].x, m.quadro[i].y)

    end
  end

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE JOINT TRA I RETTANGOLI LATERALI SINISTRA
  --------------------------------------------------------------------------------
  for i=7,12,1 do
    if(i<=10)then
      --JOINT TRA I RETTANGOLI BIANCHI
      cont=35+i
      m.revoluteJoints[cont]=physics.newJoint("pivot", m.quadro[i], m.quadro[i+1], m.quadro[i].x, m.quadro[i].y)
      m.jointLati1[i]=physics.newJoint("rope", m.quadro[i], m.quadro[i+1], 0, 0, 0, 0)
      m.jointLati2[i]=physics.newJoint("distance", m.quadro[i], m.quadro[i+1], m.quadro[i].x, m.quadro[i].y, m.quadro[i+1].x, m.quadro[i+1].y)
    elseif(i==11)then
      --JOINT CON L'ULTIMO RETTANGOLO SOPRA (ROSSO)
      m.revoluteJoints[46]=physics.newJoint("pivot", m.quadro[11], m.chain[35], m.quadro[11].x, m.quadro[11].y)
      m.jointLati1[11]=physics.newJoint("rope", m.quadro[11], m.chain[35], 0, 0, 0, 0)
      m.jointLati2[11]=physics.newJoint("distance", m.quadro[11], m.chain[35], m.quadro[11].x, m.quadro[11].y, m.chain[35].x, m.chain[35].y)
    elseif(i==12)then
      --JOINT CON L'ULTIMO RETTANGOLO SOTTO (BLU)
      m.revoluteJoints[47]=physics.newJoint("pivot", m.quadro[7], m.chain2[35], m.quadro[7].x, m.quadro[7].y)
      m.jointLati1[12]=physics.newJoint("rope", m.quadro[7], m.chain2[35], 0, 0, 0, 0)
      m.jointLati2[12]=physics.newJoint("distance", m.quadro[7], m.chain2[35], m.quadro[7].x, m.quadro[7].y, m.chain2[35].x, m.chain2[35].y)
    end
  end
  return m
end


--------------------------------------------------------------------------------
--TANK
--------------------------------------------------------------------------------
function l.newTank(cingolo, camera)
  local tank = {}
  local scaleFactor = 1.0
  local physicsData = (require "images.corpoTank").physicsData(scaleFactor)
  tank.corpo = display.newImage("images/corpoTank.png")
  physics.addBody( tank.corpo, "dynamic", physicsData:get("corpoTank"))
  tank.corpo.x = cingolo.quadro[14].x-30
  tank.corpo.y = cingolo.quadro[14].y-70
  --tank.corpo:scale(1.2, 1)
  tank.corpo.myName="tank"
  camera:add(tank.corpo, 1, false)

  local scaleFactor2 = 0.5
  local physicsData = (require "images.telaiob").physicsData(scaleFactor2)
  tank.dietroCingolo = display.newImage("images/telaiob.png")
  physics.addBody( tank.dietroCingolo, "dynamic", physicsData:get("telaiob"))
  tank.dietroCingolo.x = tank.corpo.x+30
  tank.dietroCingolo.y = tank.corpo.y+47
  tank.dietroCingolo:scale(0.5, 1)
  tank.dietroCingolo.myName="dietroCingolo"
  camera:add(tank.dietroCingolo, 4, false)


  local scaleFactor3 = 0.5
  local physicsData = (require "images.ccb").physicsData(scaleFactor3)
  tank.davantiCingolo = display.newImage("images/ccb.png")
  physics.addBody( tank.davantiCingolo, "dynamic", physicsData:get("ccb"))
  tank.davantiCingolo.x = tank.dietroCingolo.x
  tank.davantiCingolo.y = tank.dietroCingolo.y-10
  tank.davantiCingolo:scale(0.5, 1)
  tank.davantiCingolo.myName="davantiCingolo"
  camera:add(tank.davantiCingolo, 2, false)

  local scaleFactor2 = 0.16
  local physicsData = (require "images.hiro").physicsData(scaleFactor2)
  tank.hiro = display.newImageRect("images/hiro.png", 81.1, 62)
  tank.hiro.myName = "hiro"
  physics.addBody( tank.hiro, "dynamic", physicsData:get("hiro"))
  tank.hiro.x = tank.corpo.x-9
  tank.hiro.y = tank.corpo.y-48
  camera:add(tank.hiro, 4, false)

  local weldJoint1 = physics.newJoint("weld", tank.corpo, tank.dietroCingolo, tank.corpo.x, tank.corpo.y)
  local weldJoint2 = physics.newJoint("weld", tank.corpo, tank.davantiCingolo, tank.corpo.x, tank.corpo.y)
  local weldJoint3 = physics.newJoint("weld", tank.corpo, tank.hiro, tank.corpo.x, tank.corpo.y)
  return tank
end
return l
