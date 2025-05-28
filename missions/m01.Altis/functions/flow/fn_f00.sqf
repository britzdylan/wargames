// setup enemy AI, player and play takeOff talk.
if !(isNil "EAS_DEBUG") exitWith {};
if (EAS_CURRENT_FLOW != 0) exitWith {};

private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");

[units blufor, true] call EAS_fnc_freezeAi; // unFreeze all west AI
[["Cpt. A. Hawkins", 4, 5], ["USS Freedom, Gulf of Altis", 3, 2, 8], ["September 2035", 3, 2, 8]] spawn BIS_fnc_EXP_camp_SITREP;
// [[5, 1], [0, 1], [0, 1], [0, 1], [0, 1]] spawn EAS_fnc_adjustVolume;

// freeze reinforcements
EAS_BLU_REF = [EAS_blu_ah, EAS_blu_ah_1, driver EAS_blu_ah, gunner EAS_blu_ah, driver EAS_blu_ah_1, gunner EAS_blu_ah_1, EAS_blu_plane_1, EAS_blu_plane_2];
[EAS_BLU_REF] call EAS_fnc_freezeAI;

[] call EAS_fnc_planeTakeOffTalk;

sleep 1;
{
	_x call BIS_fnc_missionTasks;
	sleep 0.2;
}
forEach [
	// "EAS_destroyPowerPlant", 
	// "EAS_destroyCommsTowerA", 
	// "EAS_destroyCommsTowerB", 
	// "EAS_reconForTargets", 
	"EAS_hardDeck",
	"EAS_controlWesternAirSpace"
];

waitUntil {
	getPosASL player select 2 > 3000 || !alive player
};

["EAS_hardDeck", "SUCCEEDED"] call BIS_fnc_missionTasks;

sleep 1;

saveGame;

[] call EAS_fnc_nextFlow;