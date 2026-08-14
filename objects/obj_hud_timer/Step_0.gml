if !global.panic
{
    timerYOffset = timerYOffsetHidden
    exit
}

timerYOffset = approach(timerYOffset, timerYOffsetVisible, 1)


johnIndex += 0.35
pizzaFaceIndex += 0.35

barFillX -= 0.2

if barFillX < -173
    barFillX = 0

global.panicTime--