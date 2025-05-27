waitUntil {
	// Check if both towers are dead
	if !(alive EAS_fuelTruckPowerPlant) then {
		systemChat "Power plant is destroyed";
		true
	} else {
		false
	};
};

["EAS_destroyPowerPlant", "SUCCEEDED"] call BIS_fnc_missionTasks;