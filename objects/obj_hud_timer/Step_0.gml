if !global.panic
{
    exit
}

var targetStep = 1
var targetPosition = timerYOffsetVisible

if instance_exists(obj_ghostcollectibles)
{
    targetStep = 4
    targetPosition = timerYOffsetHidden
}

if showtimeTimer < 0
{
    targetStep = 1
    targetPosition = timerYOffsetHidden
}



timerYOffset = approach(timerYOffset, targetPosition, targetStep)


johnIndex += 0.35
pizzaFaceIndex += 0.35

barFillX -= 0.2

if barFillX < -173
    barFillX = 0



if instance_exists(obj_ghostcollectibles)
    exit


if global.panicTime > 0
{
    global.panicTime--
}
else {
    
    if pizzaFaceSprite == spr_timer_pizzaface1
    {
        pizzaFaceSprite = spr_timer_pizzaface2
        pizzaFaceIndex = 0
        instance_create_depth(obj_player.x, obj_player.y, 0, obj_pizzaface)
    }
    else if pizzaFaceSprite == spr_timer_pizzaface2
    {
        var spriteNumber = sprite_get_number(pizzaFaceSprite)
        var spriteIndex = floor(pizzaFaceIndex)
        
        if spriteIndex == spriteNumber - 1
        {
            pizzaFaceSprite = spr_timer_pizzaface3
            pizzaFaceIndex = 0
        }
    }
    else
    {
        showtimeTimer--
    }

}

if global.panicLap != 0
    exit

if global.panicMinutes != 0
    exit

if global.panicSeconds <= 57
    exit

obj_music.musicMagnetState = 1