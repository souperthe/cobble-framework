if !global.panic
{
    timerYOffset = timerYOffsetHidden
    exit
}

var targetStep = 1
var targetPosition = timerYOffsetVisible

if instance_exists(obj_ghostcollectibles)
{
    targetStep = 4
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
    global.panicTime--