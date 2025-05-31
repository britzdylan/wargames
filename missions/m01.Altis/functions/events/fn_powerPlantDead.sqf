waitUntil {
	// Check if both towers are dead
	if !(alive EAS_storageBig && alive EAS_storageSmall_1 && alive EAS_storageSmall_2 && alive EAS_plantOfficeWhite) then {
		systemChat "Power plant is destroyed";
		true
	} else {
		false
	};
};
private _lampsIn200m = nearestObjects [EAS_plantOfficeWhite, ["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"], 6000];
{
	[_x, false] call BIS_fnc_switchLamp;
} forEach _lampsIn200m;

sleep 5;

EAS_POWER_PLANT_DEAD = true;

["EAS_destroyPowerPlant", "SUCCEEDED"] call BIS_fnc_missionTasks;
saveGame;