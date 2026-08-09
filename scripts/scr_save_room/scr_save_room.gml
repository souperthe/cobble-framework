
/// @param {Id.Instance} object
function scr_save_room_register(objectId)
{

    var roomName = room_get_name(room)
    
    if !struct_exists(global.levelSaveRoom, roomName)
        global.levelSaveRoom[$ roomName] = []
    
    var saveRoomArray = global.levelSaveRoom[$ roomName]
    
    array_push(saveRoomArray, objectId)
    return
}

/// @param {Id.Instance} object
/// @return {Bool}
function scr_save_room_contains(objectId)
{

    var roomName = room_get_name(room)
    
    if !struct_exists(global.levelSaveRoom, roomName)
        return false
    
    var saveRoomArray = global.levelSaveRoom[$ roomName]
    
    if !array_contains(saveRoomArray, objectId)
        return false
    
    return true
}
