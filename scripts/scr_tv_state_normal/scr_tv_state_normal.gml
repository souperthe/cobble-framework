/// @self obj_hud_tv
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
    var allIdleAnimations = [spr_tv_idleanim1, spr_tv_idleanim2, spr_tv_idle]
    
    if array_contains(blacklistStates, targetPlayer.stateCurrentEnum) && !array_contains(allIdleAnimations, tvExpressionSprite)
    {
        return
    }
    
    var idleAnimations = [spr_tv_idleanim1, spr_tv_idleanim2]
    var targetIdleAnimation = spr_tv_idle
    
    if global.comboTime > 0
        targetIdleAnimation = spr_tv_exprcombo
    
    if global.panic
        targetIdleAnimation = spr_tv_exprpanic
    
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

    if tvTransitionTarget != targetIdleAnimation
        tvTransition(targetIdleAnimation)
    return
}