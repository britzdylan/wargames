waitUntil {
	// Check if both towers are dead
	if !(west knowsAbout EAS_aaf_radar > 3.9) then {
		systemChat "Tigris Found";
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

"EAS_radarSite" call BIS_fnc_missionTasks;

[] spawn EAS_fnc_radarSiteDead;