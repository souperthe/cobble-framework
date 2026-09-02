/// @self obj_player
/// @param {String} enterMessage
function scr_player_state_door_enter(enterMessage)
{
    
    doorX = x
    
    var doorTouching = instance_place(x, y, obj_warp_door)
    
    if doorTouching != noone
        doorX = doorTouching.x + 50
    
    sprite_index = spriteGet("lookdoor")
    image_index = 0
    image_speed = 0.4
    velocityX = 0
    velocityY = 0
    moveAndCollide = false
    moveSpeed = 0
    
    if enterMessage == "pizzaboxdown"
    {
        sprite_index = spriteGet("downpizzabox")
        image_index = 0
        return
    }
    else if enterMessage == "pizzaboxup"
    {
        sprite_index = spriteGet("uppizzabox")
        image_index = 0
        return
    }
    
    
    return;
}

/// @self obj_player
function scr_player_state_door_exit()
{
    
    var move = check_input("right", true) - check_input("left", true)
    
    if move != 0
        scaleX = move
    
    return;
}

/// @self obj_player
function scr_player_state_door_step()
{
    global.comboTimePause = 1
    
    var boxSprites = [spriteGet("uppizzabox"), spriteGet("downpizzabox")]
    if sprite_index == spriteGet("lookdoor")
    {
        x = approach(x, doorX, 5)
        return
    }
    
    if array_contains(boxSprites, sprite_index)
    {
        
        if is_sprite_finished()
        {
            image_index = image_number - 1
            
            if !instance_exists(obj_room_warp)
                instance_create_depth(x, y, 0, obj_room_warp)
        }
        return
    }
    
    
    if instance_place(x, y, obj_gate_exit)
    {
        return
    }
    
    moveAndCollide = true
    
    if is_sprite_finished()
        stateSwitch(PlayerStates.NORMAL)
    return;
}
