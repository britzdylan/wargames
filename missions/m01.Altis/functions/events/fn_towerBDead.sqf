waitUntil {
	if !(alive EAS_towerB) then {
		systemChat "Tower B destroyed";
		true
	} else {
		false
	};
};

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
sleep 5;

EAS_TOWER_B_DEAD = true;

["EAS_destroyCommsTowerB", "SUCCEEDED"] call BIS_fnc_missionTasks;
saveGame;