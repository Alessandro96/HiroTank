local M = {}

function M.newBall(params)
    local angle1 = math.rad(params.cannonRotation+180)
    local ball = display.newCircle(params.x+(100*math.cos(angle1)), params.y+(100*math.sin(angle1)), 10)
    ball:setFillColor(0,0,0)
    physics.addBody( ball, "dynamic",{density = 0, friction = 0.3, bounce = 0.5, radius =20, filter =  chassisCollider})
    ball.isBullet = true
    ball.isSensor = true
    ball.rotation = -30
    ball.myName = "colpoCarro"

    function ball:shoot(camera)
      local speed = 800
      ball:setLinearVelocity(math.cos(angle1) * speed, math.sin(angle1) * speed)
      camera:add(ball, 2, false)
    end

    return ball
end

return M
