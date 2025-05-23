/*
	    Author: Dylan Britz
	    
	    Description:
	    Handles different cinematic screen effects with black screen fades and cinematic borders
	    
	    Parameters:
	    _this select 0: STRING - Preset name (start_end, start, end, scene, start_end_noBorder, start_noBorder, end_noBorder)
	    _this select 1: NUMBER - (Optional) Fade in duration (default: 3)
	    _this select 2: NUMBER - (Optional) Fade out duration (default: 3) 
	    _this select 3: NUMBER - (Optional) Delay before fade in (default: 0)
	    _this select 4: NUMBER - (Optional) Delay before fade out (default: 0)
	    _this select 5: NUMBER - (Optional) Duration between fades (default: 0)
	    
	    Returns:
	    STRING - Screen ID for later reference to end effects
*/

params [
	["_ID", "", [""]],
	["_preset", "start_end", [""]],
	["_fadeInDuration", 3, [0]],
	["_fadeOutDuration", 3, [0]],
	["_delay", 0, [0]],
	["_durationBetweenFades", 0, [0]]
];

// private _ID = format ["screen-%1", str floor(random 10000)];
private _useBorders = !(_preset in ["start_end_noBorder", "start_noBorder", "end_noBorder"]);
private _startWithBlack = _preset in ["start_end", "start", "start_end_noBorder", "start_noBorder"];
private _endWithBlack = _preset in ["start_end", "end", "start_end_noBorder", "end_noBorder"];

if (_delay > 0) then {
	sleep _delay;
};

if (_useBorders) then {
	if (_startWithBlack) then {
		[0, 0, false, true] call BIS_fnc_cinemaBorder;
	} else {
		[0, _fadeInDuration, false, true] call BIS_fnc_cinemaBorder;
	}
};

if (_startWithBlack) then {
	[_ID, true, _fadeInDuration] call BIS_fnc_blackIn;
	sleep _fadeInDuration;
};

    // Wait for duration between fades if needed
if (_durationBetweenFades > 0) then {
	sleep _durationBetweenFades;
};

if (_endWithBlack) then {
	// Fade to black
	[_ID, true, _fadeOutDuration] call BIS_fnc_blackOut;
	sleep _fadeOutDuration;
};

if (_useBorders) then {
	if (_endWithBlack) then {
		[1, 0, false, true] call BIS_fnc_cinemaBorder;
	} else {
		[1, _fadeInDuration, false, true] call BIS_fnc_cinemaBorder;
	}
};

_ID

// Example usage:
// Simple start and end with default values
// _ID = ["start_end"] call fnc_cinematicEffect;

// Custom fade durations
// _ID = ["start_end", 2, 2] call fnc_cinematicEffect;

// Full control with all parameters
// _ID = ["start", 3, 3, 1, 0, 5] call fnc_cinematicEffect;