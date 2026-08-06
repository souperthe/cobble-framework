

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

/// @param {Real} minimum 
/// @param {Real} maximum
/// @param {Real} period
/// @param {Real} phase
/// @param {Real} [timeMiliseconds]
/// @return {Real}
function wave(minimum, maximum, period, phase, timeMiliseconds = undefined)
{
    var amplitude = (maximum - minimum) * 0.5
    var midpoint = minimum + amplitude
    var seconds = current_time
    
    if timeMiliseconds != undefined
        seconds = timeMiliseconds
    
    seconds = seconds * 0.001

    return midpoint + sin(((seconds / period) + phase) * 2 * pi) * amplitude
}