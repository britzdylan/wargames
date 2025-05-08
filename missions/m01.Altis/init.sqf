// EAS_DEBUG = true;
EAS_CURRENT_FLOW = 0;
EAS_MISSION_STARTED = true;

waitUntil {
	EAS_MISSION_STARTED == true;
};

[] call EAS_fnc_nextFlow;