/*
	_taskID: STRING
	_taskState: STRING
	_taskExists: BOOL
	
	Parameter(s):
	0: STRING - unique mode
	1 (Optional): ANY - additional params
	2 (Optional): CODE - specific task function (default: "BIS_fnc_missionTasksLocal")
	
	Returns:
	BOOL
	
	    --
	
	    
	[owner, taskID, description, destination, state, priority, showNotification, type, visibleIn3D] call BIS_fnc_taskCreate
*/

case "EAS_briefing": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			EAS_briefing_location,
			true,
			nil,
			true,
			"whiteboard",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};