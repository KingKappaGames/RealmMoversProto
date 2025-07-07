#macro bossDist 60
#macro bossHitRange 24

connectionUp = noone;
connectionDown = noone;
connectionRight = noone;
connectionLeft = noone;

connectionPathToUp = -1;
connectionPathToDown = -1;
connectionPathToRight = -1;
connectionPathToLeft = -1;

connectionUpCriteria = [];
connectionDownCriteria = []; // array of array then position to check (true means passed, aka bossKills[7] means you must have killed boss 7 to take this route
connectionRightCriteria = [];
connectionLeftCriteria = [];

deathConnection = [];

questState = false;
questChance = .1;
questSprite = spr_questIcon;
questIndex = 1 + irandom(11);

influenceValue = random(1);
drawColor = make_color_rgb(influenceValue * 255, influenceValue * 255, influenceValue * 255);

bosses = [script_createBoss(global.bossSpawnIndex)];
global.bossSpawnIndex++;

repeat(2) {
	if(irandom(4) == 0) {
		var _boss = 1 + irandom(11);
		if(_boss != global.bossSpawnIndex - 1) {
			array_push(bosses, script_createBoss(_boss));
		}
	}
}


moveFromRealm = function(dir) {
	var _anyRealmTraveled = false;
	var _goalRealm = 0;
	var _criteria = 0;
	var _path = -1;
	
	if(dir == moveDir.up) {
		if(connectionUp != noone) {
			_goalRealm = connectionUp;
			_criteria = connectionUpCriteria;
			_anyRealmTraveled = true;
			if(connectionPathToUp != -1) {
				_path = connectionPathToUp;
			}
		}
	} else if(dir == moveDir.down) {
		if(connectionDown != noone) {
			_goalRealm = connectionDown;
			_criteria = connectionDownCriteria;
			_anyRealmTraveled = true;
			if(connectionPathToDown != -1) {
				_path = connectionPathToDown;
			}
		}
	} else if(dir == moveDir.left) {
		if(connectionLeft != noone) {
			_goalRealm = connectionLeft;
			_criteria = connectionLeftCriteria;
			_anyRealmTraveled = true;
			if(connectionPathToLeft != -1) {
				_path = connectionPathToLeft;
			}
		}
	} else if(dir == moveDir.right) {
		if(connectionRight != noone) {
			_goalRealm = connectionRight;
			_criteria = connectionRightCriteria;
			_anyRealmTraveled = true;
			if(connectionPathToRight != -1) {
				_path = connectionPathToRight;
			}
		}
	}
	
	if(_anyRealmTraveled) {
		if(instance_exists(_goalRealm)) {
			var _criteriaCount = array_length(_criteria);
			var _criteriaHold = 0;
			var _arrayRef = 0;
			for(var _checkI = 0; _checkI < _criteriaCount; _checkI++) {
				_criteriaHold = _criteria[_checkI];
				if(!global.checksArray[_criteriaHold[0]][_criteriaHold[1]]) { // get array[index] both passed from the info arrays that store progression bools
					return -1;
				}
			}
			
			global.player.moveToRealm(_goalRealm, _path, 0);
		}
	}
}


/// @desc Ask this realm for a path to get to the goal realm and it will find one (the only one?) and return it (the path), otherwise returns -1
/// @param {id.instance} realmId The realm to get TO from the called realm
/// @returns {real} A PATH TO GET TO THE GOAL REALM
getPathTo = function(realmId) {
	if(connectionUp == realmId) {
		return connectionPathToUp;
	} else if(connectionDown == realmId) {
		return connectionPathToDown;
	} else if(connectionLeft == realmId) {
		return connectionPathToLeft;
	} else if(connectionRight == realmId) {
		return connectionPathToRight;
	} else {
		return -1;
	}
}