waitUntil {
	if !(alive EAS_aaf_tigris_2) then {
		systemChat "Tigris destroyed";
		true
	} else {
		false
	};
};

sleep 5;

_delay = round random 1 * 10; // random delay between 0 and 10 seconds
[
	["2-2", "Tigris destroyed", _delay],
	["Air Boss", "Solid Copy", _delay + 4]
] spawn BIS_fnc_EXP_camp_playSubtitles;

sleep _delay + 5;

["EAS_laseTigrisTwo", "SUCCEEDED"] call BIS_fnc_missionTasks;