sprite_index = spr_tv_off
image_speed = 0.4

paletteIndex = 0

tvTargetPlayer = obj_player
tvTransition = 0;
tvIdleTime = 200;
tvExpressionSprite = spr_tv_idle
tvExpressionSpriteFrame = 0
tvExpressionSpriteSpeed = 0.25
tvExpressionStates = scr_tv_get_state_expressions()
tvBackroundFrame = 0
tvTransitionTarget = tvExpressionSprite
tvWhiteFade = 0
tvYOffset = 0
tvX = 0
tvY = 0


tvExpressionForce = spr_tv_exprcollect
tvExpressionForceTime = 0

tvTransition = function(targetSprite)
{
    if tvTransitionTarget == targetSprite
        exit
    
    if stateCurrent == TvStates.transition
        exit
    
    tvTransitionTarget = targetSprite
    sprite_index = spr_tv_whitenoise
    image_index = 0
    image_speed = 0.4
    stateCurrent = TvStates.transition
    tvWhiteFade = 0
    return
}
tvTurnOff = function()
{
    sprite_index = spr_tv_off
    image_speed = 0.4
    stateCurrent = TvStates.off
    return
}
tvTurnOn = function()
{
    sprite_index = spr_tv_open
    image_speed = 0.4
    stateCurrent = TvStates.enter
    audio_play_sound(sfx_tvon, 0, false, 0.5, 0, random_pitch())
    return
}
tvForceExpression = function(sprite, time)
{
    tvExpressionForce = sprite
    tvExpressionForceTime = time
    return
}

stateCurrent = TvStates.off
stateLibrary = []
stateLibrary[TvStates.enter] = function() 
{
    if is_sprite_finished()
    {
        sprite_index = spr_tv_empty
        stateCurrent = TvStates.normal
        tvWhiteFade = 1
    }
    
    return
}
stateLibrary[TvStates.normal] = function() 
{
    
    var playerState = tvTargetPlayer.stateCurrentEnum
    var expressionState = tvExpressionStates[playerState]
    
    
    if !(stateCurrent >= 0 && stateCurrent < array_length(tvExpressionStates))
    {
        scr_tv_state_normal(tvTargetPlayer)
        return
    }
    
    if tvExpressionForceTime > 0
    {
        
        tvExpressionForceTime--
        
        if tvTransitionTarget != tvExpressionForce
            tvTransition(tvExpressionForce)
        
        return
    }
    
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
        tvWhiteFade = 0
        tvExpressionSpriteFrame = 0
    }
    return
}

tvTurnOff()
