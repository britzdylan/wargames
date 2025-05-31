waitUntil {
	if !(alive EAS_aaf_tigris_1) then {
		systemChat "Tigris destroyed";
		true
	} else {
		false
	};
};

sleep 5;
EAS_TIGRIS_ONE_DEAD = true;

["EAS_laseTigrisOne", "SUCCEEDED"] call BIS_fnc_missionTasks;