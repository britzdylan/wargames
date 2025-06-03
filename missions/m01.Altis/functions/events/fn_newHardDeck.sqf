waitUntil {
	EAS_skyIsClear == true && EAS_TIGRIS_TWO_DEAD == true && EAS_TIGRIS_ONE_DEAD == true && EAS_isTalking != true;
};

EAS_isTalking = true;
_delay = round random 1 * 10; // random delay between 0 and 10 seconds
sleep _delay;
[
	["4-6", "TAC 2 all AA threats are neutralized, sky is clear.", 0],
	["TAC", "Solid copy shark 4-6", 4],
	["TAC", "All call signs, hard deck for fixed wing assets lowered to angels 3", 8]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep 10;
EAS_isTalking = false;
saveGame;