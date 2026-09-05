

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

function convert_string_to_value(inputString) {
    if (inputString == "true") return true;
    if (inputString == "false") return false;
    
    var assetIndex = asset_get_index(inputString)
    if (assetIndex != -1) return assetIndex
    
    var stringLength = string_length(inputString)
    
    var isNumeric = true
    var hasDecimal = false
    
    for (var characterIndex = 1; characterIndex <= stringLength; characterIndex++) {
        var currentChar = string_char_at(inputString, characterIndex);
        
        if (currentChar == "." && !hasDecimal) {
            hasDecimal = true
            continue
        }
        
        if (currentChar < "0" || currentChar > "9") {
            
            if (characterIndex == 1 && currentChar == "-") 
                continue;
            
            isNumeric = false
            break
        }
    }
    
    if (isNumeric && inputString != "") {
        return real(inputString);
    }
    
    return inputString;
}