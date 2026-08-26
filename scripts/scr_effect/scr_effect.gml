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
    depth = 0
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
    effectsLibrary[$ "tinytaunt"] = new Effect(spr_effect_tinytaunt, 0.5, false, true)
    effectsLibrary[$ "playerghost"] = new Effect(spr_player_idle, 0, false, true)
    effectsLibrary[$ "spikehurt"] = new Effect(spr_effect_spikehurt, 0.5)
    effectsLibrary[$ "genericpoof"] = new Effect(spr_effect_genericpoof, 1)
    effectsLibrary[$ "jump"] = new Effect(spr_effect_jump, 0.4)
    effectsLibrary[$ "land"] = new Effect(spr_effect_land, 0.4)
    effectsLibrary[$ "stepcloud"] = new Effect(spr_effect_cloud, 0.7)
    
    effectsLibrary[$ "pizzablockdead_big"] = new Effect(spr_pizzablock_big_die, 0.35)
    effectsLibrary[$ "pizzablocksmall_dead"] = new Effect(spr_pizzablock_small_die, 0.35)
    
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
        return scr_effect_create("bangeffect", targetScaleX, targetScaleY, targetScaleX, targetScaleY)
    
    var effectTarget = struct_get(effectManager.effectsLibrary, effectName)
    var effectCloned = variable_clone(effectTarget)
    
    effectCloned.x = targetX
    effectCloned.y = targetY
    effectCloned.scaleX = targetScaleX
    effectCloned.scaleY = targetScaleY
    effectCloned.depth = depth + 1
    
    array_push(effectManager.effectsActive, effectCloned)
    
    return effectCloned
}
