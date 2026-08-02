
/// @param {String} stateName
function PlayerState(stateName) constructor 
{
    var statePrefix = "scr_player_state_" + stateName
    var stateEnterPath = statePrefix + "_enter"
    var stateStepPath = statePrefix + "_step"
    var stateExitPath = statePrefix + "_exit"
    
    stateEnter = asset_get_index(stateEnterPath);
    stateStep = asset_get_index(stateStepPath);
    stateExit = asset_get_index(stateExitPath);
    
    if stateEnter == -1
        show_error(stateEnterPath + " is not a valid script!", true)
    
    if stateStep == -1
        show_error(stateStepPath + " is not a valid script!", true)
    
    if stateExit == -1
        show_error(stateExitPath + " is not a valid script!", true)
    
    return
}

function scr_player_get_state_library()
{
    var stateLibrary = []
    
    stateLibrary[PlayerStates.UNINITIALIZED] = new PlayerState("blank")
    stateLibrary[PlayerStates.NORMAL] = new PlayerState("normal")
    stateLibrary[PlayerStates.JUMP] = new PlayerState("jump")
    stateLibrary[PlayerStates.CLIMB] = new PlayerState("climb")
    stateLibrary[PlayerStates.SUPLEXDASH] = new PlayerState("suplexdash")
    stateLibrary[PlayerStates.TAUNT] = new PlayerState("taunt")
    stateLibrary[PlayerStates.MACH2] = new PlayerState("mach2")
    stateLibrary[PlayerStates.MACH3] = new PlayerState("mach3")
    stateLibrary[PlayerStates.MACHROLL] = new PlayerState("machroll")
    stateLibrary[PlayerStates.MACHSLIDE] = new PlayerState("machslide")
    
    
    return stateLibrary;
}