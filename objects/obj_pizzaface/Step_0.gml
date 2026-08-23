audio_emitter_position(emitter, x, y, 0)


if freeze
{
    x = -200
    y = -200
    exit
}

if image_alpha <= 1
{
     image_alpha += 0.01
    exit
}


var moveDirection = point_direction(x, y, targetPlayer.x, targetPlayer.y)
var moveX = lengthdir_x(moveSpeed, moveDirection)
var moveY = lengthdir_y(moveSpeed, moveDirection)

x += moveX
y += moveY


if place_meeting(x, y, targetPlayer)
{
    game_end()
}