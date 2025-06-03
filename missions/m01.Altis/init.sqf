EAS_DEBUG = false;
EAS_CURRENT_FLOW = -1;
EAS_MISSION_STARTED = false;
EAS_TOWER_A_DEAD = false;
EAS_TOWER_A1_DEAD = false;
EAS_TOWER_B_DEAD = false;
EAS_POWER_PLANT_DEAD = false;
EAS_TIGRIS_ONE_DEAD = false;
EAS_TIGRIS_TWO_DEAD = false;
EAS_RADAR_SITE_DEAD = false;
EAS_COPILOT_DEAD = false;
EAS_skyIsClear = false;
EAS_isTalking = false;

// mission params
[0.3] call BIS_fnc_setOvercast;
300 setOvercast 0.4;
setViewDistance 15000;
setObjectViewDistance 15000;

setDate [2035, 3, 29, 01, 0]; // 1:00 AM
setTimeMultiplier 6;
west setFriend [resistance, 0];

{
	_x call BIS_fnc_missionTasks;
}
forEach [
	"EAS_destroyPowerPlant",
	"EAS_destroyCommsTowerA",
	"EAS_destroyCommsTowerB",
	"EAS_hardDeck",
	"EAS_controlWesternAirSpace"
];

[] spawn EAS_fnc_towerADead;
[] spawn EAS_fnc_towerBDead;
[] spawn EAS_fnc_powerPlantDead;

SCREEN_ID = "screen_x";
if (!EAS_DEBUG) then {
	[SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered
};
// intro
[allUnits] call EAS_fnc_freezeAi;
// if (!EAS_DEBUG) then {
// 	[] call EAS_fnc_intro;
// };
sleep 5;

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

if (EAS_DEBUG) then {
	player addAction ["Destroy plains", {
		EAS_aaf_plane_0 setDamage 1;
		EAS_aaf_plane_1 setDamage 1;
	}];

	player addAction ["Destroy towers", {
		EAS_towerA setDamage 1;
		EAS_towerA_1 setDamage 1;
		sleep 10;
		EAS_towerB setDamage 1;
	}];

	player addAction ["Destroy power plant", {
		{
			_x setDamage 1;
		} forEach [EAS_storageBig, EAS_storageSmall_1, EAS_storageSmall_2, EAS_plantOfficeWhite];
	}];

	player addAction ["Destroy Tigris", {
		EAS_aaf_tigris_2 setDamage 1;
		EAS_aaf_tigris_1 setDamage 1;
	}];

	player addAction ["Destroy radar", {
		EAS_aaf_radar setDamage 1;
	}];

	player addAction ["Destroy copilot", {
		EAS_blu_viper_2_1 setDamage 1;
	}];
};