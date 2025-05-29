[[5, 1], [0, 1], [0, 1], [0, 1], [0, 1]] spawn EAS_fnc_adjustVolume;
EAS_blu_viper_2_1 enableSimulation false;
driver EAS_blu_viper_2_1 disableAI "ALL";
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
playSound ["EAS_planeTakingOff", 1, 0];
[
	["TAC", "Shark 4-6 your second line", 0],
	["4-6", "Shark 4-6, roger", 4],
	["TAC", "Ok sir, I need you to start turning", 8],
	["4-6", "Shark 4-6, turning", 12],
	["TAC", "All systems registered, you have a green light, putting tension on.", 16],
	["4-6", "Copy, here we go", 24]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep 14;
[SCREEN_ID, "start", 3, 3, 0, 15] spawn EAS_fnc_cinemaMode;
EAS_blu_viper_2_1 enableSimulation true;
driver EAS_blu_viper_2_1 enableAI "ALL";
EAS_blu_viper_2_1 engineOn true;
EAS_blu_viper_2_2 engineOn true;
sleep 15;
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
_viper21Wp_1 setWaypointScript "this reveal [EAS_aaf_plane_1, 4];
this doTarget EAS_aaf_plane_1;
this doWatch EAS_aaf_plane_1;
";

waitUntil {
	EAS_blu_viper_2_1 inArea EAS_area_clearedDeck; // wait until is airborne
};

[EAS_blu_viper_2_2] spawn BIS_fnc_aircraftCatapultLaunch;

sleep 3;
waitUntil {
	// player is off the deck
	player inArea EAS_area_clearedDeck;
};
playSound ["EAS_planeTakingOff_2", 1, 0];
[
	["4-6", "Good shot, Good engines, Good speed", 0],
	["TAC", "Shark 4-6, maintain angels 10", 4],
	["4-6", "Shark 4-6, Good copy.", 8],
	["4-3", "4-6, 4-2, moving to cloud layer, minor turbulence", 12],
	["4-6", "4-2, 4-6 copies, maintain formation", 16],
	["4-3", "Let's clear these skies 4-6, watch your sensors, maintain altitude", 20]
] spawn BIS_fnc_EXP_camp_playSubtitles;

{
	_x allowDamage true;
} forEach
[
	EAS_blu_viper_2_1,
	EAS_blu_viper_2_2
];
player setCaptive false;
EAS_blu_viper_2_1D setCaptive false;