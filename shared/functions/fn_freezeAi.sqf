params [["_units", []], ["_enable", false]];
_fileName = __FILE_NAME__;

// [_fileName, ""] call EAS_fnc_trace;

{
	_x enableSimulation _enable;
	_x allowDamage _enable;
	if (_enable) then {
		_x enableAI "ALL";
	} else {
		_x disableAI "ALL";
	};
} forEach _units;