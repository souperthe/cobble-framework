/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_machslide_enter(enterMessage)
{
    
    if enterMessage == "3"
        sprite_index = spriteGet("machslideboost3")
    else if enterMessage == "2"
        sprite_index = spriteGet("machslideboost")
    else if enterMessage == "brake"
    {
        sprite_index = spriteGet("machslidestart")
    }
    
    if enterMessage == "brake"
        super_sound_oneshot_emitter(emitter, sfx_break)
    else
        super_sound_oneshot_emitter(emitter, sfx_machslideboost)
    
    image_index = 0;
    return;
}

/// @self obj_player
function scr_player_state_machslide_exit()
{
    return;
}

/// @self obj_player
function scr_player_state_machslide_step()
{
    
    static slideStarters = [
        spriteGet("machslideboost3"),
        spriteGet("machslideboost")
    ]
    static mach3Animations = [
        spriteGet("machslideboost3"),
        spriteGet("machslideboost3fall")
    ]
    static mach2Animations = [
        spriteGet("machslideboost"),
        spriteGet("machslideboostfall")
    ]
    static instaTurn = [
        spriteGet("machslideboost3fall"),
        spriteGet("machslideboostfall")
    ]
    
    velocityX = scaleX * moveSpeed
    moveSpeed = approach(moveSpeed, 0, 0.4)
    
    if is_sprite_finished() && sprite_index = spriteGet("machslidestart")
        sprite_index = spriteGet("machslide")
    
    if (floor(moveSpeed) <= 0 && sprite_index == spriteGet("machslide"))
    {
        stateSwitch(PlayerStates.NORMAL)
        return
    }
    
    if is_sprite_finished() && array_contains(slideStarters, sprite_index)
    {
        if !(grounded && velocityY > 0) 
        {
            if sprite_index == spriteGet("machslideboost3")
                sprite_index = spriteGet("machslideboost3fall")
            else if sprite_index == spriteGet("machslideboost")
                sprite_index = spriteGet("machslideboostfall")
        }
        else 
        {
        	image_index = image_number - 1;
        }
    }
    else {
    	image_speed = 0.35;
    }
    
    
    var inMach3 = array_contains(mach3Animations, sprite_index) 
    var inMach2 = array_contains(mach2Animations, sprite_index) 
    var inInsta = array_contains(instaTurn, sprite_index) 
    
    if ((is_sprite_finished() && inMach3) || inInsta) && grounded
    {
        stateSwitch(PlayerStates.MACH3, "turn")
        return
    }
    
    if ((is_sprite_finished() && inMach2) || inInsta) && grounded
    {
        stateSwitch(PlayerStates.MACH2, "turn")
        return
    }
    return;
}
