waitUntil {
	// Check if both towers are dead
	if !(alive EAS_towerA && alive EAS_towerA_1) then {
		systemChat "Both towers are dead!";
		true
	} else {
		false
	};
};

_delay = round random 1 * 10; // random delay between 0 and 10 seconds

sleep 5;

EAS_TOWER_A_DEAD = true;
EAS_TOWER_A1_DEAD = true;

["EAS_destroyCommsTowerA", "SUCCEEDED"] call BIS_fnc_missionTasks;
saveGame;