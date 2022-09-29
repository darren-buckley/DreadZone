enum aiState {
	enter,
	chase,
	attack,
	wait,
	die
}

hp = 100;
spd = 1;
dir = -1;
lunge = false;
timer = 0;
state = aiState.wait;
owner = noone;
wait = true;
checker = false;
hsp = 0;
attack = false;
cd = false;