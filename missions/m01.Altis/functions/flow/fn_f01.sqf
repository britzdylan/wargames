if (isNil "EAS_MISSION_STARTED") exitWith {};
if (EAS_CURRENT_FLOW != 1) exitWith {};

// setup
waitUntil {
	player inArea EAS_tr_briefingArea;
};
sleep 1;
["EAS_briefing", "SUCCEEDED"] call BIS_fnc_missionTasks;

// setting cinema mode

[] call EAS_fnc_briefing;

[player, "Launch Mission", "", "", "true", "true", {}, {}, {
	[missionSelect] call BIS_fnc_moduleStrategicMapOpen;
},
{},
[],
2,
nil,
false,
false
] call BIS_fnc_holdActionAdd;