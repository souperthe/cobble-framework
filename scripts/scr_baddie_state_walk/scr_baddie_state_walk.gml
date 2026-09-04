/// @self obj_baddie
function scr_baddie_state_walk()
{
    
    var turnCooldown = 10
    var roomMargin = 50
    var sensorY = 31
    var footY = bbox_bottom + 1
    
    velocityX = scaleX * moveSpeed
    sprite_index = spriteWalk
    
    if scr_baddie_scream_check()
        return
    
    
    if turnTimer > 0 && turnForce == true
        turnTimer--
    
    if --turnBuffer > 0
    {
        return
    }
    
    var moveAbsolute = abs(moveSpeed)
    var reach  = moveAbsolute * 8
    var probeX = (scaleX > 0) ? bbox_right + reach : bbox_left  - reach
    
    
    var touchingSolid = scr_solid(probeX, y - sensorY) 
    var touchingHallway = place_meeting(probeX, y, obj_warp_hallway) 
    var touchingRoomRight = probeX > room_width + roomMargin
    var touchingRoomLeft = probeX < -roomMargin
    var notTouchingFloorAhead = !scr_solid(probeX, footY)
    
    var touching = touchingSolid || touchingHallway || touchingRoomLeft || touchingRoomRight || notTouchingFloorAhead
    
    var turnForced = turnTimer <= 0 && turnForce
    
    
    if !(touching || turnForced)
        return
    
    if spriteTurn != -1 
    {
        image_index = 0
        scaleX = -scaleX
        sprite_index = spriteTurn
        stateCurrent = BaddieStates.TURN
        return
    }
        
    scaleX = -scaleX
    image_xscale = scaleX
    turnBuffer = turnCooldown
    return
}