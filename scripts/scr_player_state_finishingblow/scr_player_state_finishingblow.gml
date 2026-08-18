/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_finishingblow_enter(enterMessage)
{
    
    var animationsNormal = [
        spriteGet("finishingblow1"),
        spriteGet("finishingblow2"),
        spriteGet("finishingblow3"),
        spriteGet("finishingblow4"),
        spriteGet("finishingblow5")
    ]
    
    if check_input("up", true)
        sprite_index = spriteGet("uppercutfinishingblow")
    else
        sprite_index = array_random(animationsNormal)
    
    image_index = 0
    image_speed = 0.4
    thrown = false
    
    return;
}

/// @self obj_player
function scr_player_state_finishingblow_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_finishingblow_step()
{
    
    if floor(image_index) < 4
        velocityX = approach(velocityX, 0, 1)
    else
    {
        
        if !thrown
        {
            velocityY = -5
            thrown = true
            
            if instance_exists(grabbedBaddie)
            { 
                
                if object_is_ancestor(grabbedBaddie.object_index, obj_baddie)
                    scr_baddie_throw(self, grabbedBaddie)
                
                super_sound_oneshot_emitter(emitter, sfx_killingblow)
                super_sound_oneshot_emitter(emitter, sfx_punch)
            }
        }
        
        velocityX = approach(velocityX, -scaleX * 4, 0.5)
    }
    
    if is_sprite_finished()
    {
        stateSwitch(PlayerStates.NORMAL)
        return
    }
    
    return;
}
