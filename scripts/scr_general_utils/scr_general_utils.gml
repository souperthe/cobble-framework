

function sleep(sleepMiliseconds)
{
    
    var timeCurrent = current_time
    var sleepMilisecondsRounded = round(sleepMiliseconds)
    
    do {
    	
    } until ((current_time - sleepMiliseconds) >= sleepMilisecondsRounded);
    
    
    return current_time - sleepMiliseconds
}