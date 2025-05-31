waitUntil {
	// Check if both towers are dead
	if (west knowsAbout EAS_aaf_tigris_1 > 3) then {
		systemChat "Tigris Found";
		true
	} else {
		false
	};
};

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["4-6", "TAC-2, call contact, confirmed enemy mobile SAM site in sector whiskey 2", _delay],
	["TAC", "Good copy Shark 4-6, you are authorized to engage", _delay + 4],
	["4-6", "TAC-2, copy that", _delay + 8]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep 5;

"EAS_laseTigrisOne" call BIS_fnc_missionTasks;

sleep 3;


[] spawn EAS_fnc_tigrisDead;