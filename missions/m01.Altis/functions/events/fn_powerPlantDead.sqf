waitUntil {
	// Check if both towers are dead
	if !(alive EAS_storageBig && alive EAS_storageSmall_1 && alive EAS_storageSmall_2 && alive EAS_plantOfficeWhite) then {
		systemChat "Power plant is destroyed";
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

EAS_POWER_PLANT_DEAD = true;

["EAS_destroyPowerPlant", "SUCCEEDED"] call BIS_fnc_missionTasks;
saveGame;