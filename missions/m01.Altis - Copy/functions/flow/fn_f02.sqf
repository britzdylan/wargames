// black out
[SCREEN_ID, "end_noBorder", 5, 3, 0, 0] call EAS_fnc_cinemaMode; // always call last
// spawn heli
private _boatType = getText (missionConfigFile >> "cfgConstants" >> "BOAT_INSERT");
_EAS_boat_wp_0 = getMarkerPos "EAS_boat_wp_0";
_EAS_boat_wp_1 = getMarkerPos "EAS_boat_wp_1";
_EAS_boat_wp_2 = getMarkerPos "EAS_boat_wp_2";
_EAS_boat_wp_3 = getMarkerPos "EAS_boat_wp_3";
_EAS_boat_wp_lz = getMarkerPos "EAS_boat_lz";
_EAS_beach_lz = getMarkerPos "EAS_beach_lz";

player allowDamage false;
player moveInCargo EAS_boat_insert;
SEAL_TEAM join player;
["player", player] spawn EAS_fnc_applyLoadout;

{
	_x switchMove "";
	_x moveInCargo EAS_boat_insert;
	_x enableAI "ALL";
	_x allowDamage false;
	private _varNameString = vehicleVarName _x;
	[_varNameString, _x] spawn EAS_fnc_applyLoadout;
} forEach SEAL_TEAM;

[] spawn {
	{
		_x enableAi "All";
	} forEach allUnits;
};

[] spawn {
	{
		{
			_x enableSimulation true;
		} forEach units _x;
	} forEach AAF_BOAT_PATROL;
};

[_EAS_boat_wp_1, _EAS_boat_wp_3] spawn {
	{
		params ["_EAS_boat_wp_1", "_EAS_boat_wp_3"];
		private _wp = _x addWaypoint [_EAS_boat_wp_1, 150];
		_wp setWaypointCombatMode "RED";
		sleep 0.1;
	} forEach AAF_BOAT_PATROL;
};

[SCREEN_ID, "start", 3, 3, 5, 0] spawn EAS_fnc_cinemaMode;

waitUntil {
	player inArea EAS_tr_dropZone;
};

[_EAS_boat_wp_2, _EAS_boat_wp_lz] spawn {
	params ["_EAS_boat_wp_2", "_EAS_boat_wp_lz"];

	EAS_boat_escortG doMove _EAS_boat_wp_2;
	EAS_boat_insertC doMove _EAS_boat_wp_lz;
};

sleep 5;

[_EAS_boat_wp_1] spawn {
	params ["_EAS_boat_wp_1"];
	private _heliType = getText (missionConfigFile >> "cfgConstants" >> "HELI_SUPPORT");

	_insertHeli = createVehicle [_heliType, [getMarkerPos "EAS_spawn_heli" select 0, getMarkerPos "EAS_spawn_heli" select 1, 100], [], 0, "FLY"];
	_insertHeli allowDamage false;
	__insertHeliCrew = createVehicleCrew _insertHeli;
	_insertHeli engineOn true;
	_insertHeli setDir 229.053;

	_heliWp = __insertHeliCrew addWaypoint [_EAS_boat_wp_1, 100];
	_heliWp setWaypointType "LOITER";
	_heliWp setWaypointCombatMode "RED";
	_insertHeli flyInHeight 50;
};

waitUntil {
	{
		private _vehicle = vehicle leader _x;
		west knowsAbout _vehicle > 3.9;
	} count AAF_BOAT_PATROL > 0;
};

private _firedEH = EAS_boat_escort addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	    // set the flag to true when the boat fires
	missionNamespace setVariable ["boatHasFired", true];

	    // Optional: Remove the event handler if you only need to detect the first shot
	_unit removeEventHandler ["Fired", _thisEventHandler];
}];

sleep 1;
playSound "EAS_convo_aaf_boat_patrol_spotted";

sleep 4;

[] spawn {
	waitUntil {
		missionNamespace getVariable ["boatHasFired", false];
	};

	    // do something after the boat has fired
	playSound "EAS_convo_aaf_boat_patrol_firing";
};
EAS_boat_insertC setCombatMode "RED";
EAS_boat_escortG setCombatMode "RED";

waitUntil {
	player inArea EAS_tr_beach;
};

[SCREEN_ID, "end_noBorder", 5, 1, 0, 0] call EAS_fnc_cinemaMode;
sleep 2;
unassignVehicle player;
EAS_boat_insert setVelocity [0, 0, 0];
EAS_boat_insert setDir 0;
EAS_boat_insertC doMove _EAS_boat_wp_1;
{
	_x setPos _EAS_beach_lz;
} forEach units group player;

group player setFormation "DIAMOND";
group player setBehaviour "STEALTH";
group player setCombatMode "GREEN";

[SCREEN_ID, "start_noBorder", 5, 1, 0, 0] call EAS_fnc_cinemaMode;