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

case "EAS_destroyPowerPlant": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			getMarkerPos "EAS_destroyPowerPlantLocation",
			"CREATED",
			-1,
			true,
			"destroy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};

case "EAS_destroyCommsTowerA": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			getMarkerPos "EAS_destroyCommsTowerALocation",
			"CREATED",
			-1,
			true,
			"destroy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};

case "EAS_destroyCommsTowerB": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			getMarkerPos "EAS_destroyCommsTowerBLocation",
			"CREATED",
			-1,
			true,
			"destroy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};

case "EAS_reconForTargets": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			objNull,
			"CREATED",
			-1,
			true,
			"recon",
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};

case "EAS_hardDeck": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			objNull,
			"ASSIGNED",
			-1,
			true,
			"destroy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};

case "EAS_controlWesternAirSpace": {
	if (!(_taskExists)) then {
		[
			west,
			_taskID,
			"",
			objNull,
			"CREATED",
			-1,
			true,
			"destroy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted) && {
			typeName _this == typeName ""
		}) then {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};