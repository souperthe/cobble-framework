scr_rigid_body_step()


var bufferNames = struct_get_names(playerBuffers)

for (var index = 0; index < array_length(bufferNames); index++)
{
    var bufferName = bufferNames[index]
    
    if playerBuffers[$ bufferName] > 0 
    {
        playerBuffers[$ bufferName]--
        continue
    }
    
    struct_remove(playerBuffers, bufferName)
    continue
}