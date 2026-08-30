

function sleep(sleepMiliseconds)
{
    
    var timeCurrent = current_time
    var sleepMilisecondsRounded = round(sleepMiliseconds)
    
    do {
    	
    } until ((current_time - sleepMiliseconds) >= sleepMilisecondsRounded);
    
    
    return current_time - sleepMiliseconds
}

/// @param {Real} x
/// @param {Real} y
/// @param {String} string
/// @param {Constant.Color} color
/// @param {Real} alpha
function draw_text_colour_simple(x, y, text, color, alpha)
{
    draw_text_colour(x, y, text, color, color, color, color, alpha)
    return
}