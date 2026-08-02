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

spriteGet = function(spriteName)
{
    var spritePrefix = "spr_player_"
    var spritePath = spritePrefix + spriteName
    var spriteIndex = asset_get_index(spritePath)
    
    return spriteIndex
}


stateSwitch(PlayerStates.NORMAL)