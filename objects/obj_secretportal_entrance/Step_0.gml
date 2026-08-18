if sprite_index != spriteClose
{
    exit
}

if !active
    exit


touchedPlayer.scaleVisual = approach(touchedPlayer.scaleVisual, 0, 0.05)
touchedPlayer.velocityX = 0
touchedPlayer.velocityY = 0
touchedPlayer.x = lerp(touchedPlayer.x, x, 0.1)
touchedPlayer.y = lerp(touchedPlayer.y, y, 0.1)


if !is_sprite_finished()
    exit

if transitioning
    exit

instance_create_depth(x, y, depth, obj_room_warp)
visible = false
scr_save_room_register(id)