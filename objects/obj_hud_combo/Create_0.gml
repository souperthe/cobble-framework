depth = 1
playerTarget = obj_player

comboPositionX = 0
comboPositionY = -500
comboVelocityY = 0
comboVelocityX = 0
comboPaletteIndex = 0

comboFillIndex = 0
comboFillX = 0
comboFillY = 0

comboState = ComboStates.DROPIN
comboStateLibrary = []
comboShake = 0
comboVisual = "0"
comboPrevious = ""
comboCharacterScales = []
comboLostVisual = false
comboMilestone = undefined

/// @param {Real} comboTime
comboAdd = function(comboTime)
{
    global.combo += 1
    global.comboTime = comboTime
    comboShake = 2.5
    comboLostVisual = global.comboDropped
    
    if global.combo < global.comboMilestone
    {
        return
    }
    
    if instance_exists(comboMilestone)
    {
        instance_destroy(comboMilestone)
    }
    
    comboMilestone = instance_create_depth(x, y, depth, obj_hud_combomilestone)
    comboMilestone.combo = global.combo
    global.comboMilestone = global.combo + 10
    return
}

comboShakeGet = function()
{
    return random_range(-comboShake, comboShake)
}
comboPlayerStatePause = [PlayerStates.DOOR]


comboStateLibrary[ComboStates.DROPIN] = function()
{
    comboPositionY += comboVelocityY
    comboVelocityY += 0.5
    
    if comboPositionY > 20
    {
        comboState = ComboStates.SETTLE
    }
    
    return
}

comboStateLibrary[ComboStates.SETTLE] = function()
{
    
    comboPositionY = lerp(comboPositionY, 0, 0.05)
    
    if comboPositionY < 1
    {
        comboVelocityY = 0
        comboPositionY = 0
        comboState = ComboStates.HOLD
    }
    
    return
}

comboStateLibrary[ComboStates.HOLD] = function()
{
    
    if global.comboTime < 30
    {
        comboPositionY += comboVelocityY
        
        if comboVelocityY < 20
            comboVelocityY += 0.5
        
        if comboPositionY > 0
        {
            comboPositionY = 0
            
            if global.comboTime < 15
                comboVelocityY = -2
            else
                comboVelocityY = -1
            
        }
    }
    else
    {
        comboPositionY = approach(comboPositionY, 0, 10)
    }
    return
}