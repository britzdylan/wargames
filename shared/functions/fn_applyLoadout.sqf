params ["_name", "_unit"];
// call the dynamically named function 
private _functionName = format ["EAS_fnc_lo_%1", _name];
private _functionCode = missionNamespace getVariable _functionName;

if (!isNil "_functionCode") then {
	[_unit] spawn _functionCode;
} else {
	hint format ["ERROR: Function %1 not found!", _functionName];
};