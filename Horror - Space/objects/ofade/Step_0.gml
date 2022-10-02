

if(fadeout) {
	if(image_alpha < 1) image_alpha += 0.05;
	else {
		fadeout = false;
		fadein = true;
		
		if(oPlayer.__name == "sectionA" && room == rmSection1) {
			oPlayer.posX = 2114;
			oPlayer.posY = 640;
			room_goto(rmSection2);
		}
		else if(oPlayer.__name == "Cryo") {
			oPlayer.posX = 1912;
			oPlayer.posY = 1026;
			room_goto(rmSection1);
		}
		else if(oPlayer.__name == "sectionB") {
			oPlayer.posX = 136;
			oPlayer.posY = 6074;
			room_goto(rmSection3);
		}
		else if(oPlayer.__name == "sectionA" && room == rmSection3) {
			oPlayer.posX = 5799;
			oPlayer.posY = 6300;
			room_goto(rmSection2);
		}	
		else if(oPlayer.__name == "main hallway" && room == rmSection3) {
			oPlayer.posX = 8820;
			oPlayer.posY = 180;
			room_goto(rmSection8);
		}
		else if(oPlayer.__name == "section3" && room == rmSection8) {
			oPlayer.posX = 2674;
			oPlayer.posY = 6778;
			room_goto(rmSection3);
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
