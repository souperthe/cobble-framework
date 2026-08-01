event_inherited();
stateLibrary = scr_player_get_state_library()
stateCurrentEnum = PlayerStates.UNINITIALIZED
stateCurrent = undefined

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
    
    
    script_execute(stateNew.stateEnter)
    stateCurrent = stateNew
    stateCurrentEnum = targetState
    
    return
}


stateSwitch(PlayerStates.NORMAL)