
system.activate( "multitouch" )

local l = {}



function l.pulsantiMovimentoCingolo()
  local m = {}
  m.rotate = {}

  function m.touch(event, params)
  	local t = event.target

  	if "began" == event.phase then
		display.getCurrentStage():setFocus( event.target, event.id )
  		--display.getCurrentStage():setFocus(t)
  		t.isFocus = true
  		params.m.result = t.result

  		if t.result == "rotate:left" then
  			params.m.rotate.left:rotate(params.ruota1, params.ruota2, params.ruota3, params.ruota4)
  		elseif t.result == "rotate:right" then
  			params.m.rotate.right:rotate(params.ruota1, params.ruota2, params.ruota3, params.ruota4)
  		end

  	  elseif t.isFocus then
  		  if "moved" == event.phase then
  	elseif "ended" == event.phase or controlloc == false then
			display.getCurrentStage():setFocus( event.target, nil )
  			--display.getCurrentStage():setFocus(nil)
  			t.isFocus = false
			params.ruota1:applyTorque(0)
            params.ruota2:applyTorque(0)
		    params.ruota3:applyTorque(0)
            params.ruota4:applyTorque(0)
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

  	else
  		 params.ruota1:applyTorque(0)
         params.ruota2:applyTorque(0)
		 params.ruota3:applyTorque(0)
         params.ruota4:applyTorque(0)

  	end
  end
  

  function m.rotate.dx()
    local pulsanteDx = display.newImageRect("images/pulsanti/dx.png",160,160)
    pulsanteDx.x = display.screenOriginX + pulsanteDx.contentWidth + 1550
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

  function m.stop(ruota1, ruota2, ruota3, ruota4)
      ruota1:applyTorque(0)
      ruota2:applyTorque(0)
	  ruota3:applyTorque(0)
      ruota4:applyTorque(0)
    end

  function m.rotate.sx()
    local pulsanteSx = display.newImageRect("images/pulsanti/sx.png",160,160)
    pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth + 1250
    pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 8
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
  local pulsanteDx = display.newImageRect("images/pulsanti/down.png", 150, 150)
  pulsanteDx.x = display.screenOriginX + pulsanteDx.contentWidth + 253
  pulsanteDx.y = display.contentHeight - pulsanteDx.contentHeight - 150
  return pulsanteDx
end

function l.pulsanteCannoneSx()
  local pulsanteSx = display.newImageRect("images/pulsanti/up.png", 150, 150)
  pulsanteSx.x = display.screenOriginX + pulsanteSx.contentWidth+15
  pulsanteSx.y = display.contentHeight - pulsanteSx.contentHeight - 150
  return pulsanteSx
end

function l.pulsanteSparo()
   pulsanteSparo = display.newImageRect("images/pulsanti/bomba.png",160, 160)
  --pulsanteSparo:scale(2,2)
  pulsanteSparo.x = display.screenOriginX + pulsanteSparo.contentWidth+120
  pulsanteSparo.y = display.contentHeight - pulsanteSparo.contentHeight+30
  return pulsanteSparo
end


return l
