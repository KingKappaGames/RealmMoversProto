global.player = id;

depth -= 1000;
image_index = 0;
image_speed = 0;

global.bossKillsArray = array_create(12);
global.questItemsArray = array_create(12);
global.secretPathArray = array_create(12); // bools for progression values
global.gameProgressArray = array_create(12);

global.checksArray = [global.bossKillsArray, global.questItemsArray, global.secretPathArray, global.gameProgressArray];

currentlyMoving = false;
currentlyDying = false;

dyingProgress = 0;

realmCurrent = noone;
realmGoal = noone;

moveSpeed = 5;

showProgressionGui = false;

timer = 0;

godmode = false;


moveToRealm = function(realm, path, method = 0) {
	currentlyMoving = true;
	realmGoal = realm;
	
	image_speed = 1;
	
	var _pathReverse = false;
	
	if(path == -1) {
		path = realm.getPathTo(realmCurrent); // fetch the path from your goal that leads to you and flip it
		_pathReverse = true;
	}
	
	if(path != -1) {
		path_start(path, (1 + (-2 * _pathReverse)) * moveSpeed, path_action_stop, 1);
	}
}

finishPath = function() {
	realmCurrent = realmGoal;
	
	realmGoal = noone;
	
	currentlyMoving = false;
	
	image_index = 0;
	image_speed = 0;
}

die = function() {
	realmGoal = noone;
	while((realmGoal == realmCurrent) || (realmGoal == noone)) {
		realmGoal = realmCurrent.deathConnection[irandom(array_length(realmCurrent.deathConnection) - 1)];
	}
	global.ppx.SetEffectEnable(FF_INVERT_COLORS, true); // ppx
	currentlyDying = true;
	dyingProgress = 0;
	audio_play_sound(snd_deathPlayer, 0, 0);
	audio_play_sound(snd_bellTwo, 0, 0);
}

repeat(20) {
	instance_create_depth(irandom(room_width), irandom(room_height), 0, obj_itemPickup);
}

repeat(8) {
	instance_create_depth(irandom(room_width), irandom(room_height), 0, obj_influenceDraw);
}