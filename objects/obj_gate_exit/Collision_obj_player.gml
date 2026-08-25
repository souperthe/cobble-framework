playerTouching = other

if !playerCanEnter(other)
{
    exit
}

if !check_input("up", false)
{
    exit
}

scr_level_rank()