if(flash){
	timer++;
	if(timer == 6) flash = false;
}


if(image_index >= image_number - 1) {
	image_speed = 0;
	image_index = 0;
	timer = 0;
	once = false;
}

if(instance_place(x,bbox_bottom,oPlayer) && cd == 0){
	image_speed = 1;
	if(image_index >= 2) {
		cd = 120;
		with(oPlayer) {
			life++;
			hit = true;
		}
	}

}

if(!once && image_speed == 1) {
	once = true;
	audio_play_sound(sndSpikeRise,100,false);
	audio_play_sound(sndSpikeScream,1,false);
	var inst = instance_create_depth(0,0,-9000,oFlash);
	inst.image_xscale = room_width;
	inst.image_yscale = room_height;
	uc_shake(10);
	flash = true;
}


if(cd > 0) cd--;