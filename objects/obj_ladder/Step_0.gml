

with (obj_player)
{
    if !(place_meeting(x, y + 1, other) && !place_meeting(other.x + 16, y + 1, obj_solid))
        continue;
    
    
    if !check_input("down", false)
        continue
    
    
    if other.climbEnter(self) == true
        y += 5
    
    continue
}

