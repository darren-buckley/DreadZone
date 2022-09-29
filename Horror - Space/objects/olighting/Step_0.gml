if(instance_exists(oPlayer)) {
	switch(oPlayer.sprite_index) {
		case sTrinityWalkU: 
		case sTrinityRunU:
			rot = 90;
		break;
		case sTrinityWalkD: 
		case sTrinityRunD:
			rot = 270;
		break;
		case sTrinityWalkS: 
		case sTrinityRunS:
			if(oPlayer.image_xscale == 1) rot = 180
			else rot = 0;
		break;
	
	}
}