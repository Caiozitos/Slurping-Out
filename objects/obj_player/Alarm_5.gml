alarm[5] = 4
if sprite_index = spr_froggyWalk{
	instance_create_depth(x+15*-sign(image_xscale),y+45,depth+2,obj_smoke,{sprite_index: spr_smokePuff,image_index: irandom_range(1,3), image_xscale: random_range(1,1.2)})
}