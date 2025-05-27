waitUntil {
	// Check if both towers are dead
	if !(alive EAS_towerA && alive EAS_towerA_1) then {
		systemChat "Both towers are dead!";
		true
	} else {
		false
	};
};

["EAS_destroyCommsTowerA", "SUCCEEDED"] call BIS_fnc_missionTasks;