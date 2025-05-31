if (isLaserOn vehicle player && laserTarget vehicle player != objNull) then {
	[
		["4-6", "Heavy 2-1-2, requesting fire mission at designation Shark 4-6", 0],
		["Heavy 2-1-2", "Shark 4-6, Target confirmed, firing", 4],
		["Heavy 2-1-2", "Missile away", 12]
	] spawn BIS_fnc_EXP_camp_playSubtitles;

	[laserTarget vehicle player, EAS_blu_vls] call EAS_fnc_vlsFire;
} else {
	[
		["4-6", "Heavy 2-1-2, requesting fire mission at designation Shark 4-6", 0],
		["Heavy 2-1-2", "Negative, no target.", 4]
	] spawn BIS_fnc_EXP_camp_playSubtitles;
};