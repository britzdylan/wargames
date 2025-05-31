waitUntil {
	// Check if both towers are dead
	if (west knowsAbout EAS_aaf_radar > 3) then {
		systemChat "Tigris Found";
		true
	} else {
		false
	};
};

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["4-6", "TAC-2, call contact, possible enemy radar site in our sector", _delay],
	["TAC", "Good copy Shark 4-6, you are authorized to engage", _delay + 4],
	["4-6", "TAC-2, copy that", _delay + 8]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep 5;

"EAS_radarSite" call BIS_fnc_missionTasks;

[] spawn EAS_fnc_radarSiteDead;