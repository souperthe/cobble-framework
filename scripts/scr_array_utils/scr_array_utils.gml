/// @param {Array} targetArray
function array_random(targetArray)
{
    var arrayLength = array_length(targetArray);
    var arrayRandomIndex = irandom(arrayLength - 1);
    return targetArray[arrayRandomIndex];
}
