/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_hauling_enter(enterMessage)
{
    image_index = 0
    sprite_index = spriteGet("haulingstart")
    haulStep = false
    return;
}

/// @self obj_player
function scr_player_state_hauling_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_hauling_step()
{
    image_speed = 0.35
    
    if sprite_index == spriteGet("haulingstart")
    {
        velocityX = approach(velocityX, 0, 2)
        
        if is_sprite_finished()
            sprite_index = spriteGet("haulingidle")
        return
    }
    
    var move = check_input("right", true) - check_input("left", true)
    var stepFrames = [3, 8]
    
    velocityX = move * 6
    
    if move != 0
        scaleX = move
    
    if grounded
    {
        if move != 0
        {
            sprite_index = spriteGet("haulingwalk")
            
            var frame = floor(image_index)
            
            if array_contains(stepFrames, frame) and !haulStep
            {
                haulStep = true
                super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
            }
            
            if !array_contains(stepFrames, frame)
                haulStep = false
            
        }
        else
        {
            
            if sprite_index != spriteGet("haulingfall") && sprite_index != spriteGet("haulingland")
                sprite_index = spriteGet("haulingidle")
            else{
                
                if sprite_index != spriteGet("haulingland")
                {
                    sprite_index = spriteGet("haulingland")
                    image_index = 0
                    super_sound_oneshot_emitter(emitter, sfx_step, random_pitch())
                }
                else {
                	
                    if is_sprite_finished()
                        sprite_index = spriteGet("haulingidle")
                    
                }
            }
        }
        
    }
    else {
    	scr_player_jump_stop()
        
        if sprite_index == spriteGet("haulingjump") && is_sprite_finished()
        {
            sprite_index = spriteGet("haulingfall")
        }
    }
    
        
    if check_input("jump", false) && jumpAllow
    {
        sprite_index = spriteGet("haulingjump")
        image_index = 0
        velocityY = -11
        super_sound_oneshot_emitter(emitter, sfx_jump)
    }
    
    return;
}
