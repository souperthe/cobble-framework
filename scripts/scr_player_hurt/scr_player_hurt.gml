/// @self obj_player
/// @param {Id.Instance} hazard
function scr_player_hurt(hazard)
{
    if stateCurrentEnum == PlayerStates.CHAINSAWPOGO
        return
    
    if invincibleTimer > 0
        return
    
    var scaleXOld = scaleX
    var hurtMessage = ""
    
    
    if x != hazard.x
        scaleX = sign(hazard.x - x)
    
    if scaleX == -scaleXOld
        hurtMessage = "behind"
    
    if transformationDebris != undefined
    {
        var debris = scr_debris_create(x, y, transformationDebris)
        debris.velocityY = random_range(-5, -10)
        debris.velocityX = random_range(-5, 5)
        super_sound_oneshot_emitter(emitter, sfx_transform_exit, random_pitch())
        transformationDebris = undefined
        transformationCurrent = ""
    }
    
    scr_effect_create("bangeffect", x, y)
    scr_effect_create("spikehurt", x, y)
    scr_debris_explosion(5, x, y, spr_debris_slapstar, 10, 10)
    super_sound_oneshot_emitter(emitter, sfx_pephurt, random_pitch())
    stateSwitch(PlayerStates.HURT, hurtMessage)
    invincibleTimer = 300
    return
}
