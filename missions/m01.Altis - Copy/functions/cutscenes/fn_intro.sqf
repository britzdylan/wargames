[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]] spawn EAS_fnc_adjustVolume;
private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");

player setPosASL [9041.27, 29603.1, getPosASL blu_walker select 2];
player allowDamage false;
["player", true] call EAS_fnc_freezeAi;

[[3, 1], [0, 0], [3, 1], [0, 0], [3, 1]] call EAS_fnc_adjustVolume;
sleep 1;

player playMoveNow "HubSpectator_walkU";// 3.5s

[[1, 1], [1, 1], [1, 1], [1, 1], [1, 1]] call EAS_fnc_adjustVolume;
[SCREEN_ID, "start", 5, 3, 0, _introDuration] call EAS_fnc_cinemaMode; // always call last

["all", true] call EAS_fnc_freezeAi; // unFreeze all AI

sleep _introDuration;

player allowDamage true;
player switchMove "";