if !global.panic
{
    
    if surface_exists(barSurface)
        surface_free(barSurface)
    
    exit
}

if !surface_exists(barSurface)
    barSurface = surface_create(298, 30)

var hudX = obj_screensizer.hudWidth
var hudY = obj_screensizer.hudHeight
var centerX = hudX / 2
var timerX = centerX - 153
var timerY = hudY + timerYOffset

var barCurrentPosition = global.panicTimeMax - global.panicTime
var barPercentage = barCurrentPosition / global.panicTimeMax
var barMaxX = 299
var barPosition = barMaxX * barPercentage
var barFillPosition = floor(barPosition) + 13

if barFillPosition > 0
{
    surface_resize(barSurface, barFillPosition, 30)
    surface_set_target(barSurface)
    draw_clear_alpha(c_black, 0)
    
    var clipX = timerX + 3
    var clipY = timerY + 5
    var repeatOffset = 0
    
    repeat 3
    {
        draw_sprite(spr_timer_barfill, 0, barFillX + repeatOffset, 0)
        repeatOffset += 173
    }
    
    surface_reset_target()
    draw_surface(barSurface, clipX, clipY)
}

draw_sprite(spr_timer_bar, 0, timerX, timerY)
draw_sprite(johnSprite, johnIndex, timerX + 13 + barPosition, timerY + 20)
draw_sprite(pizzaFaceSprite, pizzaFaceIndex, timerX + 320, timerY + 10)

var panicTime = floor(global.panicTime / 60)
var panicMinutes = panicTime div 60
var panicSeconds = panicTime mod 60

global.panicMinutes = panicMinutes
global.panicSeconds = panicSeconds

var stringPanicSeconds = string_replace_all(string_format(panicSeconds, 2, 0), " ", "0")
var stringPanicMinutes = string(panicMinutes)
var stringPanicTime = string_concat(stringPanicMinutes, ":", stringPanicSeconds)

draw_set_font(global.fontBig)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(timerX + 153, timerY + 14, stringPanicTime)