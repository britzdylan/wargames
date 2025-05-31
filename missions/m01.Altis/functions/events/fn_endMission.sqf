sleep 1;

_delay = round random 1 * 5; // random delay between 0 and 5 seconds
[
	["4-6", "TAC-2, Be advised all objectives completed", _delay],
	["TAC", "Good copy shark 4-6, RTB for further tasking", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep _delay + 10;
["END1", true, true, false, true] call BIS_fnc_endMission;