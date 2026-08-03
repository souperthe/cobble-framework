/// @self obj_tv
function scr_tv_state_mach3(targetPlayer)
{
    var targetTv = spr_tv_exprmach3
    
    if targetPlayer.machMode
        targetTv = spr_tv_exprmach4
    
    tvExpressionSpriteSpeed = 0.35
    
    if tvTransitionTarget != targetTv
        tvTransition(targetTv)

    return
}