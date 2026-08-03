/// @self obj_tv
function scr_tv_state_normal(targetPlayer)
{
    var targetTv = spr_tv_idle
    image_speed = 0.4

    if tvTransitionTarget != targetTv
        tvTransition(targetTv)
    return
}