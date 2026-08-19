collected = []



onCollect = function(collectable)
{
    var collectData = {
        x: collectable.x,
        y: collectable.y,
        sprite: collectable.sprite_index,
        spriteFrame: collectable.image_index
    }
    
    array_push(collected, collectData)
    return
}

global.signalCollected.connect(onCollect)