// black out
[SCREEN_ID, "end_noBorder", 5, 3, 0, 0] call EAS_fnc_cinemaMode; // always call last
// spawn heli
private _heliType = getText (missionConfigFile >> "cfgConstants" >> "HELI_SUPPORT");
private _boatType = getText (missionConfigFile >> "cfgConstants" >> "BOAT_INSERT");
_EAS_boat_wp_0 = getMarkerPos "EAS_boat_wp_0";
_EAS_boat_wp_1 = getMarkerPos "EAS_boat_wp_1";
_EAS_boat_wp_2 = getMarkerPos "EAS_boat_wp_2";
_EAS_boat_wp_3 = getMarkerPos "EAS_boat_wp_3";

_insertHeli = createVehicle [_heliType, [getMarkerPos "EAS_spawn_heli" select 0, getMarkerPos "EAS_spawn_heli" select 1, 100], [], 0, "FLY"];
_insertHeli allowDamage false;
__insertHeliCrew = createVehicleCrew _insertHeli;
_insertHeli engineOn true;
_insertHeli setDir 229.053;

_heliLoiterPoint = getMarkerPos "marker_dz";
_heliWp = __insertHeliCrew addWaypoint [_heliLoiterPoint, 100];
_heliWp setWaypointType "LOITER";
_insertHeli flyInHeight 50;

player allowDamage false;
player moveInCargo EAS_boat_insert;
SEAL_TEAM join player;
[player] spawn EAS_fnc_seal_tl;

{
	_x switchMove "";
	_x moveInCargo EAS_boat_insert;
	_x enableAI "ALL";
	_x allowDamage false;
} forEach SEAL_TEAM;

hint str list EAS_tr_dropZone;

[] spawn {
	{
		_x enableAi "All";
	} forEach allUnits;
};

[] spawn {
	{
		// for each group in AAF_BOAT_PATROL
		{
			// for each unit in the group
			_x enableSimulation true;
		} forEach units _x;
	} forEach AAF_BOAT_PATROL;
};

[_EAS_boat_wp_1, _EAS_boat_wp_3] spawn {
	{
		params ["_EAS_boat_wp_1", "_EAS_boat_wp_3"];
		// for each group in AAF_BOAT_PATROL
		private _wp = _x addWaypoint [_EAS_boat_wp_1, 0];
		private _wp2 = _x addWaypoint [_EAS_boat_wp_3, 0];
		_wp setWaypointCombatMode "YELLOW";
		sleep 1;
	} forEach AAF_BOAT_PATROL;
};

[SCREEN_ID, "start", 3, 3, 0, 0] spawn EAS_fnc_cinemaMode; // always call last
waitUntil {
	player inArea EAS_tr_dropZone;
};
sleep 0;
// radio sequence
// move boats
_wp_blu_boat_escort = blu_boat_escort addWaypoint [_EAS_boat_wp_1, 0];
_wp_blu_boat_escort setWaypointCombatMode "RED";

_wp_EAS_boat_insert = blu_boat_player addWaypoint [_EAS_boat_wp_1, 0];
_wp_blu_boat_escort setWaypointCombatMode "RED";

// move enemy boats
// waiUntil enemy boats destroyed
// call it in
// fade to landingm

// // // // 
// EAS_boat_insert setPos getMarkerPos "EAS_boat_move";
// EAS_boat_insert setDir 183.725;
// EAS_boat_insert setVelocity [0, -20, 0];
// [SCREEN_ID, "start_noBorder", 2, 0, 0, 0] call EAS_fnc_cinemaMode; // always call last
// loadout squad
// join squad player
// move in boat
// black in with borders
// short radio message
// wait until in trigger
// drop sling load
// remove border
// wait for 1 minute
// black in
// move player to pos
// black out
// remove border
// when close to beach
// blackin fast
// play cutscene 
// call next flow