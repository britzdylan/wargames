// setup enemy AI, player and play takeOff talk.
if !(isNil "EAS_DEBUG") exitWith {};
if (EAS_CURRENT_FLOW != 0) exitWith {};

private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");

["all", true] call EAS_fnc_freezeAi; // unFreeze all AI
player allowDamage false;
[SCREEN_ID, "start", 5, 5, 0, _introDuration] spawn EAS_fnc_cinemaMode;
[["Cpt. A. Hawkins", 4, 5], ["USS Freedom, Gulf of Altis", 3, 2, 8], ["September 2035", 3, 2, 8]] spawn BIS_fnc_EXP_camp_SITREP;
[[5, 1], [0, 1], [0, 1], [0, 1], [0, 1]] spawn EAS_fnc_adjustVolume;

[] call EAS_fnc_planeTakeOffTalk;

sleep 1;
player allowDamage true;
{
	_x call BIS_fnc_missionTasks;
	sleep 0.2;
	} forEach [
		"EAS_destroyPowerPlant",
		"EAS_destroyCommsTowerA",
		"EAS_destroyCommsTowerB",
		"EAS_reconForTargets",
		"EAS_hardDeck",
	"EAS_controlWesternAirSpace"];

	[] call EAS_fnc_nextFlow;