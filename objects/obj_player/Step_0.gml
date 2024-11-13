#region Movimento
	mask_index = spr_froggyMask
    // Input
    inputX = keyboard_check(ord("D")) - keyboard_check(ord("A"))

    // Cálculo da velocidade
    if inputX != 0{
		alarm[0] = 5
        movementSpd = maxMoveSpd
        xSpd = movementSpd * inputX
		image_xscale = inputX
    }

    // Colisão
    if place_meeting(x + xSpd, y, obj_barrier){
        while (!place_meeting(x + sign(xSpd), y, obj_barrier)){
            x += sign(xSpd)
        }
        xSpd = 0
    }

    // Movendo
    xSpd = lerp(xSpd,0,0.35)
    x += xSpd

#endregion

#region Correndo
if keyboard_check_pressed(vk_shift){
	if !audio_is_playing(snd_run){
		audio_play_sound(snd_run,1,0)
	}
	instance_create_depth(x,y,depth+1,obj_smoke,{sprite_index: spr_runExplosion})
	scr_screenshake(10)
	alarm[4] = 3
	alarm[2] = 3
	alarm[3] = 60
	isRunning = true
}

if keyboard_check_released(vk_shift){
	isRunning = false
}


if isRunning = true{
		image_speed = 1.2
		maxMoveSpd = 24
	}
	
else{
	image_speed = 1
	maxMoveSpd = 12
}

#endregion

#region Pulando
    // Definindo velocidade ao pular
    if keyboard_check_pressed(ord("W")) and coyoteTime > 0{
		state = "jump"
		audio_play_sound(snd_ribbit,5,0,,,random_range(1,1.3))
        ySpd = maxJumpHeight
        coyoteTime = 0
		if !place_meeting(x+30,y,obj_barrier) and !place_meeting(x-30,y,obj_barrier){
		image_xscale = 2*sign(image_xscale)
		}
		image_yscale = 1
    }

    if place_meeting(x, y+1, obj_barrier){
         coyoteTime = 10
    }
    else{
         ySpd += gravForce
		 coyoteTime--
    }
	
	if keyboard_check_released(ord("W")) and ySpd < 0{
		ySpd *= 0.4
	}

    // Colisão
    if place_meeting(x, y+ySpd, obj_barrier){
        while (!place_meeting(x, y + sign(ySpd), obj_barrier)){
            y += sign(ySpd)
        }
        ySpd = 0
    }

    // Movendo
    y += ySpd
	
	// Limitando a velocidade de queda
	if ySpd > maxFallSpd{
		ySpd = maxFallSpd
		
	}
#endregion

#region Morrendo

if y > room_height{
	instance_destroy()
}

#endregion

#region Sprites
// State machine
if ySpd != 0 and !place_meeting(x,y+1,obj_barrier){
	state = "jump"
}

else if inputX != 0{
	state = "walk"
}

else{
	state = "idle"
}

//Troca de sprite
switch (state){
	case "jump":
		sprite_index = spr_froggyJump
		if image_index > 3{
			image_index = 2
		}
		break;
		
	case "walk":
		sprite_index = spr_froggyWalk
		break;
	
	case "idle":
		sprite_index = spr_froggyIdle
		break;
}

#endregion

#region Efeitos visuais

image_xscale = lerp(image_xscale,sign(image_xscale),0.5)
image_yscale = lerp(image_yscale,1,0.5)

#endregion