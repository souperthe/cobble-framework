event_inherited();
depth = -10;
stateLibrary = scr_player_get_state_library()
stateCurrentEnum = PlayerStates.UNINITIALIZED
stateCurrent = undefined
moveSpeed = 0;
scaleX = 1;
scaleY = 1;
angle = 0;
dir = 1;
momemtum = false;
emitter = super_sound_create_emitter();
stepTime = 0;
soundSuplex = 0;

tauntState = PlayerStates.UNINITIALIZED
tauntVelocityX = 0;
tauntVelocityY = 0;
tauntMoveSpeed = 0;
tauntSprite = 0;
tauntImageSpeed = 0;
tauntImageIndex = 0;
tauntTimer = 0;

/// @param {enum.PlayerStates} targetState
/// @param {string} enterMessage
stateSwitch = function(targetState, enterMessage = "")
{
    var stateOld = stateCurrent
    var stateNew = stateLibrary[targetState]
    
    if (is_undefined(stateNew))
        return
    
    if stateOld != undefined
        script_execute(stateNew.stateExit)
    
    
    script_execute(stateNew.stateEnter, enterMessage)
    stateCurrent = stateNew
    stateCurrentEnum = targetState
    
    return
}

spriteGet = function(targetSpriteName)
{
    var spritePrefix = "spr_player_"
    var spritePath = spritePrefix + targetSpriteName
    var spriteIndex = asset_get_index(spritePath)
    
    return spriteIndex
}


stateSwitch(PlayerStates.NORMAL)