var collectCurrent = global.collect
var collectSubtraction = 0

for (var index = 0; index < array_length(collectList); index++)
{
    var collect = collectList[index];
    
    collectSubtraction += collect.collectValue
    
    collectProcess(collect);
    continue
}

var collectFinal = collectCurrent - collectSubtraction

collectVisual = string(collectFinal)
collectShake = approach(collectShake, 0, 3)

var lengthCurrent = string_length(collectVisual)
var lengthPrevious = string_length(collectPrevious)

var currentArrayLen = array_length(collectOffsets);

if (currentArrayLen != lengthCurrent)
{
    array_resize(collectOffsets, lengthCurrent)
    
    for (var index = currentArrayLen; index < lengthCurrent; index++)
    {
        collectOffsets[index] = 0
        continue
    }
}

for (var index = 0; index < lengthCurrent; index++)
{
    var currCharIdx = lengthCurrent - index
    var prevCharIdx = lengthPrevious - index
    
    var characterCurrent = string_char_at(collectVisual, currCharIdx)
    var characterPrevious = (prevCharIdx > 0) ? string_char_at(collectPrevious, prevCharIdx) : ""
    
    var offsetIndex = currCharIdx - 1;
    
    if (characterCurrent != characterPrevious)
    {
        collectOffsets[offsetIndex] = 25
    }
}

for (var index = 0; index < lengthCurrent; index++)
{
    var offsetCurrent = collectOffsets[index]
    collectOffsets[index] = approach(offsetCurrent, 0, 8)
    continue
}

collectPrevious = collectVisual

var playerGuiPositionX = get_gui_position_x(obj_hud_tv.tvTargetPlayer)
var playerGuiPositionY = get_gui_position_y(obj_hud_tv.tvTargetPlayer)
var offsetTarget = 0

if playerGuiPositionX < 210 && playerGuiPositionY < 120
    offsetTarget = -300

scoreYOffset = approach(scoreYOffset, offsetTarget, 20)