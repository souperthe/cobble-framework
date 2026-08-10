if scr_save_room_contains(id)
    exit

scr_debris_explosion(2, x + 16, y + 16, spr_debris_plug, 5, 10)

scr_save_room_register(id)