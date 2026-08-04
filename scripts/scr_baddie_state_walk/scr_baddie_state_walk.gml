/// @self obj_baddie
function scr_baddie_state_walk()
{
    velocityX = scaleX * moveSpeed
    
    
    if turnTimer > 0 && turnForce == true
        turnTimer--
    
    sprite_index = spriteWalk
    
    turnBuffer--
    
    if turnBuffer > 0
    {
        trace(turnBuffer)
        return
    }
    
    var touchingSolid = scr_solid(x + velocityX, y - 31)
    var touchingHallway = place_meeting(x + velocityX, y, obj_hallway)
    var touchingRoomRight = (x + velocityX) > (room_width + 50)
    var touchingRoomLeft = (x + velocityX < -50)
    var touching = touchingSolid || touchingHallway || touchingRoomRight || touchingRoomLeft
    var turnForced = turnTimer <= 0 && turnForce
    
    
    if !(touching || turnForced)
        return
    
    if spriteTurn != -1
    {
        image_index = 0
        sprite_index = spriteTurn
        stateCurrent = BaddieStates.TURN
        return
    }
    
    scaleX = scaleX * -1
    image_xscale = scaleX
    return
}