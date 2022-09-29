if(distance_to_object(oPlayer) < 70) {
	open = true;
} 
else open = false;

if(open) {
	
	image_speed = 1;
	
	if(image_index >= image_number - 1) {
		image_speed = 0;
	}
	else if(!audio_is_playing(sndSlideDoor)) audio_play_sound(sndSlideDoor,2,false);
}
else {
	if(image_index != 0) {
		if(!audio_is_playing(sndSlideDoor)) audio_play_sound(sndSlideDoor,2,false);
		image_speed = -1;
	}
	else image_speed = 0;
}