[[5, 1], [0, 1], [0, 1], [0, 1], [0, 1]] spawn EAS_fnc_adjustVolume;
EAS_blu_viper_2_1 enableSimulation false;
// driver EAS_blu_viper_2_1 disableAI "ALL";
player action ["nvGoggles", player];

{
	_x allowDamage false;
	driver _x setCaptive true;
} forEach
[
	EAS_blu_viper_2_1,
	EAS_blu_viper_2_2
];

sleep 3;

// [
	// ["Player", "Pri-Fly, Viper 2-2, copy Charlie. Request start engines.", 0], 
	// ["Air Boss", "2-2, cleared hot. Start 'em up.", 4], 
	// ["Player", "2-2's turning and burning.", 8], 
	// ["Air Boss", "Viper 2-1, you're number one for launch, Cat 2. Weight board shows 54, 000.", 12], 
	// ["Viper 2-1", "2-1 copies, 54K, Cat 2.", 16], 
	// ["Catapult Officer", "Shooter to 2-1, final checks complete, you own the jet. Good luck and come home safe.", 20], 
	// ["Viper 2-1", "2-1's ready to go.", 24]
// ] spawn BIS_fnc_EXP_camp_playSubtitles;

// sleep 4;
[SCREEN_ID, "start", 3, 3, 0, 999] spawn EAS_fnc_cinemaMode;
EAS_blu_viper_2_1 enableSimulation true;
driver EAS_blu_viper_2_1 enableAI "ALL";
EAS_blu_viper_2_1 engineOn true;
EAS_blu_viper_2_2 engineOn true;
sleep 10;
[EAS_blu_viper_2_1] spawn BIS_fnc_aircraftCatapultLaunch;

private _viper21Wp_0 = group EAS_blu_viper_2_1D addWaypoint [getMarkerPos "EAS_wp_viper_21_wp_0", 200, 0];
private _viper21Wp_1 = group EAS_blu_viper_2_1D addWaypoint [getMarkerPos "EAS_wp_viper_21_wp_1", 200, 1];
private _viper21Wp_2 = group EAS_blu_viper_2_1D addWaypoint [getMarkerPos "EAS_wp_viper_21_wp_2", 200, 2];
EAS_blu_viper_2_1 flyInHeight 3000;
{
	_x setWaypointType "MOVE";
	_x setWaypointBehaviour "AWARE";
	_x setWaypointCombatMode "BLUE";
	_x setWaypointSpeed "FULL";
} forEach
[
	_viper21Wp_0,
	_viper21Wp_1
];

_viper21Wp_2 setWaypointType "SAD";
_viper21Wp_2 setWaypointSpeed "NORMAL";
_viper21Wp_2 setWaypointCompletionRadius 3000;
_viper21Wp_2 setWaypointCombatMode "RED";
_viper21Wp_1 setWaypointScript "this flyInHeight 3000;
this setCaptive false;
";

waitUntil {
	EAS_blu_viper_2_1 inArea EAS_area_clearedDeck; // wait until is airborne
};

// [
	// ["Viper 2-1", "Viper 2-1 airborne... good shot... climbing.", 0], 
	// ["Air Boss", "Viper 2-2, you're up next, Cat 2. Same weight, 54000.", 4], 
	// ["Player", "2-2 copies, 54K.", 8], 
	// ["Catapult Officer", "2-2, tension good, you have control. Ready for launch?", 12], 
	// ["Player", "2-2's ready.", 16], 
	// ["Catapult Officer", "Send it.", 20]
// ] spawn BIS_fnc_EXP_camp_playSubtitles;

// sleep 21;
[EAS_blu_viper_2_2] spawn BIS_fnc_aircraftCatapultLaunch;
// [1, 0, false, true] call BIS_fnc_cinemaBorder;

[SCREEN_ID, "start", 1, 1, 0, 0] spawn EAS_fnc_cinemaMode;
sleep 3;
waitUntil {
	// player is off the deck
	player inArea EAS_area_clearedDeck;
};

[
	["Player", "2-2 off the deck... climbing.", 0],
	["Departure", "Viper flight, Departure Control, radar contact. Climb and maintain flight level 150, proceed on course 045.", 4],
	["Viper 2-1", "2-2, stack high, maintain 15. We'll sweep the area first, then push down for targets.", 8],
	["Player", "2-1, 2-2 copies. Stacking high, 15 thousand.", 12]
] spawn BIS_fnc_EXP_camp_playSubtitles;

{
	_x allowDamage true;
} forEach
[
	EAS_blu_viper_2_1
	// EAS_blu_viper_2_2
];
player setCaptive false;
EAS_blu_viper_2_1D setCaptive false;