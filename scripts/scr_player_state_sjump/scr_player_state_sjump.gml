/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_sjump_enter(enterMessage)
{
    velocitySuperJump = -12
    velocityX = 0
    sprite_index = spriteGet("superjump")
    image_speed = 0.5
    soundSuperJump = super_sound_oneshot_emitter(emitter, sfx_superjumprelease)
    effectPiledriverTimer = 0
    scr_effect_create("explosion", x, y)
    return;
}

/// @self obj_player
function scr_player_state_sjump_exit()
{
    audio_stop_sound(soundSuperJump)
    return;
}

/// @self obj_player
function scr_player_state_sjump_step()
{
    
    var move = check_input("right", true) - check_input("left", true)
    
    if sprite_index == spriteGet("Sjumpcancelstart")
    {
        velocityY = 0
        velocityX = 0
        
        if move != 0
            scaleX = move
        
        if is_sprite_finished()
        {
            stateSwitch(PlayerStates.MACH3, "sjumpcancel")
            return
        }
        return
    }
        
    if sprite_index == spriteGet("superjump")
    {
        velocityY = velocitySuperJump
        
        effectPiledriverTimer--
        
        if effectPiledriverTimer < 0
        {
            scr_effect_create("piledriver", x, y, 1, -1)
            effectPiledriverTimer = 15
        }
        
        stepTime--
    
        if stepTime < 0
        {
            var randomX = irandom_range(-25, 25)
            var randomY = irandom_range(-10, 35)
            scr_effect_create("cloudeffect", x + randomX, y + randomY)
            stepTime = 8
        }
    }
    
    
    velocitySuperJump -= 0.1
    
    if bufferVertical <= 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_destructible)
    {
        stateSwitch(PlayerStates.SJUMPLAND)
        return
    }
    
    if (check_input("dash", false) || check_input("attack", false)) && sprite_index != spriteGet("Sjumpcancelstart")
    {
        sprite_index = spriteGet("Sjumpcancelstart")
        image_index = 0
        super_sound_oneshot_emitter(emitter, sfx_sjumpcancel)
        audio_stop_sound(soundSuperJump)
    }
    
    return;
}
