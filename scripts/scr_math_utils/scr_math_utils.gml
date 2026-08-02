

/// @param {Real} current
/// @param {Real} target
/// @param {Real} step
function approach(current, target, step)
{
    
    if current < target
    {
        current += step
        
        if current > target
            return target
    }
    else 
    {
    	current -= step
        
        if current < target
            return target
    }
    
    return current
}