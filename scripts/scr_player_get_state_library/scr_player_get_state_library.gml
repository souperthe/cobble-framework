
/// @param {String} targetStateName
function PlayerState(targetStateName) constructor 
{
    var statePrefix = "scr_player_state_" + targetStateName
    var stateEnterPath = statePrefix + "_enter"
    var stateStepPath = statePrefix + "_step"
    var stateExitPath = statePrefix + "_exit"
    
    stateEnter = asset_get_index(stateEnterPath);
    stateStep = asset_get_index(stateStepPath);
    stateExit = asset_get_index(stateExitPath);
    stateName = targetStateName
    
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
    stateLibrary[PlayerStates.WALLCLIMB] = new PlayerState("wallclimb")
    stateLibrary[PlayerStates.UPPERCUT] = new PlayerState("uppercut")
    stateLibrary[PlayerStates.BUMP] = new PlayerState("bump")
    stateLibrary[PlayerStates.SJUMPPREP] = new PlayerState("sjumpprep")
    stateLibrary[PlayerStates.SJUMPLAND] = new PlayerState("sjumpland")
    stateLibrary[PlayerStates.SJUMP] = new PlayerState("sjump")
    stateLibrary[PlayerStates.FREEFALL] = new PlayerState("freefall")
    stateLibrary[PlayerStates.FREEFALLLAND] = new PlayerState("freefallland")
    stateLibrary[PlayerStates.HITSUN] = new PlayerState("hitstun")
    
    return stateLibrary;
}