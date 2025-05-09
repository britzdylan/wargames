[[3, 0], [3, 0], [3, 0], [3, 0], [3, 0]] spawn EAS_fnc_adjustVolume;
_screenId = ["end_noBorder"] call EAS_fnc_cinemaMode;

[] call EAS_fnc_freezeAi;

// setup scene
private _getConfigPos = {
	params ["_className"];
	private _config = missionConfigFile >> "cfgCutscenes" >> "BriefingPositions" >> _className;
	private _pos = getArray (_config >> "pos");
	private _dir = getNumber (_config >> "dir");
	private _anim = getText (_config >> "animation");

	// Update Z coordinate with current height
	_pos set [2, getPosASL player select 2];

	[_pos, _dir, _anim]
};

private _standingMen = [
	blu_walker,
	blu_mckay,
	blu_givens,
	blu_everett,
	blu_lopez,
	blu_instructor
];

private _seatingMen = [
	player,
	blu_briefing_pilot
];

private _standingPositions = ["standA", "standB", "standC", "standD", "standE", "instructor"];
private _seatingPositions = ["chair1", "chair2"];

{
	private _posData = [_standingPositions select _forEachIndex] call _getConfigPos;
	_posData params ["_pos", "_dir", "_anim"];

	_ogPos = getPos _x;
	_ogDir = getDir _x;
	_ogAnim = animationState _x;
	_chanceSpawn = round random 1;
	_x setVariable ["EAS_unit_og_pos", _ogPos];
	_x setVariable ["EAS_unit_og_dir", _ogDir];
	_x setVariable ["EAS_unit_spawn", _chanceSpawn];
	_x setVariable ["EAS_anim", _ogAnim];
	_x setPosASL _pos;
	_x setDir _dir;
	if (_anim != "") then {
		_x switchMove _anim;
	};
	sleep 0.1;
} forEach _standingMen;

{
	private _posData = [_seatingPositions select _forEachIndex] call _getConfigPos;
	_posData params ["_pos", "_dir", "_anim"];

	_x setPosASL _pos;
	_x setDir _dir;
	if (_anim != "") then {
		_x switchMove _anim;
	};
	sleep 0.1;
} forEach _seatingMen;

["all", true] call EAS_fnc_freezeAi;
[[3, 1], [3, 1], [3, 1], [3, 1], [3, 1]] spawn EAS_fnc_adjustVolume;
["start", 3, 3, 0, 3, _screenId] spawn EAS_fnc_cinemaMode;

// start talk
sleep 3;
// blu_instructor say3D ["yourSound", 30];
// sleep 15;
_screen2ID = ["end_noBorder", 3, 3, 0, 0] call EAS_fnc_cinemaMode;
// reset units positions once done
{
	_ogPos = _x getVariable "EAS_unit_og_pos";
	_ogDir = _x getVariable "EAS_unit_og_dir";
	_ogAnim = _x getVariable "EAS_anim";
	_x setPosASL [_ogPos select 0, _ogPos select 1, getPosASL player select 2];
	_x setDir _ogDir;
	_x switchMove _ogAnim;
	sleep 0.1;
} forEach _standingMen;

sleep 1;
player switchMove "";
["start_noBorder", 3, 3, 0, 0, _screen2ID] call EAS_fnc_cinemaMode;