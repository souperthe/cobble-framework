/// @param {Id.Instance} targetInstance
function SaveObject(targetInstance) constructor
{
    objectId = targetInstance
    objectIndex = objectId.object_index
    return
} 

/// @param {Id.Instance} object
function scr_save_room_register(objectId)
{

    var roomName = room_get_name(room)
    
    if !struct_exists(global.levelSaveRoom, roomName)
        global.levelSaveRoom[$ roomName] = []
    
    var saveRoomArray = global.levelSaveRoom[$ roomName]
    var saveObject = new SaveObject(objectId)
    
    array_push(saveRoomArray, saveObject)
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
    var saveRoomLength = array_length(saveRoomArray)
    
    for (var index = 0; index < saveRoomLength; index++)
    {
        var saveObject = saveRoomArray[index]
        
        if saveObject.objectId == objectId
            return true
        
        continue
    }
    
    return false
}

/// @param {Asset.GMObject} object
/// @param {String} room
function scr_save_room_remove_type_room(room, object)
{
    
    if !struct_exists(global.levelSaveRoom, room)
    {
        return
    }
    
    var roomArray = global.levelSaveRoom[$ room]
    var roomArrayLength = array_length(roomArray)
    
    for (var index = roomArrayLength - 1; index >= 0; index--)
    {
        
        var saveObject = roomArray[index]
        var saveObjectIndex = saveObject.objectIndex
        
        if !(saveObjectIndex == object || object_is_ancestor(saveObjectIndex, object))
        {
            continue
        }
        
        array_delete(roomArray, index, 1)
        continue
    }
    
    return
}

/// @param {Asset.GMObject} object
function scr_save_room_remove_type_all(object)
{
    var roomNames = struct_get_names(global.levelSaveRoom)
    var roomNamesLength = array_length(roomNames)
    
    for (var index = 0; index < roomNamesLength; index++)
    {
        var roomName = roomNames[index]
        
        scr_save_room_remove_type_room(roomName, object)
        continue
    }
    return
}