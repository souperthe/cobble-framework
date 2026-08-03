sprite_index = spr_tv_open
image_speed = 0.4
tvTargetPlayer = obj_player
tvTransition = 0;
tvIdleTime = 200;
tvExpressionSprite = spr_tv_idle
tvExpressionSpriteFrame = 0
tvExpressionSpriteSpeed = 0.25
tvExpressionStates = scr_tv_get_state_expressions()
tvBackroundFrame = 0
tvTransitionTarget = tvExpressionSprite
tvClipTransparency = 0
tvTransition = function(targetSprite)
{
    if tvTransitionTarget == targetSprite
        exit
    
    tvTransitionTarget = targetSprite
    sprite_index = spr_tv_whitenoise
    image_index = 0
    image_speed = 0.6
    stateCurrent = TvStates.transition
    return
}
trace(tvExpressionStates)
stateCurrent = TvStates.enter
stateLibrary = []
stateLibrary[TvStates.enter] = function() 
{
    if is_sprite_finished()
    {
        sprite_index = spr_tv_empty
        stateCurrent = TvStates.normal
        tvClipTransparency = 1
    }
    
    return
}
stateLibrary[TvStates.normal] = function() 
{
    
    var playerState = tvTargetPlayer.stateCurrentEnum
    var expressionState = tvExpressionStates[playerState]
    
    if (!is_undefined(expressionState))
    {
        script_execute(expressionState, tvTargetPlayer)
    }
    else
    {
        scr_tv_state_normal(tvTargetPlayer)
    }
    
    return
}
stateLibrary[TvStates.transition] = function() 
{
    if floor(image_index) == (image_number - 1)
    {
        tvExpressionSprite = tvTransitionTarget
        stateCurrent = TvStates.normal
        sprite_index = spr_tv_empty
        tvClipTransparency = 1
        tvExpressionSpriteFrame = 0
    }
    return
}