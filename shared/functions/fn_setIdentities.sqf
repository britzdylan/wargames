params [["_units", [], [[]]]];
[__FILE_NAME__, _units] call EAS_fnc_trace;

{
	_x setIdentity vehicleVarName _x;
} forEach _units;