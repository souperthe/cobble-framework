/// @self obj_rigid_body
function scr_collide()
{
    grounded = false;
    
    if (!moveAndCollide) return;
    
    if (!collide)
    {
        y += velocityY;
        x += velocityX;
        return;
    }
    
    var currentVelocityX = velocityX;
    var currentVelocityY = velocityY;
    var absoluteVelocityX = abs(currentVelocityX);
    var absoluteVelocityY = abs(currentVelocityY);
    
    repeat (ceil(absoluteVelocityX))
    {
        var horizontalDirection = sign(currentVelocityX);
        if (horizontalDirection == 0) break;
        
        var maximumSlopeClimbHeight = 4;
        for (var slopeAscentStep = 1; slopeAscentStep <= maximumSlopeClimbHeight; slopeAscentStep++)
        {
            if (scr_solid(x + horizontalDirection, y) && !scr_solid(x + horizontalDirection, y - slopeAscentStep))
            {
                y -= slopeAscentStep;
                break;
            }
        }
        
        for (var slopeDescentStep = 1; slopeDescentStep <= maximumSlopeClimbHeight; slopeDescentStep++)
        {
            if (!scr_solid(x + horizontalDirection, y) && !scr_solid(x + horizontalDirection, y + 1) && scr_solid(x + horizontalDirection, y + (slopeDescentStep + 1)))
            {
                y += slopeDescentStep;
                break;
            }
        }
        
        if (!scr_solid(x + horizontalDirection, y))
        {
            x += horizontalDirection;
        }
        else 
        {
            velocityX = 0;
            break;
        }
    }
    
    repeat (ceil(absoluteVelocityY))
    {
        var verticalDirection = sign(currentVelocityY);
        if (verticalDirection == 0) break;
        
        if (!scr_solid(x, y + verticalDirection))
        {
            y += verticalDirection;
        }
        else 
        {
            velocityY = 0;
            break;
        }
    }
    
    if (velocityY < gravMax)
        velocityY += grav;
    
    grounded |= scr_solid(x, y + 1);
    return
}