
player = -1


paletteSprite = -1
paletteIndex = 0


state = 0

states = []
states[0] = function() 
{
    
    if !is_sprite_finished()
    {
        return
    }
    
    sprite_index = spr_pizzaportal_exit_p
    image_index = 0
    
    with obj_player
    {
        velocityX = 0
        velocityY = 0
        x = other.x
        y = other.y
        collide = false
    }
    
    
    state = 1
    
    super_sound_oneshot(x, y, sfx_secretexit)
    return
}

states[1] = function() 
{
    
    if !is_sprite_finished()
    {
        return
    }
    
    with obj_player
    {
        visible = true
        velocityX = 0
        velocityY = 0
        stateSwitch(PlayerStates.NORMAL)
        collide = true
    }
    
    state = 2
    
    image_index = 0
    sprite_index = spr_pizzaportal_disappear
    
    return
}

states[2] = function()
{
    
    if !is_sprite_finished()
    {
        return
    }
    
    instance_destroy()
    
    return
}

image_speed = 0.35