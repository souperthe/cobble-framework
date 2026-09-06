/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_taunt_enter(enterMessage)
{
    var tauntSprite = spriteGet("taunt")
    var tauntSounds = [sfx_taunt_1]
    var tauntSuper = false
    
    tauntTimer = 20
    
    soundTaunt = -1
    
    if (superCharged || global.cheatAlwaysSuperTaunt) && check_input("up", true)
    {
        scr_player_supercharge_taunt()
        tauntSuper = true
    }
    else 
    {
        sprite_index = tauntSprite
        image_index = irandom(sprite_get_number(tauntSprite) - 1)
        image_speed = 0;
        soundTaunt = super_sound_oneshot_emitter_list(emitter, tauntSounds, random_pitch())
        audio_sound_gain(soundTaunt, 0.5)
    }
    
    effectTaunt = scr_effect_create("taunt", x, y)
    
    var followerLength = array_length(followers)
    
    followerTaunts = []
    
    for (var index = 0; index < followerLength; index++)
    {
        var follower = followers[index]
        
        if !follower.introPerformed
            continue
        
        var followerTaunt = scr_effect_create(follower.tauntEffect, follower.x, follower.y)
        followerTaunts[index] = followerTaunt
        
        follower.locked = true
        
        if tauntSuper
        {
            follower.sprite_index = follower.spriteIntro
            follower.image_index = 0
            follower.image_speed = 0.4
            
            continue
        }
        
        
        follower.sprite_index = follower.spriteTaunt
        follower.image_index = irandom(sprite_get_number(follower.spriteTaunt) - 1)
        follower.image_speed = 0
        
        
        continue
    }
    return;
}

/// @self obj_player
function scr_player_state_taunt_exit()
{
    if soundTaunt != -1
        audio_stop_sound(soundTaunt)
    
    obj_effects_manager.effectDelete(effectTaunt)
    
    var followerLength = array_length(followerTaunts)
    
    for (var index = 0; index < followerLength; index++)
    {
        var follower = followers[index]
        var followerTaunt = followerTaunts[index]
        
        follower.locked = false
        follower.image_speed = follower.imageSpeedTarget
        
        obj_effects_manager.effectDelete(followerTaunt)
        
        continue
    }
    return;
}

/// @self obj_player
function scr_player_state_taunt_step()
{
    velocityX = 0
    velocityY = 0
    
    tauntTimer--;
    effectTaunt.x = x
    effectTaunt.y = y
    
    if tauntTimer > 0
        return
    
    moveSpeed = tauntMoveSpeed
    velocityX = tauntVelocityX
    velocityY = tauntVelocityY
    sprite_index = tauntSprite
    image_index = tauntImageIndex
    image_speed = tauntImageSpeed
    
    stateCurrentEnum = tauntState
    stateCurrent = stateLibrary[tauntState]
    scr_player_state_taunt_exit()
    return;
}
