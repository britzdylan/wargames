sleep 1;

_delay = round random 1 * 5; // random delay between 0 and 5 seconds
[
	["4-6", "TAC-2, Shark 4-6, all primary targets destroyed. SA-6 sites at Tigris-1 and Foxtrot-3 confirmed neutralized.", _delay],
	["TAC", "Shark 4-6, RTB to Mother for debrief and further tasking. Vector 180, angels 15. Well done today.", _delay + 26],
	["4-6", "TAC-2, Shark 4-6 copies RTB, heading 180, climbing to 15 thousand. Pleasure working with you. Shark 4-6 out.", _delay + 30]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep _delay + 10;
["END1", true, true, false, true] call BIS_fnc_endMission;