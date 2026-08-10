event_inherited()


if !instance_exists(objectId)
    refresh--

if refresh <= 0
{
    image_speed = 0.35
    
    if floor(image_index) == 5
    {
        var objectSpawned = instance_create_depth(x, y - 20, depth - 1, object)
        
        if object_is_ancestor(objectSpawned.object_index, obj_rigid_body)
        {
            objectSpawned.velocityY = -5
        }
        
        if object_is_ancestor(objectSpawned.object_index, obj_baddie)
        {
            objectSpawned.stateCurrent = BaddieStates.STAGGERED
            objectSpawned.staggeredTimer = 200
            objectSpawned.sprite_index = objectSpawned.spriteStun
        }
        
        objectId = objectSpawned
        refresh = 100
    }
}