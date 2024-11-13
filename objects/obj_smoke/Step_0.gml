if sprite_index = spr_froggyJump or sprite_index = spr_froggyWalk or sprite_index = spr_froggyIdle{
	image_alpha -= 0.1
}
if image_alpha <= 0{
	instance_destroy()
}

if sprite_index = spr_smokePuff{
	image_xscale -= 0.01
	image_yscale -= 0.01
	image_alpha -= 0.01
	image_angle += 3
}