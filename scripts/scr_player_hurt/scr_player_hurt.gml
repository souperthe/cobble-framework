/// @self obj_player
/// @param {Id.Instance} hazard
/// @return {Bool}
function scr_player_hurt(hazard)
{
    if stateCurrentEnum == PlayerStates.CHAINSAWPOGO
        return false
    
    if invincibleTimer > 0
        return false
    
    var scaleXOld = scaleX
    var hurtMessage = ""
    
    
    if x != hazard.x
        scaleX = sign(hazard.x - x)
    
    if scaleX == -scaleXOld
        hurtMessage = "behind"
    
    if transformationCurrent != ""
    {
        signalTransformationExit.fire()
    }
    
    scr_effect_create("bangeffect", x, y)
    scr_effect_create("spikehurt", x, y)
    
    scr_debris_explosion(5, x, y, spr_debris_slapstar, 10, 10)
    
    super_sound_oneshot_emitter(emitter, sfx_pephurt, random_pitch())
    stateSwitch(PlayerStates.HURT, hurtMessage)
    invincibleTimer = 300
    return true
}
