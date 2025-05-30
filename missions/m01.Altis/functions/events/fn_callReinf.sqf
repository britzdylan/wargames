waitUntil {
	EAS_skyIsClear == true && EAS_TIGRIS_TWO_DEAD == true && EAS_TIGRIS_ONE_DEAD == true;
};

sleep 5;

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["Air Boss", "Reinforcements inbound", _delay],
	["2-2", "Solid Copy", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;

[EAS_BLU_REF, true] call EAS_fnc_freezeAI;

saveGame;