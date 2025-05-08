// private _chairPosA = [9106.58, 29584, getPosASL player select 2];
// private _chairPosB = [9105.84, 29581.2, getPosASL player select 2];
// private _standPosA = [9107.49, 29584.4, getPosASL player select 2];
// private _standPosB = [9105.41, 29584.8, getPosASL player select 2];
// private _standPosC = [9103.58, 29584.1, getPosASL player select 2];
// private _standPosD = [9103.99, 29582.8, getPosASL player select 2];
// private _standPosE = [9104.11, 29580.7, getPosASL player select 2];
// private _instructorPos = [9107.99, 29579.9, getPosASL player select 2];

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
	blu_lopez
];

private _seatingMen = [
	player,
	blu_briefing_pilot
];

{
	_x setPosASL (_standingPos select _forEachIndex);
	sleep 0.1;
} forEach _standingMen;

{
	_x setPosASL (_chairPos select _forEachIndex);
	sleep 0.1;
} forEach _seatingMen;

{
	_x lookAt _instructorPos;
	_x setDir getDir player;
	sleep 0.1;
} forEach (_standingMen + _seatingMen);