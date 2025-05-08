if !(isNil "EAS_DEBUG") exitWith {};
if (EAS_CURRENT_FLOW != 0) exitWith {};

private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");

[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]] call EAS_fnc_adjustVolume;
[] call EAS_fnc_freezeAi;
[] spawn EAS_fnc_intro;
["start", 5, 3, 0, _introDuration] call EAS_fnc_cinemaMode;// always call last
sleep 1;
"EAS_briefing" call BIS_fnc_missionTasks;

[] call EAS_fnc_nextFlow;