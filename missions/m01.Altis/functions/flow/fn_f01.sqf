if (isNil "EAS_MISSION_STARTED") exitWith {};
if (EAS_CURRENT_FLOW != 1) exitWith {};

// setup
waitUntil {
	player inArea EAS_tr_briefingArea;
};
sleep 2;
["EAS_briefing", "SUCCEEDED"] call BIS_fnc_missionTasks;

// setting cinema mode
["end_noBorder"] call EAS_fnc_cinemaMode;
[[3, 0], [3, 0], [3, 0], [3, 0], [3, 0]] call EAS_fnc_adjustVolume;

[] call EAS_fnc_freezeAi;
[] spawn EAS_fnc_briefing;

// start

// start speech

// map briefing

// end cutscene

// call next flow
[] call EAS_fnc_nextFlow;