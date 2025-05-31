waitUntil {
	if !(alive EAS_blu_viper_2_1) then {
		systemChat "Copilot destroyed";
		true
	} else {
		false
	};
};

sleep 5;

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["4-6", "Fuck!", _delay],
	["4-6", "TAC 2, uhh 4-2 is down, I say again 4-2 is down.", _delay + 4],
	["TAC", "Shark 4-6, good copy, continue with tasking, Search and Rescue will be notified", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;

EAS_COPILOT_DEAD = true;

sleep _delay + 5;