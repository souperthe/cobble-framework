
/// @self obj_rigid_body
function scr_collide()
{
    grounded = false;
    
    var tempVelocityY = velocityY
    var tempVelocityX = velocityX
    
    if !collide
    {
        y += velocityY
        x += velocityX
        return
    }
    
    repeat (ceil(abs(tempVelocityY)))
    {
        var velocityDirection = clamp(tempVelocityY, -1, 1)
        
        if (!scr_solid(x, y + velocityDirection))
        {
            y += velocityDirection
            tempVelocityY -= velocityDirection
        }
        else 
        {
        	velocityY = 0
            break;
        }
        
        continue
    }
    
    repeat (ceil(abs(tempVelocityX)))
    {
        var velocityDirection = clamp(tempVelocityX, -1, 1);
        var collisionDefault = scr_solid(x + velocityDirection, y)
        var collisionSkip = false
        var snapPrecision = 0.25
        var snapMaxUp = 2.27
        var snapMaxDown = 3
        var snap = 0
        var originalY = y;
        
        if (collisionDefault)
        {
            while (collisionDefault && snap <= snapMaxUp)
            {
                y -= snapPrecision
                snap += snapPrecision
                collisionDefault = scr_solid(x + velocityDirection, y)
            }
        
            if (collisionDefault)
            {
                y = originalY
                collisionSkip = false
            }
            else
            {
                collisionSkip = true
            }
        }
        else 
        {
        	collisionSkip = true;
            
            while (!scr_solid(x + velocityDirection, y + snapPrecision))
            {
                y += snapPrecision
                snap += snapPrecision
                
                if snap > snapMaxDown
                {
                    y = originalY
                    break;
                }
                continue
            }
        }
        
        if collisionSkip
        {
            x += velocityDirection
            tempVelocityX -= velocityDirection
        }
        else 
        {
        	velocityX = 0
            break
        }
        continue
    }
    
    if velocityY < gravMax
        velocityY += grav
    
    grounded |= scr_solid(x, y + 1)
    return;
}