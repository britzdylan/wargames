sleep 1;

_delay = round random 1 * 5; // random delay between 0 and 5 seconds
[
	["2-2", "Good work!", _delay],
	["Air Boss", "Mission success", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep 5;
["END1", true, true, false, true] call BIS_fnc_endMission;