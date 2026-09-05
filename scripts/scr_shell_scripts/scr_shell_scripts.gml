function sh_room_goto(args)
{
    var targetRoom = args[1]
    var targetDoor = args[2]
    
    targetDoor = string_upper(targetDoor)
    
    var assetRoom = asset_get_index(targetRoom)
    
    if assetRoom == -1
    {
        return
    }
    
    global.warpObject = noone
    global.warpBox = false
    global.warpHallway = false
    global.warpVerticalHallway = false
    global.warpDoor = targetDoor
    
    room_goto(assetRoom)
    
    return
}

function meta_room_goto() {
	return {
		description: "go to a room",
		arguments: ["targetRoom", "targetDoor"],
		suggestions: [
			"rm_test",
			["A", "B", "C", "D", "E", "F"]
		],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}

function sh_game_fps(args)
{
    var targetSpeed = args[1]
    targetSpeed = real(targetSpeed)
    
    game_set_speed(targetSpeed, gamespeed_fps)
    return
}

function meta_game_fps() {
	return {
		description: "sets the games speed",
		arguments: ["targetSpeed"],
		suggestions: [],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}

function sh_player_switch_state(args)
{
    var targetState = args[1]
    var targetMessage = args[2]
    
    var targetStateEnum = global.playerStateNamesEnum[$ targetState]
    
    with obj_player
        stateSwitch(targetStateEnum, targetMessage)
    return
}

function meta_player_switch_state() {
	return {
		description: "switches the players state",
		arguments: ["targetState", "targetMessage"],
		suggestions: [global.playerStateNames],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}