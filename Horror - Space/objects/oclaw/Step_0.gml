if(global.ready == true && instance_exists(oPlayer)) {
	var target = oPlayer;
	
	if(abs(distance_to_object(target) < 5)) {
		image_speed = 1;
		
		if(!set){
			set = true;
			flash = true;
			depth = -90000;
			audio_play_sound(sndJumpScare,1,false);
			audio_play_sound(sndClawEnter,1,false);
			audio_play_sound(sndPianoJump,1,false);
			instance_create_depth(0,0,-1000,oFlash);
		}
	}
}


if(flash) {
	timer++;
	
	if(timer == 10) flash = false;
}

if(cd > 0) cd--;

if(image_index >= image_number - 1) {
	global.ready = false;
	instance_destroy();
}

