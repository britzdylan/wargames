EAS_CURRENT_FLOW = EAS_CURRENT_FLOW + 1;

// call the dynamically named function 
private _functionName = format ["EAS_fnc_f0%1", EAS_CURRENT_FLOW];
private _functionCode = missionNamespace getVariable _functionName;

if (!isNil "_functionCode") then {
	[] call _functionCode;
} else {
	hint format ["ERROR: Function %1 not found!", _functionName];
};