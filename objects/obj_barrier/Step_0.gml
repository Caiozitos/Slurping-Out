if movable = true{
	x += xSpd
	y += ySpd
	relativePositionX = x - xStart
	if abs(relativePositionX) >= xDistance{
		xSpd = -xSpd
	}
	
	relativePositionY = y - yStart
	if abs(relativePositionY) >= yDistance{
		ySpd = -ySpd
	}

if place_meeting(x,y-1,obj_player){
	if ySpd < 0{
		obj_player.y += ySpd
	}
}


}