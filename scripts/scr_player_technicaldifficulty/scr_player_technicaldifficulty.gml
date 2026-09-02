/// @self obj_player
function scr_player_technicaldifficulty()
{
    if stateCurrentEnum == PlayerStates.UNINITIALIZED
        return
    
    if y < room_height + 300
    {
        return
    }
    
    if y < -800
    {
        return
    }
    
    velocityX = 0
    velocityY = 0
    moveSpeed = false
    moveAndCollide = false
    stateSwitch(PlayerStates.UNINITIALIZED)
    
    obj_camera.shake(10, 0.3)
    super_sound_oneshot(x, room_height - 100, sfx_groundpound)
    instance_create_depth(0, 0, 0, obj_technicaldifficulty)

    return
}
