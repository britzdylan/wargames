waitUntil {
	if !(alive EAS_blu_viper_2_1 && EAS_isTalking != true) then {
		systemChat "Copilot destroyed";
		true
	} else {
		false
	};
};

sleep 5;
EAS_isTalking = true;

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
sleep _delay;
[
	["4-6", "Fuck!", 0],
	["4-6", "TAC 2, uhh 4-2 is down, I say again 4-2 is down.", 4],
	["TAC", "Shark 4-6, good copy, continue with tasking, Search and Rescue will be notified", 8]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep 10;
EAS_isTalking = false;
EAS_COPILOT_DEAD = true;