// EAS_DEBUG = true;
EAS_CURRENT_FLOW = -1;
EAS_MISSION_STARTED = false;
EAS_TOWER_A_DEAD = false;
EAS_TOWER_A1_DEAD = false;
EAS_TOWER_B_DEAD = false;
EAS_POWER_PLANT_DEAD = false;
EAS_HELI_DEAD = false;
EAS_TIGRIS_ONE_DEAD = false;
EAS_TIGRIS_TWO_DEAD = false;
EAS_RADAR_SITE_DEAD = false;
EAS_COPILOT_DEAD = false;
EAS_skyIsClear = false;

SCREEN_ID = "screen_x";
[SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered

// intro
[allUnits] call EAS_fnc_freezeAi;
// [] call EAS_fnc_intro;
sleep 5;
// TODO: play map briefing

EAS_MISSION_STARTED = true;
waitUntil {
	EAS_MISSION_STARTED == true;
};
sleep 1;

player addAction ["Request VLS", {
	[] call EAS_fnc_vls;
}];

[] spawn {
	waitUntil {
		EAS_MISSION_STARTED == true &&
		EAS_TOWER_A_DEAD == true &&
		EAS_TOWER_A1_DEAD == true &&
		EAS_TOWER_B_DEAD == true &&
		EAS_POWER_PLANT_DEAD == true &&
		EAS_TIGRIS_ONE_DEAD == true &&
		EAS_TIGRIS_TWO_DEAD == true &&
		EAS_RADAR_SITE_DEAD == true &&
		EAS_skyIsClear == true
	};
	[] spawn EAS_fnc_endMission;
};

[] spawn EAS_fnc_nextFlow;