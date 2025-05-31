waitUntil {
	if !(alive EAS_aaf_tigris_2) then {
		systemChat "Tigris destroyed";
		true
	} else {
		false
	};
};

sleep 5;
EAS_TIGRIS_TWO_DEAD = true;

["EAS_laseTigrisTwo", "SUCCEEDED"] call BIS_fnc_missionTasks;