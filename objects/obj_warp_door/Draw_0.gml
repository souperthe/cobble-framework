draw_sprite(sprite_index, image_index, x, y)

var player = instance_place(x, y, obj_player)

if player != noone && playerCanEnter(player)
    draw_sprite(spr_doorarrow, 0, player.x, player.y - 40)