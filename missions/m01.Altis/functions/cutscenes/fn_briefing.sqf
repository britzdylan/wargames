//

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

private _instructorData = ["instructor"] call _getConfigPos;
private _instructorPos = _instructorData select 0;

private _standingMen = [
	blu_walker,
	blu_mckay,
	blu_givens,
	blu_everett,
	blu_lopez
];

private _seatingMen = [
	player,
	blu_briefing_pilot
];

private _standingPositions = ["standA", "standB", "standC", "standD", "standE"];
private _seatingPositions = ["chair1", "chair2"];

{
	private _posData = [_standingPositions select _forEachIndex] call _getConfigPos;
	_posData params ["_pos", "_dir", "_anim"];

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