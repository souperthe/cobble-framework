/// @param {String} path
function file_text_open_read_all(path)
{
    var file = file_text_open_read(path)
    
    if file == -1
    {
        return ""
    }
    
    var fileString = ""
    
    while !file_text_eof(file)
    {
        fileString += file_text_read_string(file)
        file_text_readln(file)
        continue
    }
    
    file_text_close(file)
    return fileString
}