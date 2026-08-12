var guiWidth = obj_screensizer.hudWidth
var guiHeight = obj_screensizer.hudHeight
var guiCenterWidth = guiWidth / 2
var guiCenterHeight = guiHeight / 2

if staticUse
{
    draw_sprite_stretched(spr_tvstatic, staticIndex, 0, 0, guiWidth, guiHeight)
    exit
}

draw_rectangle_colour(0, 0, guiWidth, guiWidth, backgroundColor, backgroundColor, backgroundColor, backgroundColor, false)
draw_sprite(backgroundSprite, 0, guiCenterWidth, guiCenterHeight)

draw_sprite(characterSprite, characterFrame, guiCenterWidth - 200, guiCenterHeight + 100)
draw_sprite_stretched(spr_technicaldifficulty_text, 0, 0, 0, guiWidth, guiHeight)