comboPositionX = wave(-5, 5, 2, 20)
comboFillIndex += 0.35;

if comboFillIndex > sprite_get_number(spr_tv_combobubblefill) - 1
    comboFillIndex = frac(comboFillIndex)


if global.comboTime > 0 && global.combo != 0
{
    
    var comboStateFunction = comboStateLibrary[comboState]

    if !is_undefined(comboStateFunction)
        script_execute(comboStateFunction)
    
}
else
{ 
    comboPositionY = approach(comboPositionY, -500, 5)
    comboVelocityY = 0 
    comboState = ComboStates.DROPIN
}


if comboShake > 0
    comboShake = approach(comboShake, 0, 0.1)


if global.comboTimePause > 0
    global.comboTimePause--


if global.comboTime > 0 && global.comboTimePause <= 0 && !array_contains(comboPlayerStatePause, playerTarget.stateCurrentEnum)
    global.comboTime -= 0.15

if global.comboTime <= 0 && global.combo >= 1
{
    global.comboSaved = global.combo
    global.combo = 0
    global.comboTime = 0
    global.comboBreaks += 1
    global.comboDropped = true
    
    audio_play_sound(sfx_combocash, 0, false, 1, 0, random_pitch())
    instance_create_depth(0, 0, depth, obj_hud_comboend)
}

if global.comboTime > 0 && global.combo > 0
    comboVisual = string(global.combo)



var lengthCurrent = string_length(comboVisual)
var lengthPrevious = string_length(comboPrevious)

if array_length(comboCharacterScales) != lengthCurrent
{
    array_resize(comboCharacterScales, lengthCurrent)
    
    for (var index = 0; index < lengthCurrent; index++)
    {
        var characterScale = comboCharacterScales[index]
        
        if is_undefined(characterScale)
            comboCharacterScales[index] = 1
        
        continue
    }
}

for (var index = 1; index <= lengthCurrent; index++)
{
    var characterCurrent = string_char_at(comboVisual, index)
    var characterPrevious = (index <= lengthPrevious) ? string_char_at(comboPrevious, index) : "";
    
    if characterCurrent == characterPrevious
        continue
    
    comboCharacterScales[index - 1] = 1.5
    continue
}

for (var index = 0; index < lengthCurrent; index++)
{
    
    var characterScaleCurrent = comboCharacterScales[index]
    
    comboCharacterScales[index] = approach(characterScaleCurrent, 1, 0.1)
    continue
}

comboPrevious = comboVisual
