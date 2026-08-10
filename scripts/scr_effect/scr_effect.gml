/// @param {Asset.GMSprite} targetSprite
/// @param {Real} targetSpeed
function Effect(targetSprite, targetSpeed, loop = false, targetPersistent = false) constructor
{
    spriteIndex = targetSprite
    spriteFrame = 0
    spriteSpeed = targetSpeed
    x = 0
    y = 0
    scaleX = 1
    scaleY = 1
    loops = loop
    persistent = targetPersistent
    return
}


function scr_effects_get()
{
    
    var effectsLibrary = {}
    
    effectsLibrary[$ "bangeffect"] = new Effect(spr_effect_bang, 0.5)
    effectsLibrary[$ "cloudeffect"] = new Effect(spr_effect_cloud, 0.35)
    effectsLibrary[$ "dashcloud"] = new Effect(spr_effect_dashcloud, 0.4)
    effectsLibrary[$ "flamecloud"] = new Effect(spr_effect_flamecloud, 0.4)
    effectsLibrary[$ "smalldashcloud"] = new Effect(spr_effect_smalldashcloud, 0.4)
    effectsLibrary[$ "crazyrun"] = new Effect(spr_effect_crazyrun, 0.5)
    effectsLibrary[$ "explosion"] = new Effect(spr_effect_explosion, 0.5)
    effectsLibrary[$ "piledriver"] = new Effect(spr_effect_piledriver, 0.35)
    effectsLibrary[$ "charge"] = new Effect(spr_effect_charge, 0.5, true)
    effectsLibrary[$ "deadjohnsmoke"] = new Effect(spr_effect_deadjohnsmoke, 0.35)
    effectsLibrary[$ "taunt"] = new Effect(spr_effect_taunt, 0.5, false, true)
    effectsLibrary[$ "spikehurt"] = new Effect(spr_effect_spikehurt, 0.5)
    effectsLibrary[$ "genericpoof"] = new Effect(spr_effect_genericpoof, 1)
    
    return effectsLibrary
}

/// @param {String} effectName
/// @param {Real} targetX
/// @param {Real} targetY
/// @param {Real} targetScaleX
/// @param {Real} targetScaleY
/// @return {Struct.Effect}
function scr_effect_create(effectName, targetX, targetY, targetScaleX = 1, targetScaleY = 1)
{
    
    effectName = string_lower(effectName)
    
    var effectManager = obj_effects_manager
    
    if !struct_exists(effectManager.effectsLibrary, effectName)
        return undefined
    
    var effectTarget = struct_get(effectManager.effectsLibrary, effectName)
    var effectCloned = variable_clone(effectTarget)
    
    effectCloned.x = targetX
    effectCloned.y = targetY
    effectCloned.scaleX = targetScaleX
    effectCloned.scaleY = targetScaleY
    
    array_push(effectManager.effectsActive, effectCloned)
    
    return effectCloned
}
