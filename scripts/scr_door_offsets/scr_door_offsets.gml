/// @returns {Real}
function get_door_offset_x()
{
    
    if global.warpHallway
        return global.warpHallwayDirection * 50
    
    if global.warpBox
        return 32
    
    if global.warpVerticalHallway
        return (global.warpVerticalHallwayPosition * global.warpVerticalHallwaySide)

    return 16
}

/// @returns {Real}
function get_door_offset_y()
{
    
    if global.warpVerticalHallway
        return -global.warpVerticalFlip * 100

    return -14
}