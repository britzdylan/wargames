if !(isNil "EAS_DEBUG") exitWith {};
if (EAS_CURRENT_FLOW != 0) exitWith {};

private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");

[] call EAS_fnc_freezeAi;
// setup game AI

// [] call EAS_fnc_intro;
sleep 5;
["all", true] call EAS_fnc_freezeAi; // unFreeze all AI
player allowDamage false;
[SCREEN_ID, "start", 1, 1, 0, _introDuration] spawn EAS_fnc_cinemaMode;
[[1, 0.2], [5, 1], [1, 0.2], [1, 0.2], [1, 0.2]] spawn EAS_fnc_adjustVolume;

waitUntil {
	player inArea EAS_area_briefingArea;
};

[] call EAS_fnc_commanderTalk;
sleep 1;
"EAS_briefing" call BIS_fnc_missionTasks;

[] call EAS_fnc_nextFlow;