waitUntil {
	// Check if both towers are dead
	if !(alive EAS_towerB) then {
		systemChat "Tower B destroyed";
		true
	} else {
		false
	};
};

["EAS_destroyCommsTowerB", "SUCCEEDED"] call BIS_fnc_missionTasks;