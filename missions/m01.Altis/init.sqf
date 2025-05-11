// EAS_DEBUG = true;
EAS_CURRENT_FLOW = 1;
EAS_MISSION_STARTED = true;
SEAL_TEAM = [blu_everett, blu_givens, blu_lopez, blu_mckay, blu_walker];
AAF_BOAT_PATROL = [ind_atack_boat_0, ind_atack_boat_1, ind_atack_boat_2];
SCREEN_ID = "screen_x";
// [SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered

[] spawn {
	{
		_x disableAI "All";
	} forEach allUnits
};

waitUntil {
	EAS_MISSION_STARTED == true;
};

[] call EAS_fnc_nextFlow;