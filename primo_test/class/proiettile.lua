local M = {}

function M.newBall(params)
    local ball = display.newCircle(params.x, params.y, 10)
    physics.addBody( ball, "dynamic",{density = 0, friction = 0.3, bounce = 0.5, radius =20, filter =  chassisCollider})
    ball.isBullet = true
    ball.isSensor = true
    ball.rotation = -30
    ball.myName = "colpoCarro"

    function ball:shoot(cannonRotation , camera)
      local speed = 800
      local angle = math.rad(cannonRotation+180)
      ball:setLinearVelocity(math.cos(angle) * speed, math.sin(angle) * speed)
      camera:add(ball, 2, false)
    end

    return ball
end

return M
