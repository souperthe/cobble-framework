comboCollect()

if comboAmount > 0
{
    if comboCollectTime < 1
        comboCollectTime = 1
    
    alarm[0] = comboCollectTime
    comboCollectTime -= 1
    exit
}

for (var index = 0; index < array_length(obj_hud_score.collectList); index++)
{
    var collectScore = obj_hud_score.collectList[index]
    
    if collectScore != 1
        continue
    
    array_delete(obj_hud_score.collectList, index, 1)
    
    continue
}

comboDelete = true

global.comboScore = 0
