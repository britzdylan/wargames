if (isNil "EAS_MISSION_STARTED") exitWith {};
if (EAS_CURRENT_FLOW != 1) exitWith {};

[allUnits, true] call EAS_fnc_freezeAi;

[] spawn EAS_fnc_hardDeck;
[] spawn EAS_fnc_tigrisOne;
[] spawn EAS_fnc_tigrisTwo;
[] spawn EAS_fnc_radarSite;
[] spawn EAS_fnc_copilotDead;
[] spawn EAS_fnc_callReinf;

waitUntil {
	!alive EAS_aaf_plane_0 && !alive EAS_aaf_plane_1;
};
EAS_skyIsClear = true;
sleep 5;

["EAS_controlWesternAirSpace", "SUCCEEDED"] call BIS_fnc_missionTasks;
sleep 5;

saveGame;