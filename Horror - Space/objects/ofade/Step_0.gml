

if(fadeout) {
	if(image_alpha < 1) image_alpha += 0.05;
	else {
		fadeout = false;
		fadein = true;
		
		if(oPlayer.__name == "sectionA" && room == rmCryoRoom) {
			oPlayer.posX = 2114;
			oPlayer.posY = 640;
			room_goto(rm_nextRoom);
		}
		else if(oPlayer.__name == "Cryo") {
			oPlayer.posX = 1912;
			oPlayer.posY = 1026;
			room_goto(rmCryoRoom);
		}
		else if(oPlayer.__name == "sectionB") {
			oPlayer.posX = 136;
			oPlayer.posY = 6074;
			room_goto(rmRecreation);
		}
		else if(oPlayer.__name == "sectionA" && room == rmRecreation) {
			oPlayer.posX = 5799;
			oPlayer.posY = 6300;
			room_goto(rm_nextRoom);
		}
		
		
	}
}

if(fadein) {
	with(oPlayer) {
		x = posX;
		y = posY;
	}
	with(Camera) {
		x = oPlayer.x;
		y = oPlayer.y;
	}
	if(image_alpha > 0) image_alpha -= 0.05;
	else {
		instance_destroy();
	}
}
