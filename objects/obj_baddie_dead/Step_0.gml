
if velocityY < gravMax
    velocityY += grav

angle += grav * angleDirection

x += velocityX
y += floor(velocityY)