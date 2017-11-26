local M = {}

function M.newBall(params)
    local ball = display.newCircle( params.x, params.y, 10 )
    physics.addBody( ball, "dynamic",{density = 0, friction = 0.3, bounce = 0.5, radius =20, filter =  chassisCollider})
    ball.isBullet = true
    ball.rotation = -30

    function ball:shoot(cannonRotation , camera)
      local speed = 500
      local angle = math.rad(cannonRotation-90)
      ball:setLinearVelocity(math.cos(angle) * speed, math.sin(angle) * speed)
      camera:add(ball, 2, false)
    end

    return ball
end

return M
