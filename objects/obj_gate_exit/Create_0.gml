image_speed = 0
image_index = 1

entering = false

playerTouching = obj_player
playerStateWhitelist = [PlayerStates.NORMAL, PlayerStates.SJUMPPREP, PlayerStates.MACH2, PlayerStates.MACH3]

slam = function()
{
    super_sound_oneshot(x, y, sfx_groundpound)
    image_index = 0
    obj_camera.shake(10, 1)
    return
}

playerCanEnter = function(player)
{
    
    if !array_contains(playerStateWhitelist, player.stateCurrentEnum)
        return false
    
    if !player.grounded
        return false
    
    if !global.panic
        return false
    
    return true
}