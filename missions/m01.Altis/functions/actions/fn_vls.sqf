if (isLaserOn vehicle player && laserTarget vehicle player != objNull) then {
	[
		["2-2", "Target painted", 0],
		["Air Boss", "Firing", 4]
	] spawn BIS_fnc_EXP_camp_playSubtitles;

	[laserTarget vehicle player, EAS_blu_vls] call EAS_fnc_vlsFire;
} else {
	[
		["Air Boss", "Negative, no target.", 0]
	] spawn BIS_fnc_EXP_camp_playSubtitles;
};