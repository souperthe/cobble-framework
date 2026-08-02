/// @self obj_player
function scr_player_jump_stop()
{
    
    if !check_input("jump", true) && !jumpStop && velocityY < 0.5
    {
        velocityY /= 20
        jumpStop = true
    }
    
    if grounded && velocityY > 0
        jumpStop = false
    
    return
}