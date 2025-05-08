// EAS_DEBUG = true;
EAS_CURRENT_FLOW = 0;
EAS_MISSION_STARTED = true;

[] spawn {
	{
		_x disableAI "All";
	} forEach allUnits
};

waitUntil {
	EAS_MISSION_STARTED == true;
};

[] call EAS_fnc_nextFlow;