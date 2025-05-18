// EAS_DEBUG = true;
EAS_CURRENT_FLOW = 0;
EAS_MISSION_STARTED = true;

SCREEN_ID = "screen_x";
// [SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered

[] spawn {
	{
		if (side _x == west) then {
			_x disableAI "All";
		};
	} forEach allUnits;
};

waitUntil {
	EAS_MISSION_STARTED == true;
};
sleep 1;
[] spawn {
	{
		_x enableAI "All";
	} forEach [EAS_amb_heli_landingD, EAS_man_wingman, EAS_amb_heli_landingG, EAS_amb_boat_0D, EAS_amb_boat_0C, EAS_amb_boat_1D, EAS_amb_boat_1G, EAS_amb_heli_pythonD];

	EAS_veh_wingmanJet engineOn false;
	EAS_man_deckCrew_0 playMoveNow "Acts_Kore_IdleNoWeapon_loop";
	EAS_man_wingman setSkill 1;
	EAS_man_wingman assignAsDriver EAS_veh_wingmanJet;
	EAS_man_wingman setBehaviour "SAFE";
	EAS_man_wingman setCombatMode "BLUE";
};
[] call EAS_fnc_nextFlow;
sleep 3;
// _unitCaptureData = [] execVM "functions\movementData\wingman.sqf";
// waitUntil {scriptDone _unitCaptureData};
// [EAS_veh_playerJet, 30] spawn BIS_fnc_unitCapture;