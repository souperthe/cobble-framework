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
			asset_get_names(asset_room),
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

function sh_player_state_switch(args)
{
    var targetState = args[1]
    var targetMessage = args[2]
    
    var targetStateEnum = global.playerStateNamesEnum[$ targetState]
    
    with obj_player
        stateSwitch(targetStateEnum, targetMessage)
    return
}

function meta_player_state_switch() {
	return {
		description: "switches the players state",
		arguments: ["targetState", "targetMessage"],
		suggestions: [global.playerStateNames],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}


function sh_object_create(args)
{
    var targetObject = args[1]
    var targetX = args[2]
    var targetY = args[3]
    
    targetObject = asset_get_index(targetObject)
    
    if targetObject == -1
        return;
    
    instance_create_depth(targetX, targetY, 0, targetObject)
    return
}

function meta_object_create()
{
    return {
		description: "creates an object",
		arguments: ["targetObject", "targetX", "targetY"],
		suggestions: [
			asset_get_names(asset_object),
            mouseArgumentType.worldX,
            mouseArgumentType.worldY
		],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}


function sh_object_destroy(args)
{
    var targetObject = args[1]
    
    targetObject = asset_get_index(targetObject)
    
    if targetObject == -1
        return;
    
    with targetObject
        instance_destroy()
    return
}

function meta_object_destroy()
{
    return {
		description: "destroys an object",
		arguments: ["targetObject"],
		suggestions: [
			asset_get_names(asset_object),
		],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}

function sh_object_set_var(args)
{
    var targetObject = args[1]
    var targetVariableName = args[2]
    var targetVariableValue = args[3]
    
    targetVariableValue = convert_string_to_value(targetVariableValue)
    targetObject = asset_get_index(targetObject)
    
    if targetObject == -1
        return;
    
    if asset_get_type(targetObject) != asset_object
        return;
    
    with targetObject
    {
        variable_instance_set(id, targetVariableName, targetVariableValue)
        continue
    }
    return
}

function meta_object_set_var() {
	return {
		description: "set a variable on an object",
		arguments: ["targetObject", "targetVariableName", "targetVariableValue"],
		suggestions: [
			asset_get_names(asset_object),
            function()
            {
                var consoleString = obj_shell.consoleString
                var consoleStringSplit = string_split(consoleString, " ")
                
                var objectName = consoleStringSplit[1]
                var objectIndex = asset_get_index(objectName)
                
                if objectIndex == -1
                    return "INVALID OBJECT"
                
                var objectVariables = []
                
                with objectIndex
                    objectVariables = variable_instance_get_names(id)
                
                return objectVariables
            }
		],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}