depth = 0
image_speed = 0.35
image_index = 0

waitTime = 80
drop = false


spriteOpen = spr_secretportal_spawnopen
spriteIdle = spr_secretportal_spawnidle
spriteClose = spr_secretportal_spawnclose


spriteStates = []
spriteStates[spriteOpen] = function()
{
    
    obj_camera.lock = false
    
    with obj_player
    {
        x = other.x
        y = other.y
        visible = false
        
        velocityX = 0
        velocityY = 0
        moveSpeed = 0
        scaleVisual = 0
        
        sprite_index = spriteGet("hurt")
        
        continue
    }
    
    global.roomStartX = x
    global.roomStartY = y
    global.comboTimePause = 2
    
    if !is_sprite_finished()
        return
    
    sprite_index = spriteIdle
    image_index = 0
    
    super_sound_oneshot(x, y, sfx_secretexit)
    
    with obj_player
    {
        visible = true
        sprite_index = spriteGet("hurt")
    }
    
    sprite_index = spriteIdle
    
    return
}

spriteStates[spriteIdle] = function()
{
    
    if drop
    {
        if waitTime > 0
            waitTime--
        else
        {
            sprite_index = spriteClose
            image_index = 0
        }    
        return
    }
    
    global.comboTimePause = 2
    
    with obj_player
    {
        x = other.x
        y = other.y - 10
        
        velocityX = 0
        velocityY = 10
        moveSpeed = 0
        scaleVisual = approach(scaleVisual, 1, 0.05)
        
        if scaleVisual == 1
        {
            other.drop = true
            stateSwitch(PlayerStates.FREEFALL, "fromsecret")
        }
        
    }
    return
}

spriteStates[spriteClose] = function()
{
    
    if is_sprite_finished()
        instance_destroy()
    return
}