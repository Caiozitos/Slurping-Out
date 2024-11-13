movementSpd = 0
xSpd = 0
ySpd = 0
gravForce = 0.6
maxMoveSpd = 12
maxFallSpd = 24
coyoteTime = 10
maxJumpHeight = -16
instance_create_depth(x,y,depth,obj_camera)
state = "idle"
mask_index = spr_froggyMask
isRunning = false
hitFlash = false
alarm[5] = 3

respawnX = x
respawnY = y
