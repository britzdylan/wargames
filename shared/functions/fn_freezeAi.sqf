params [["_type", "all"], ["_enable", false]];
_fileName = __FILE_NAME__;

[_fileName, ""] call EAS_fnc_trace;

_arg = nil;

switch (_type) do {
	case "all": {
		_arg = allUnits;
	};
	case "group": {
		_arg = units group player;
	};
	case "player": {
		_arg = [player];
	};
	case "west": {
		_arg = units (allUnits select {
			side _x == west
		});
	};
	case "east": {
		_arg = units (allUnits select {
			side _x == east
		});
	};
	case "independent": {
		_arg = units (allUnits select {
			side _x == independent
		});
	};
	case "civ": {
		_arg = units (allUnits select {
			side _x == civilian
		});
	};
	default {
		_arg = allUnits;
	};
};

// Make sure array is passed down

{
	if (isNull _x) exitWith {};
	if (_enable) then {
		_x enableAI "ALL";
	} else {
		_x disableAI "ALL";
	};
	_x enableSimulation _enable;
	_x allowDamage _enable;
} forEach _arg;