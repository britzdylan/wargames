waitUntil {
	// Check if both towers are dead
	if (west knowsAbout EAS_aaf_radar > 3 && EAS_isTalking != true) then {
		systemChat "Tigris Found";
		true
	} else {
		false
	};
};
EAS_isTalking = true;

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
sleep _delay;
playSound ["EAS_radarSpotted", 1, 0];
[
	["4-6", "TAC-2, call contact, possible enemy radar site in our sector", 0],
	["TAC", "Good copy Shark 4-6, you are authorized to engage", 4],
	["4-6", "TAC-2, copy that", 8]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep 10;
EAS_isTalking = false;
"EAS_radarSite" call BIS_fnc_missionTasks;

[] spawn EAS_fnc_radarSiteDead;