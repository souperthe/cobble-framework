var numberString = string(number)
var numberColor = colorPositive
var numberSymbol = "+"

draw_set_font(global.fontSmallNumber)
draw_set_halign(fa_center)

if number < 0
{
    numberColor = colorNegative
    numberSymbol = "-"
}

draw_set_colour(numberColor)

if !flash
    draw_text(x, y, numberSymbol + numberString)
