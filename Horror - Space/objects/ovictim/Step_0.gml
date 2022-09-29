//event_inherited();
if(_cd > 0) _cd--;
var target = oPlayer;
if(instance_exists(oPlayer) && oPlayer.hp <= 0) target = -1;
depth = -y;

if(state == aiState.enter){
	if(cd > 0) cd--;
	cd = clamp(cd,0,20);
	if(target && cd == 0) {
		wait = false;
	
		// move towards trinity.
		
		if(place_meeting(x,y,parSolid)) {
			move_towards_point(target.x,target.y,1.5);
			timer = 0;
		}
		else {
			if(abs(distance_to_object(target) < 50)) {
				image_speed = 0;
				speed = 0;
				image_index = 1;
				timer = min(timer + 1, 30);
				if(timer == 30){
					timer = 0;
					state = aiState.attack;
				}
			}
			else {
				mp_potential_step(oPlayer.x, oPlayer.y, 1.5, false);
				image_speed = 1;
				timer = 0;
			}
		}
		
		var dir = point_direction(x,y,target.x,target.y);
		direction = dir;
		
		if(direction >= 0 && direction < 45) {
			sprite_index = sVictimWalkL;
			image_xscale = 1; 
			//image_speed = 1;
		}
		if(direction >= 45 && direction < 140) {
			sprite_index = sVictimWalkU;
			image_xscale = 1; 
			//image_speed = 1;
		}
		if(direction >= 140 && direction < 220) {
			sprite_index = sVictimWalkL;
			image_xscale = -1; 
			//image_speed = 1;
		}
		if(direction >= 315 && direction < 360) {
			sprite_index = sVictimWalkL;
			image_xscale = 1; 
			//image_speed = 1;
		}
		if(direction >= 220 && direction < 315) {
			sprite_index = sVictimWalkD;
			image_xscale = 1; 
			//image_speed = 1;
		}		
	}
}
else if(state == aiState.attack) {
	
		if(!attack){
			var dir = point_direction(x,y,target.x,target.y);
			direction = dir;
		
	
			if(direction >= 0 && direction < 45) {
				sprite_index = sVictimWalkL;
				image_xscale = 1; 
				//image_speed = 1;
			}
			if(direction >= 45 && direction < 140) {
				sprite_index = sVictimWalkU;
				image_xscale = 1; 
				//image_speed = 1;
			}
			if(direction >= 140 && direction < 220) {
				sprite_index = sVictimWalkL;
				image_xscale = -1; 
				//image_speed = 1;
			}
			if(direction >= 315 && direction < 360) {
				sprite_index = sVictimWalkL;
				image_xscale = 1; 
				//image_speed = 1;
			}
			if(direction >= 220 && direction < 315) {
				sprite_index = sVictimWalkD;
				image_xscale = 1; 
				//image_speed = 1;
			}
		}
		else {
			timer = min(timer + 1, 20);
			
			if(timer == 1) {
				audio_play_sound(sndVictimAttack,1,false);
			}
			if(timer != 20) {
				if(sprite_index != sVictimAttackU && sprite_index != sVictimAttackD){
					hspeed = 4 * image_xscale;
					
				}
				else {
					
					if(sprite_index == sVictimAttackU) vspeed = -4;
					else vspeed = 4;
				}
			}
			else {
				timer = 0;
				attack = false;
				hspeed = 0;
				vspeed = 0;
				image_index = 1;  
				cd  = 20;
				state = aiState.enter;
			}
		}
		
		
	switch(sprite_index) {
		case sVictimWalkL: 
			if(image_xscale == -1) {
				if(sprite_index != sVictimAttackS) {
					sprite_index = sVictimAttackS;
					image_index = 0;
					image_xscale = -1;
					image_speed = 0;
					attack = true;
				}
			}
			else if(image_xscale == 1){
				if(sprite_index != sVictimAttackS) {
					sprite_index = sVictimAttackS;
					image_index = 0;
					image_xscale = 1;
					image_speed = 0;
					attack = true;
				}
			}	
		break;	
		case sVictimWalkU: 
				if(sprite_index != sVictimAttackU) {
					sprite_index = sVictimAttackU;
					image_index = 0;
					image_speed = 0;
					attack = true;
				}
		break;
		case sVictimWalkD: 
		
				if(sprite_index != sVictimAttackD) {
					sprite_index = sVictimAttackD;
					image_index = 0;
					image_speed = 0;
					attack = true;
				}
			
		break;
	}

}
else if(state == aiState.wait) {
	if(wait == false) {
		state = aiState.enter;
	}
}

if(abs(distance_to_object(oPlayer) < 200) && wait == true) {
	wait = false;
	randomize();
	audio_play_sound(choose(sndVictimEnter1,sndVictimEnter2),1,false);
}

#region collide


//if(abs(distance_to_object(target) < 20) && !lunge) {
//	lunge = true;
//	state = aiState.attack;
//}


/*
if(place_meeting(x + hspeed, y, parSolid)) {
	while(!place_meeting(x + sign(hspeed), y, parSolid)) {
		x += sign(hspeed);
	}
	hspeed = 0;
}
x += hspeed;

if(place_meeting(x, y + vspeed, parSolid)) {
	while(!place_meeting(x,y+sign(vspeed),parSolid)) {
		y += sign(vspeed);
	}
	vspeed = 0;
}
y += vspeed;
*/

#endregion
