event_inherited();

if velocityY > 0 && grounded
    velocityY = approach(velocityX, 0, 0.5)

grabIndex += 0.35
grabAllow = grounded
