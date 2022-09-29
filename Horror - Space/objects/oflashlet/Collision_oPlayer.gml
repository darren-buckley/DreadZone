with(oPlayer){ 
	enabled = true;
	aquire = true;
	itemNumber = 1;
	
}
audio_play_sound(sndFlashlet,100,false);
global.ready = true;
instance_destroy();
