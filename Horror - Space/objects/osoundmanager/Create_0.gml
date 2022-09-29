sounds = [sndAtmosphere1,sndAtmosphere2,sndAtmosphere3]
for(var i = 0; i < array_length(sounds); i++) {
	if(!audio_is_playing(sounds[i])) {
		audio_play_sound(sounds[0],1,true);
		audio_play_sound(sounds[1],1,true);
		audio_play_sound(sounds[2],1,true);
	}
}
