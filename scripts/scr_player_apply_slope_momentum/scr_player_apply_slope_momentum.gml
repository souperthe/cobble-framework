/// @self obj_player
/// @param {Real} accel
/// @param {Real} deccel
function scr_player_apply_slope_momentum(accel, deccel)
{
    
    with instance_place(x, y + 1, obj_slope)
    {
        var apply = accel
        
        if !(abs(image_yscale) < abs(image_xscale))
            apply = deccel
        
        other.moveSpeed += apply
    }

    return
}