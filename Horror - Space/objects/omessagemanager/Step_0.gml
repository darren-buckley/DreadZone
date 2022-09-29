global.wait = true;
global.spawnIntro = false;
timer = min(timer + 1, 120);

if(timer == 120){
	if(actionButton) {
		if(pos < array_length(text)-1){
			pos++;
		}
		else {
			global.wait = false;
			with(oPlayer) aquire = true;
			audio_stop_sound(sndAlarms);
			timer = 0;
			instance_destroy();
		}
	}
}
switch(pos) {
	case 0: name = 0; break;
	case 1: name = 1; break;
	case 2: name = 0; break;
	case 3: name = 1; break;
	case 4: name = 0; break;
	case 5: name = 1; break;
	case 6: name = 1; break;
	case 7: name = 0; break;
	case 8: name = 1; break;
	case 9: name = 0; break;
	case 10: name = 1; break;
	case 11: name = 1; break;
	case 12: name = 1; break;
	case 13: name = 0; break;
	case 14: name = 1; break;
	case 15: name = 0; break;
	case 16: name = 1; break;
	case 17: name = 1; break;
	case 18: name = 1; break;
	case 19: name = 0; break;
}
pos = clamp(pos,0,array_length(text)-1);