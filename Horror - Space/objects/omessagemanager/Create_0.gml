text = [
	"Aquilla...",
	"Yes?...",
	"What's the situation? What happened?!",
	"Processing... 90% of the crew has been confirmed dead... As for the other 9.999%.... Their Whereabouts are unknown.... As of this moment, the ship recognizes you as captain...",
	"WHAT?! I'M ONLY THE ULTILITY MAINTENANCE WORKER!!!",
	"Calm down... There is an anomolly breaching the ship. It's composition is unknown, though it's been seen acting as any of the 3 phases of matter.",
	"It acts with relative intelligence, and has been observed assimilating whatever it touches...",
	"Then I'll need protective clothing, but the wardrobe in the cryo has been....",
	"Negative.",
	"What?!",
	"It is not known what has been contaminated by the anomaly. It seems that smaller portions breach the ship, only for larger ones to encroach and join up with the stragglers later.", 
	"You must assume that all objects are contaminated, and only touch what you deem necessary.",
	"Additionally, it has been seen that clothing actually acts as an additional hindrance when dealing with this anomaly.  It is recommended you remove what little you have left on you...",
	"Not gonna happen.",
	"Very well.",
	"So what do we do?",
	"My data structure has been compromised. I'm missing 60% of my stored data, and an additional 7% is either corrupt or scrambled.",
	"Ship functions are failing and must be restored immediately or the eradication of this entire ship will result.", 
	"You must take this AI unit to the data processing centers located across the ship in the front top sector and mid section lower sectors.",  
	"Find the safest route possible and make your way there.",
	"Got it."	
]

ConvoNames = ["Trinity","Aquilla"];
name = 0;
width = sprite_get_width(sBox);
pos = 0;
timer = 0;
playerSlot = 1;
audio_play_sound(sndAlarms,1,true);
