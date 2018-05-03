local M = {}
local composer = require("composer")

  function M.newFumo()
    local options2 = {width = 256, height = 512, numFrames = 16, sheetContentWidth = 1024, sheetContentHeight = 2048}
    local sheet2 = graphics.newImageSheet("images/smoke2.png", options2 )
    local sequenceData2 = { name="seq2", sheet=sheet2, start=1, count=16, time=800, loopCount=0 }

    function sequenceData2:playFumo(camera, cannon)
      local fumo = display.newSprite(sheet2, sequenceData2)
      fumo.x = cannon.x-20
      fumo.y = cannon.y-140
      camera:add(fumo, 4, false)
      fumo:play()
      return fumo
    end

    return sequenceData2
  end

  function M.newSangue()
    local opzioniSangue = {width = 500, height = 366, numFrames = 6, sheetContentWidth = 3072, sheetContentHeight = 512}
    local sangueSheet = graphics.newImageSheet("images/blood.png", opzioniSangue )
    local sequenzaSangue = {name="seq3", sheet=sangueSheet, start=1, count=6, time=900, loopCount=1}

    function sequenzaSangue:playSangue(camera, hiro)
      local sangue = display.newSprite(sangueSheet, sequenzaSangue)
      sangue:scale(0.5, 0.5)
      sangue.x = hiro.x-30
      sangue.y = hiro.y-30
      camera:add(sangue, 1, false)
      sangue:play()
      timer.performWithDelay(900, function()
                                    if(composer.getVariable("inVita")==true) then sangue:removeSelf() end
                                  end)
      return sangue
    end

    return sequenzaSangue
  end

  function M.newEsplosioneBomba()
    local opzioneEsplosione = {width = 96, height = 96, numFrames = 15, sheetContentWidth = 480, sheetContentHeight = 288}
    local esplosioneSheet = graphics.newImageSheet("images/esplosioneBomba.png", opzioneEsplosione)
    local sequenzaEsplosione = {name="seq4", sheet=esplosioneSheet, start=1, count=15, time=500, loopCount=1}

    function sequenzaEsplosione:playEsplosioneBomba(camera, bomba)
      local esplosione = display.newSprite(esplosioneSheet, sequenzaEsplosione)
      esplosione.x = bomba.x
      esplosione.y = bomba.y-20
      camera:add(esplosione, 6, false)
      esplosione:play()
      timer.performWithDelay(500, function()
                                    if(composer.getVariable("inVita")==true) then esplosione:removeSelf() end
                                  end)
      return esplosione
    end

    return sequenzaEsplosione
  end

  function M.newEsplosioneAereo()
    local options = {width = 300, height = 300, numFrames = 34, sheetContentWidth = 1800, sheetContentHeight = 1800}
    local sheet1 = graphics.newImageSheet("images/explosiontest.png", options )
    local sequenceData = { name="seq1", sheet=sheet1, start=1, count=34, time=1000, loopCount=1 }

    function sequenceData:playEsplosioneAereo(camera, aereo)
      local explosions = display.newSprite(sheet1, sequenceData)
      explosions.x = aereo.x
      explosions.y = aereo.y
      camera:add(explosions, 3, false)
      explosions:play()
      return explosions
    end

    return sequenceData
  end

return M
