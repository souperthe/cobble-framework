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
		arguments: ["<Asset.GMRoom>", "<String>"],
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
		arguments: ["<Real>"],
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
		arguments: ["<String>", "<String>"],
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
		arguments: ["<Asset.GMObject>", "<Real>", "<Real>"],
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
		arguments: ["<Asset.GMObject>"],
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
		arguments: ["<Asset.GMObject>", "<String>", "<Any>"],
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

function sh_camera_lock(args)
{
    var targetLock = args[1]
    targetLock = string_lower(targetLock)
    targetLock = convert_string_to_value(targetLock)
    
    var targetLockType = typeof(targetLock)
    
    if targetLockType != "bool"
        return;
    
    obj_camera.lock = targetLock
    return
}

function meta_camera_lock()
{
    return {
		description: "locks the camera",
		arguments: ["<Bool>"],
		suggestions: [
            ["true", "false"]
		],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}

function sh_set_combo(args)
{
    var targetCombo = real(args[1])
    
    trace(targetCombo)
    
    global.combo = targetCombo
    global.comboTime = global.comboTimeMax
    
    with obj_player
        superCharge = 10
    return
}

function meta_set_combo()
{
    return {
		description: "sets the combo",
		arguments: ["<Real>"],
		suggestions: [],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}

function sh_set_panic(args)
{
    var targetEnabled = convert_string_to_value(args[1])
    
    if targetEnabled == false
    {
        global.panic = false
        return
    }
    
    var targetMinutes = real(args[2])
    var targetSeconds = real(args[3])
    
    global.panic = true
    global.panicTime = time_in_frames(targetMinutes, targetSeconds)
    global.panicTimeMax = global.panicTime
    global.signalPanic.fire()
    
    obj_music.musicPanicStart()
    return
}

function meta_set_panic()
{
    return {
		description: "enables pizza time",
		arguments: ["<Bool>", "<Real>", "<Real>"],
		suggestions: [
            ["true", "false"],
            "2",
            "30"
        ],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}

function sh_global_set_var(args)
{
    var targetVariableName = args[1]
    var targetVariableValue = args[2]
    
    targetVariableValue = convert_string_to_value(targetVariableValue)
    
    trace(targetVariableName)
    trace(targetVariableValue)
    
    variable_global_set(targetVariableName, targetVariableValue)
    return
}

function meta_global_set_var() {
	return {
		description: "set a variable on an object",
		arguments: ["<String>", "<Any>"],
		suggestions: [
			variable_instance_get_names(global),
		],
		argumentDescriptions: [],
		hidden: false,
		deferred: false
	}
}