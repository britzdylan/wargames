waitUntil {
	if !(alive EAS_aaf_radar) then {
		systemChat "Radar destroyed";
		true
	} else {
		false
	};
};

sleep 5;

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["2-2", "Radar destroyed", _delay],
	["Air Boss", "Solid Copy", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep _delay + 5;

EAS_RADAR_SITE_DEAD = true;

["EAS_radarSite", "SUCCEEDED"] call BIS_fnc_missionTasks;
saveGame;