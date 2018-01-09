
-------------------------------------INIZIO-------------------------------------

local l = {}

function l.pulsantiMovimentoCingolo()
  local m = {}
  m.rotate = {}

  function m.touch(event, params)
  	local t = event.target

  	if "began" == event.phase then
  		display.getCurrentStage():setFocus(t)
  		t.isFocus = true
  		params.m.result = t.result

  		if t.result == "rotate:left" then
  			params.m.rotate.left:rotate(params.ruota1, params.ruota2, params.ruota3, params.ruota4)
  		elseif t.result == "rotate:right" then
  			params.m.rotate.right:rotate(params.ruota1, params.ruota2, params.ruota3, params.ruota4)
  		end

  	  elseif t.isFocus then
  		  if "moved" == event.phase then
  		elseif "ended" == event.phase then
  			display.getCurrentStage():setFocus(nil)
  			t.isFocus = false
  			params.m.result = "none"
  		end
  	end
  end

  function m.enterFrame(event, params)
  	if params.m.result == "rotate:left" then
  			params.m.rotate.left:rotate(params.ruota1, params.ruota2, params.ruota3, params.ruota4)
			--params.tank:applyTorque(0.5)
  	elseif params.m.result == "rotate:right" then
  			params.m.rotate.right:rotate(params.ruota1, params.ruota2, params.ruota3, params.ruota4)
			--params.tank:applyTorque(-0.5)

  	elseif params.m.result == "none" then
  		 params.ruota1:applyTorque(0)
         params.ruota2:applyTorque(0)
		 params.ruota3:applyTorque(0)
         params.ruota4:applyTorque(0)

  	end
  end

  function m.rotate.dx()
    local pulsanteDx = display.newImage("images/dx.png")
    pulsanteDx.x = display.screenOriginX + pulsanteDx.contentWidth + 250
    pulsanteDx.y = display.contentHeight - pulsanteDx.contentHeight - 10
    pulsanteDx.result = "rotate:right"

    function pulsanteDx:rotate(ruota1, ruota2, ruota3, ruota4)
      ruota1:applyTorque(150)
      ruota2:applyTorque(150)
	    ruota3:applyTorque(150)
      ruota4:applyTorque(150)
    end
    return pulsanteDx
  end

  function m.rotate.sx()
    local pulsanteSx = display.newImage("images/sx.png")
    pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth + 10
    pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 10
    pulsanteSx.result = "rotate:left"

    function pulsanteSx:rotate(ruota1, ruota2, ruota3, ruota4)
      ruota1:applyTorque(-150)
      ruota2:applyTorque(-150)
	    ruota3:applyTorque(-150)
      ruota4:applyTorque(-150)

    end
    return pulsanteSx
  end

  return m
end

function l.pulsanteCannoneDx()
  local pulsanteDx = display.newImageRect("images/bottone.png", 75, 75)
  pulsanteDx.x = display.screenOriginX + pulsanteDx.contentWidth + 253
  pulsanteDx.y = display.contentHeight - pulsanteDx.contentHeight - 150
  return pulsanteDx
end

function l.pulsanteCannoneSx()
  local pulsanteSx = display.newImageRect("images/bottone.png", 75, 75)
  pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth+15
    pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 150
  return pulsanteSx
end

function l.pulsanteSparo()
  local pulsanteSparo = display.newImage("images/missile2.png")
  pulsanteSparo.x = display.screenOriginX + pulsanteSparo.contentWidth+130
  pulsanteSparo.y = display.contentHeight - pulsanteSparo.contentHeight - 90
  return pulsanteSparo
end

return l