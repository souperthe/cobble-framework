

with (obj_player)
{
    if (!place_meeting(x, y + 1, other))
        continue;
    
    if !check_input("down", false)
        exit
    
    
    if other.climbEnter(self) == true
        y += 5
    
}

