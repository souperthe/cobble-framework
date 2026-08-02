/// @self obj_player
function scr_player_taunt()
{
    
    trace("taunt")
    
    tauntTimer = 20
    tauntState = stateCurrentEnum
    tauntVelocityX = velocityX
    tauntVelocityY = velocityY
    tauntSprite = sprite_index
    tauntImageIndex = image_index
    tauntImageSpeed = image_speed
    
    
    stateSwitch(PlayerStates.TAUNT)

    return;
}