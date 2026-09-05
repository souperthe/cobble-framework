/// @self obj_player
function scr_player_supercharge()
{
    
    static effects = ["supertaunt_1", "supertaunt_2", "supertaunt_3", "supertaunt_4", "supertaunt_5"]
    if superCharge > 9
    {
        
        if !superCharged
        {
            super_sound_oneshot_global(sfx_supertaunt_notif)
            superChargeSound = super_sound_loop_emitter(emitter, sfx_supertaunt_charge, 1.5)
            superCharged = true
        }
    }
    
    if !superCharged
        exit;
    
    superChargeEffect--
    
    if superChargeEffect < 0
    {
        var effect = array_random(effects)
        var effectX = x + irandom_range(-25,25)
        var effectY = y + irandom_range(-10,35)
        
        scr_effect_create(effect, effectX, effectY)
        superChargeEffect = 4
    }

    return
}

/// @self obj_player
function scr_player_supercharge_end()
{
    superCharge = 0
    superCharged = false
    audio_stop_sound(superChargeSound)
    return
}

/// @self obj_player
function scr_player_supercharge_taunt()
{
    static tauntSuperAnimations = [
        "supertaunt1",
        "supertaunt1",
        "supertaunt3",
        "supertaunt4"
    ]
    var tauntSpriteSuper = array_random(tauntSuperAnimations)
    var tauntSprite = spriteGet(tauntSpriteSuper)
    sprite_index = tauntSprite
    image_index = 0
    image_speed = 0.4
    tauntTimer = 25
        
    super_sound_oneshot_global(sfx_supertaunt, random_pitch())
    obj_camera.shake(6, 0.3)
    
    scr_player_supercharge_end()
    
    
    var effectDistance = 32
    var effectCount = 12
    var effectStep = 360 / effectCount
    var effectSpeed = 0.8
    
    for (var index = 0; index < effectCount; index++)
    {
        var angle = index * effectStep
        var directionX = lengthdir_x(effectDistance, angle)
        var directionY = lengthdir_y(effectDistance, angle)
        
        var effect = scr_afterimage_supertaunt()
        effect.stepX = directionX * effectSpeed
        effect.stepY = directionY * effectSpeed
        effect.blend = global.colorMach1
        
        if (index % 2 == 1)
        {
            effect.blend = global.colorMach2
        }
        
        continue
    }
    
    scr_player_supercharge_kill()
    return
}

/// @self obj_player
function scr_player_supercharge_kill()
{
    var camera = view_camera[0]
    var cameraX = camera_get_view_x(camera)
    var cameraY = camera_get_view_y(camera)
    var cameraWidth = camera_get_view_width(camera)
    var cameraHeight = camera_get_view_height(camera)
    
    with obj_baddie
    {
        
        if !point_in_rectangle(x, y, cameraX, cameraY, cameraX + cameraWidth, cameraY + cameraHeight)
            continue;
        
        killedFromX = other.x
        killedFromY = other.y
        stunX = x
        stunY = y
        stateCurrent = BaddieStates.STUN
        alarm[0] = 25
        continue
    }
    return
}