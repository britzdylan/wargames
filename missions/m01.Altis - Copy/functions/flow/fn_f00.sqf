if !(isNil "EAS_DEBUG") exitWith {};
if (EAS_CURRENT_FLOW != 0) exitWith {};

private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");

// [] call EAS_fnc_freezeAi;
[] call EAS_fnc_intro;
sleep 1;
"EAS_briefing" call BIS_fnc_missionTasks;

[] call EAS_fnc_nextFlow;