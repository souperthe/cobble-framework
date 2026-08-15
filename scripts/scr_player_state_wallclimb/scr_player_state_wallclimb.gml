/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_wallclimb_enter(enterMessage)
{
    
    
    wallSpeed = moveSpeed
    
    if moveSpeed < 1
        wallSpeed = 1
    else
        moveSpeed = wallSpeed
    
    soundMach = super_sound_loop_emitter(emitter, sfx_mach2)
    bufferWallClimb = 10
    uppercutAllow = true
    return;
}

/// @self obj_player
function scr_player_state_wallclimb_exit()
{
    audio_stop_sound(soundMach)
    return;
}

/// @self obj_player
function scr_player_state_wallclimb_step()
{
    
    velocityY = -wallSpeed
    
    if wallSpeed < 20
        wallSpeed += 0.15
    
    if wallSpeed < 0
    {
        if !machMode
            moveSpeed += 0.2
        else
            moveSpeed += 0.4
    }
    
    bufferWallClimb--
    
    if !check_input("dash", true) && bufferWallClimb <= 0
    {
        moveSpeed = 0
        stateSwitch(PlayerStates.NORMAL)
        return
    }
    
    if check_input("jump", false)
    {
        stateSwitch(PlayerStates.MACH2, "walljump")
        return
    }
    
    if bufferVertical <= 0 && place_meeting(x, y - 1, obj_solid)
    {
        stateSwitch(PlayerStates.SJUMPLAND)
        return
    }
    
    if bufferVertical <= 0 && wallSpeed > 0 && !scr_solid(x + scaleX, y)
    {
        
        find_ground()
        
        if wallSpeed < 6
            wallSpeed = 6
        
        if wallSpeed >= 6 && wallSpeed < 12
        {
            stateSwitch(PlayerStates.MACH2)
            moveSpeed = wallSpeed
        }
        else if wallSpeed >= 12
        {
            stateSwitch(PlayerStates.MACH3)
            sprite_index = spriteGet("mach4")
            moveSpeed = wallSpeed
        }
        
        
        velocityX = wallSpeed * scaleX
        velocityY = 0
        return 
    }
    
    if velocityY < -5
        sprite_index = spriteGet("climbwall")
    else
        sprite_index = spriteGet("clingwall")
    
    image_speed = 0.6;
    
    return;
}
