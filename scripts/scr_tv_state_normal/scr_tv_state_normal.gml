/// @self obj_tv
function scr_tv_state_normal(targetPlayer)
{
    var blacklistStates = [
        PlayerStates.SJUMP,
        PlayerStates.MACHROLL,
        PlayerStates.HITSUN,
        PlayerStates.SUPLEXDASH,
        PlayerStates.WALLCLIMB,
        PlayerStates.MACH2,
        PlayerStates.TAUNT
    ]
    
    if array_contains(blacklistStates, targetPlayer.stateCurrentEnum)
        return
    
    var idleAnimations = [spr_tv_idleanim1, spr_tv_idleanim2]
    
    tvExpressionSpriteSpeed = 0.4
    
    if tvExpressionSprite == spr_tv_idle
    {
        tvIdleTime--
        
        
        if tvIdleTime <= 0
        {
            var idleAnimation = array_random(idleAnimations)
            tvIdleTime = random_range(200, 250)
            tvExpressionSprite = idleAnimation
            tvExpressionSpriteFrame = 0
        }
    }
    
    if array_contains(idleAnimations, tvExpressionSprite)
    {
        
        if tvExpressionSpriteFrame >= sprite_get_number(tvExpressionSprite)
        {
            tvExpressionSprite = spr_tv_idle
        }
        
    }

    if tvTransitionTarget != spr_tv_idle
        tvTransition(spr_tv_idle)
    return
}