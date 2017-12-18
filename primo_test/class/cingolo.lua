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
  m.chain[i]:setFillColor(1,0,0)
  physics.addBody(m.chain[i], "dynamic", {friction=10, density=1})
  camera:add(m.chain[i], 2, false)
  end

  for i=15, 35, 1 do
  m.chain2[i] = display.newCircle(10*i, display.contentCenterY-65, 5)
  m.chain2[i]:setFillColor(0,0,1)
  physics.addBody(m.chain2[i], "dynamic", {friction=10, density=1})
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
      pivot2=physics.newJoint("pivot", m.chain[i], m.chain[i+1], m.chain[i].x, m.chain[i].y),
      pivot3=physics.newJoint("pivot", m.chain[i], m.chain[i+1], m.chain[i].x, m.chain[i].y)
    },
    chainInferiore =
    {
      pivot1=physics.newJoint("pivot", m.chain2[i], m.chain2[i+1], m.chain2[i].x, m.chain2[i].y),
      pivot2=physics.newJoint("pivot", m.chain2[i], m.chain2[i+1], m.chain2[i].x, m.chain2[i].y),
      pivot3=physics.newJoint("pivot", m.chain2[i], m.chain2[i+1], m.chain2[i].x, m.chain2[i].y)
    }
  }
  end

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE RUOTE
  --------------------------------------------------------------------------------
  for i=2, 3, 1 do
  cont=i*10
  m.ruote[i]=display.newCircle(m.chain[cont].x-4, m.chain2[15].y-15, 1)
  physics.addBody(m.ruote[i], "dynamic", {density=0, friction=1})
  m.ruote[i]:setFillColor(0,1,1)
  end

  m.ruote[1]=display.newCircle(m.chain[15].x, m.chain2[15].y-15, 18)
  physics.addBody(m.ruote[1], "dynamic", {density=0.3, friction=1})
  m.ruote[1]:setFillColor(0,1,0)

  m.ruote[4]=display.newCircle(m.chain[35].x, m.chain2[15].y-15, 18)
  physics.addBody(m.ruote[4], "dynamic", {density=0.3, friction=1})
  m.ruote[4]:setFillColor(0,1,0)

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
  camera:add(m.quadro[14], 2, false)
  for i=1, 4, 1 do
    m.revoluteJoints[47+i]=physics.newJoint("pivot", m.ruote[i], m.quadro[14], m.ruote[i].x, m.quadro[14].y)
  end

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE RETTANGOLI LATERALI SINISTRA (BIANCHI)
  --------------------------------------------------------------------------------
  m.quadro[1] = display.newCircle(m.chain2[15].x-8, m.chain2[15].y, 5)
  physics.addBody(m.quadro[1], "dynamic", {friction=1, density=1})
  --quadro[1].rotation=30

  m.quadro[2] = display.newCircle(m.chain2[15].x-15, m.chain2[15].y-7, 5)
  physics.addBody(m.quadro[2], "dynamic", {friction=1, density=1})
  --quadro[2].rotation=60

  m.quadro[3] = display.newCircle(m.chain2[15].x-17, m.chain2[15].y-15, 5)
  physics.addBody(m.quadro[3], "dynamic", {friction=1, density=1})
  --quadro[3].rotation=90

  m.quadro[4] = display.newCircle(m.chain2[15].x-15, m.chain2[15].y-23, 5)
  physics.addBody(m.quadro[4], "dynamic", {friction=1, density=1})
  --quadro[4].rotation=120

  m.quadro[5] = display.newCircle(m.chain2[15].x-8, m.chain2[15].y-30, 5)
  physics.addBody(m.quadro[5], "dynamic", {friction=1, density=1})
  --quadro[5].rotation=150

  --------------------------------------------------------------------------------
  ---IMPLEMENTAZIONE RETTANGOLI LATERALI DESTRA (BIANCHI)
  --------------------------------------------------------------------------------

  m.quadro[7] = display.newCircle(m.chain2[35].x+8, m.chain2[35].y, 5)
  physics.addBody(m.quadro[7], "dynamic", {friction=1, density=1})
  --quadro[7].rotation=150

  m.quadro[8] = display.newCircle(m.chain2[35].x+15, m.chain2[35].y-7,  5)
  physics.addBody(m.quadro[8], "dynamic", {friction=1, density=1})
  --quadro[8].rotation=120

  m.quadro[9] = display.newCircle(m.chain2[35].x+17, m.chain2[35].y-15, 5)
  physics.addBody(m.quadro[9], "dynamic", {friction=1, density=1})
  --quadro[9].rotation=90

  m.quadro[10] = display.newCircle(m.chain2[35].x+15, m.chain2[35].y-23 , 5)
  physics.addBody(m.quadro[10], "dynamic", {friction=1, density=1})
  --quadro[10].rotation=60

  m.quadro[11] = display.newCircle(m.chain2[35].x+8, m.chain2[35].y-30, 5)
  physics.addBody(m.quadro[11], "dynamic", {friction=1, density=1})
  --quadro[11].rotation=30

  for i=1, 11, 1 do
    if(i~=6)then
      camera:add(m.quadro[i], 2, false)
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
      physics.newJoint("pivot", m.quadro[1], m.chain2[15], m.chain2[15].x, m.chain2[15].y)
    elseif(i==7) then
      --JOINT CON IL PRIMO RETTANGOLO SOPRA (ROSSO)
      physics.newJoint("pivot", m.quadro[5], m.chain[15], m.chain[15].x, m.chain[15].y)
    elseif(i<=5) then
      --JOINT TRA I RETTANGOLI BIANCHI
      physics.newJoint("pivot", m.quadro[i-1], m.quadro[i], m.quadro[i-1].x, m.quadro[i-1].y)
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
      m.jointLati1[i]=physics.newJoint("pivot", m.quadro[i], m.quadro[i+1], m.quadro[i].x, m.quadro[i].y)
      m.jointLati2[i]=physics.newJoint("pivot", m.quadro[i], m.quadro[i+1], m.quadro[i].x, m.quadro[i].y)
    elseif(i==11)then
      --JOINT CON L'ULTIMO RETTANGOLO SOPRA (ROSSO)
      m.revoluteJoints[46]=physics.newJoint("pivot", m.quadro[11], m.chain[35], m.chain[35].x, m.chain[35].y)
      m.jointLati1[11]=physics.newJoint("pivot", m.quadro[11], m.chain[35], m.chain[35].x, m.chain[35].y)
      m.jointLati2[11]=physics.newJoint("pivot", m.quadro[11], m.chain[35], m.chain[35].x, m.chain[35].y)
    elseif(i==12)then
      --JOINT CON L'ULTIMO RETTANGOLO SOTTO (BLU)
      m.revoluteJoints[47]=physics.newJoint("pivot", m.quadro[7], m.chain2[35], m.chain2[35].x, m.chain2[35].y)
      m.jointLati1[12]=physics.newJoint("pivot", m.quadro[7], m.chain2[35], m.chain2[35].x, m.chain2[35].y)
      m.jointLati2[12]=physics.newJoint("pivot", m.quadro[7], m.chain2[35], m.chain2[35].x, m.chain2[35].y)
    end
  end
  return m
end


--------------------------------------------------------------------------------
--TANK
--------------------------------------------------------------------------------
function l.newTank(cingolo)
  local tank = display.newImageRect("images/tank1.png", 120, 45)
  tank.x = cingolo.quadro[14].x
  tank.y = cingolo.quadro[14].y-60
  tank.myName = "tank"
  physics.addBody(tank, {filter = tankCollider})
  return tank
end
return l
