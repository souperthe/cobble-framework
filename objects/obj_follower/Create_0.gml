
imageSpeedTarget = 0.35

playerFollowing = obj_player

offsetX = -24
interp = 0.05
instaKilled = false

imageOffsetX = 0
imageOffsetY = 0


lagSteps = 10

playerLastX = playerFollowing.x
playerLastY = playerFollowing.y

locked = false
scaleX = 1

array_push(playerFollowing.followers, id)

followerIndex = array_get_index(playerFollowing.followers, id)
followerObject = playerFollowing
followHistory = []

if followerIndex > 0
    followerObject = playerFollowing.followers[followerIndex - 1]

followerDirection = followerObject.scaleX

spriteIdle = spr_player_barrelidle
spriteMove = spr_player_barrelmove
spriteTaunt = spr_player_barrelroll
spriteIdlePanic = spr_player_barrelfloat
spriteIntro = spr_player_supertaunt4

tauntEffect = "taunt"


introPerformed = false

moving = false
movingBuffer = 0

image_speed = imageSpeedTarget
depth = followerObject.depth + 1
persistent = true

