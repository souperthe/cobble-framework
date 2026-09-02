image_speed = 0.35

paletteSprite = -1
paletteIndex = 0


state = 0


states = []

states[0] = function() 
{
    
    var touchingPlayer = instance_place(x, y, obj_player)
    
    if touchingPlayer == noone
    {
        return
    }
    
    if image_alpha != 1
    {
        return
    }
    
    obj_camera.lock = true
    
    touchingPlayer.stateSwitch(PlayerStates.UNINITIALIZED)
    touchingPlayer.visible = false
    touchingPlayer.velocityX = 0
    touchingPlayer.velocityY = 0
    touchingPlayer.moveSpeed = 0
    touchingPlayer.moveAndCollide = false
    
    super_sound_oneshot(x, y, sfx_secretenter)
    super_sound_oneshot(x, y, sfx_lapenter)
    
    sprite_index = spr_pizzaportal_enter_p
    image_index = 0
    
    paletteSprite = touchingPlayer.paletteSprite
    paletteIndex = touchingPlayer.paletteIndex
    
    global.comboTime = global.comboTimeMax
    
    state = 1
    
    if !scr_save_room_contains(id)
    {
        global.collect += 3000
        obj_hud_score.smallNumber(x, y, 3000)
        
        scr_save_room_register(id)
    }
    
    return
}

states[1] = function() 
{
    
    if !is_sprite_finished()
    {
        exit
    }
    
    
    sprite_index = spr_pizzaportal_idle
    image_index = 0
    image_speed = 0
    
    if instance_exists(obj_room_warp)
    {
        exit
    }
    
    scr_save_room_remove_type_all(obj_escapecollect)
    scr_save_room_remove_type_all(obj_escapecollect_big)
    
    global.warpDoor = "LAP"
    global.warpRoom = targetRoom
    global.panicLap++
    
    obj_music.musicPanicStartLap()
    instance_create_depth(0, 0, 0, obj_room_warp)
    
    return
}