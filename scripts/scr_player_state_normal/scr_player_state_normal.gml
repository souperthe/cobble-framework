/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_normal_enter(enterMessage)
{
    
    if enterMessage == "fromsprite"
    {
        image_index = 0
        return
    }
    
    sprite_index = spriteGet("idle")
    image_index = 0
    return;
}

/// @self obj_player
function scr_player_state_normal_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_normal_step()
{
    static landAnimations = [spriteGet("land"), spriteGet("land2")]
    var landing = false;
    var move = check_input("right", true) - check_input("left", true)
    var walkSpeed = 6;
    var walkSpeedMax = 8;
    var accel = 0.5;
    var deccel = 0.1;
    
    if array_contains(landAnimations, sprite_index)
    {
        landing = !is_sprite_finished()
    }
         
    
    velocityX = (move * moveSpeed)
    
    if move != 0
    { 
        
        scaleX = move;
        
        if moveSpeed < walkSpeed
            moveSpeed += accel
        else if floor(moveSpeed) == moveSpeed
            moveSpeed = walkSpeedMax
        
        
        if !landing
        {
            if stepTime > 0
                stepTime--;
            else {
                stepTime = 12;
                super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
            }
            
            if (moveSpeed < (floor(walkSpeedMax) / 2) && move != 0)
                image_speed = 0.35
            else if (moveSpeed < (floor(walkSpeedMax) / 2) && moveSpeed < walkSpeedMax)
                image_speed = 0.45
            else
                image_speed = 0.6
                
            
            sprite_index = spriteGet("move")
        }
    }
    else {
    	moveSpeed = 0
        stepTime = 12;
        if !landing
        { 
            sprite_index = spriteGet("idle")
            image_speed = 0.35
        }
    }
    
    if moveSpeed > walkSpeed
        moveSpeed -= deccel
    
    if check_input("taunt", false)
    {
        scr_player_taunt()
        return
    }
    
        
    if check_input("attack", false)
    {
        scr_player_attack()
        return
    }
    
    if check_input("jump", false)
    {
        stateSwitch(PlayerStates.JUMP, "jump")
        return
    }
    
    if !grounded
    {
        stateSwitch(PlayerStates.JUMP)
        return
    }
    
    return;
}
