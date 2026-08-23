
timerYOffsetVisible = -65
timerYOffsetHidden = 212

timerYOffset = timerYOffsetHidden

pizzaFaceSprite = spr_timer_pizzaface1
pizzaFaceIndex = 0

johnSprite = spr_timer_johnface
johnIndex = 0

barSurface = 0
barFillX = 0

showtimeTimer = 100

panicStarted = function()
{
    pizzaFaceSprite = spr_timer_pizzaface1
    timerYOffset = timerYOffsetHidden
    showtimeTimer = 100
    trace("panic started!")
    trace(global.panicTime)
    return
}


global.signalPanic.connect(panicStarted)