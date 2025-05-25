// EAS_DEBUG = true;
EAS_CURRENT_FLOW = -1;
EAS_MISSION_STARTED = false;
EAS_TOWER_A_DEAD = false;
EAS_TOWER_A1_DEAD = false;

SCREEN_ID = "screen_x";
[SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered

// intro
[] spawn EAS_fnc_freezeAi;
// [] call EAS_fnc_intro;
sleep 5;
// TODO: play map briefing
// TODO: register event handlers
[] spawn EAS_fnc_towerADead;
EAS_MISSION_STARTED = true;
waitUntil {
	EAS_MISSION_STARTED == true;
};
sleep 1;

[] call EAS_fnc_nextFlow;