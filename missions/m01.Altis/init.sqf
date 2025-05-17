// EAS_DEBUG = true;
EAS_CURRENT_FLOW = -1;
EAS_MISSION_STARTED = true;

SCREEN_ID = "screen_x";
[SCREEN_ID, false, 0] call BIS_fnc_blackOut; // always start with black screen registered

[] spawn {
	{
		_x disableAI "All";
	} forEach allUnits
};

waitUntil {
	EAS_MISSION_STARTED == true;
};

[] call EAS_fnc_nextFlow;
sleep 3;
[] spawn {
	{
		_x enableAI "All";
	} forEach [EAS_amb_heli_landingD, EAS_amb_heli_landingG, EAS_amb_boat_0D, EAS_amb_boat_0C, EAS_amb_boat_1D, EAS_amb_boat_1G, EAS_amb_heli_pythonD]
};