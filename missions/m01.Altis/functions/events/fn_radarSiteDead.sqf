waitUntil {
	if !(alive EAS_aaf_radar) then {
		systemChat "Radar destroyed";
		true
	} else {
		false
	};
};

sleep 5;

EAS_RADAR_SITE_DEAD = true;

["EAS_radarSite", "SUCCEEDED"] call BIS_fnc_missionTasks;