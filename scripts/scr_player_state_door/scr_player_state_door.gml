/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_door_enter(enterMessage)
{
    
    doorX = x
    
    var doorTouching = instance_place(x, y, obj_warp_door)
    
    if doorTouching != noone
        doorX = doorTouching.x + 50
    
    sprite_index = spriteGet("lookdoor")
    image_index = 0
    image_speed = 0.4
    velocityX = 0
    velocityY = 0
    moveAndCollide = false
    moveSpeed = 0
    
    return;
}

/// @self obj_player
function scr_player_state_door_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_door_step()
{
    
    if sprite_index == spriteGet("lookdoor")
    {
        x = approach(x, doorX, 5)
        
        if room == global.warpRoom
            sprite_index = spriteGet("walkfront")
        return
    }
    
    if instance_place(x, y, obj_gate_exit)
    {
        return
    }
    
    moveAndCollide = true
    
    if is_sprite_finished()
        stateSwitch(PlayerStates.NORMAL)
    return;
}
