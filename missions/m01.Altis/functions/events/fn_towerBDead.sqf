waitUntil {
	// Check if both towers are dead
	if !(alive EAS_towerB) then {
		systemChat "Tower B destroyed";
		true
	} else {
		false
	};
};

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["2-2", "Tigris spotted! Engage with caution!", _delay],
	["Air Boss", "Tigris spotted! Engage with caution!", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep 5;

EAS_TOWER_B_DEAD = true;

["EAS_destroyCommsTowerB", "SUCCEEDED"] call BIS_fnc_missionTasks;