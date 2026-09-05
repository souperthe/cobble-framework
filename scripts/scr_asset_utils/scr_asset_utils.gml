
function asset_name_getters()
{
    var getters = []
    
    getters[asset_room] = room_get_name
    getters[asset_sprite] = sprite_get_name
    getters[asset_object] = object_get_name
    
    return getters
}

/// @param {Constant.AssetType} assetType
function asset_get_names(assetType)
{
    var assets = asset_get_ids(assetType)
    var assetsLength = array_length(assets)
    var assetNames = []
    
    static nameGetters = asset_name_getters()
    var nameGetter = nameGetters[assetType]
        
    for (var index = 0; index < assetsLength; index++) 
    {
        var asset = assets[index]
        var assetName = nameGetter(asset)
            
        array_push(assetNames, assetName)
        continue
    }
    
    return assetNames
}