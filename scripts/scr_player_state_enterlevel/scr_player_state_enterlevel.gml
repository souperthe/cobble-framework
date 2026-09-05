/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_enterlevel_enter(enterMessage)
{
    velocityX = 0
    velocityY = 0
    moveSpeed = 0
    sprite_index = spriteGet("entergate")
    image_index = 0
    return;
}

/// @self obj_player
function scr_player_state_enterlevel_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_enterlevel_step()
{
    
    var touchingGate = instance_place(x, y, obj_gate)
    
    global.comboTimePause = 1
    
    if touchingGate
    {
        
        if is_sprite_finished() && sprite_index == spriteGet("entergate")
        {
            
            if image_speed != 0
            {
                image_speed = 0
                touchingGate.onEnter()
            }
        }
        else
            image_speed = 0.35
        
    }
    
    
    var touchingGateExit = instance_place(x, y, obj_gate_exit)
    
    if touchingGateExit
    {
        
        x = touchingGateExit.x
        
        image_speed = 0.35
    
        if sprite_index == spriteGet("entergate")
        {
            image_index = 0
            sprite_index = spriteGet("walkfront")
            scaleX = 1
        }
        
        if sprite_index == spriteGet("walkfront") && is_sprite_finished()
        {
            touchingGateExit.slam()
            sprite_index = spriteGet("timesup")
            image_index = 0
        }
        
    }
    
    if sprite_index = spriteGet("timesup")  && is_sprite_finished()
        stateSwitch(PlayerStates.NORMAL)
    
        
    return;
}
