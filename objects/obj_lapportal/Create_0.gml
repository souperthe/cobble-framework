image_speed = 0.35

paletteSprite = -1
paletteIndex = 0

enum PortalStates
{
    idle,
    entering
}

state = PortalStates.idle


states = []

states[PortalStates.idle] = function() 
{
    
    var touchingPlayer = instance_place(x, y, obj_player)
    
    if touchingPlayer == noone
    {
        return
    }
    
    obj_camera.lock = true
    
    touchingPlayer.stateSwitch(PlayerStates.UNINITIALIZED)
    touchingPlayer.visible = false
    touchingPlayer.velocityX = 0
    touchingPlayer.velocityY = 0
    touchingPlayer.moveSpeed = 0
    
    super_sound_oneshot(x, y, sfx_secretenter)
    super_sound_oneshot(x, y, sfx_lapenter)
    
    sprite_index = spr_pizzaportal_enter_p
    image_index = 0
    
    paletteSprite = touchingPlayer.paletteSprite
    paletteIndex = touchingPlayer.paletteIndex
    
    global.comboTime = global.comboTimeMax
    
    state = PortalStates.entering
    
    if !scr_save_room_contains(id)
    {
        global.collect += 3000
        obj_hud_score.smallNumber(x, y, 3000)
        
        scr_save_room_register(id)
    }
    
    return
}

states[PortalStates.entering] = function() 
{
    
    if !is_sprite_finished()
    {
        exit
    }
    
    
    sprite_index = spr_pizzaportal_idle
    image_index = 0
    image_speed = 0
    return
}