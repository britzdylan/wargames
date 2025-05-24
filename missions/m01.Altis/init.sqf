// EAS_DEBUG = true;
EAS_CURRENT_FLOW = -1;
EAS_MISSION_STARTED = false;

SCREEN_ID = "screen_x";
[SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered

// intro
[] spawn EAS_fnc_freezeAi;
// [] call EAS_fnc_intro;
sleep 5;
// play map briefing
EAS_MISSION_STARTED = true;
waitUntil {
	EAS_MISSION_STARTED == true;
};
sleep 1;

[] call EAS_fnc_nextFlow;