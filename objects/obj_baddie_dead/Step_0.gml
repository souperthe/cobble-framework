audio_emitter_position(emitter, x, y, 0)

if velocityY < gravMax
    velocityY += grav

angle += grav * angleDirection

x += velocityX
y += floor(velocityY)