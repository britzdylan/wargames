EAS_MISSION_STARTED = false;
[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]] call EAS_fnc_adjustVolume;
[] spawn EAS_fnc_freezeAi;
[] spawn EAS_fnc_intro;

["start", 5] call EAS_fnc_cinemaMode;// always call last
sleep 1;
EAS_MISSION_STARTED = true;
"EAS_briefing" call BIS_fnc_missionTasks;