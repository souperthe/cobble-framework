effectsActive = []
effectsLibrary = scr_effects_get()


effectFunctionLoop = function(targetFunction)
{
    
    for (var index = 0; index < array_length(effectsActive); index++)
    {
        var effect = array_get(effectsActive, index)
        
        targetFunction(effect)
        continue
    }
    
    return
}

/// @param {Struct.Effect} effect
effectStep = function(effect)
{
    var spriteNumber = sprite_get_number(effect.spriteIndex)
    var spriteFrameFloored = floor(effect.spriteFrame)
    
    if spriteFrameFloored >= spriteNumber - 1 && !effect.loops && !effect.persistent
    {
        effectDelete(effect)
    }
    else {
        
        if !(effect.persistent && spriteFrameFloored >= spriteNumber - 1)
            effect.spriteFrame += effect.spriteSpeed
            
        
    }
    return
}

/// @param {Struct.Effect} effect
effectDraw = function(effect)
{
    draw_sprite_ext(effect.spriteIndex, effect.spriteFrame, effect.x, effect.y, effect.scaleX, effect.scaleY, 0, c_white, 1)
    return
}

/// @param {Struct.Effect} effect
effectDelete = function(effect)
{
    var effectIndex = array_get_index(effectsActive, effect)
    array_delete(effectsActive, effectIndex, 1)
    
    delete effect
    return
}