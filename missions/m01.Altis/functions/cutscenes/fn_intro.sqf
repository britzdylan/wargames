["player", true] spawn EAS_fnc_freezeAi;
player allowDamage false;
[[3, 1], [0, 0], [3, 1], [0, 0], [3, 1]] call EAS_fnc_adjustVolume;
sleep 1;
player playMoveNow "HubSpectator_walkU";// 3.5s
[[1, 1], [1, 1], [1, 1], [1, 1], [1, 1]] call EAS_fnc_adjustVolume;
["all", true] call EAS_fnc_freezeAi; // unFreeze all AI
sleep 50;
player allowDamage true;
player switchMove "";