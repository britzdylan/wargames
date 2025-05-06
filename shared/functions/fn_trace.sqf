params [["_file", __FILE_NAME__], ["_msg", ""]];

_debug = getNumber (missionConfigFile >> "cfgConstants" >> "DEBUG");
hint str _debug;
if (_debug == 0) exitWith {};
if (_debug == 1) then {
	hint format ["%1: %2", _file, _msg];
	diag_log format ["%1: %2", _file, _msg];
};