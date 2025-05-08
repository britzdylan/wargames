["player", true] spawn EAS_fnc_freezeAi;
player allowDamage false;
[[3, 1], [0, 0], [3, 1], [0, 0], [3, 1]] call EAS_fnc_adjustVolume;
sleep 1;
player switchMove "HubSpectator_walkU";// 3.5s
sleep 10;
["all", true] call EAS_fnc_freezeAi; // unFreeze all AI
[[1, 1], [1, 1], [1, 1], [1, 1], [1, 1]] call EAS_fnc_adjustVolume;
player allowDamage true;
player switchMove "";