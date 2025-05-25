// EAS_towerA addEventHandler ["Dammaged", {
// 	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
// 	hint "Tower Damaged";
// 	    // Check if critically damaged
// 	if (damage _unit > 0.8) then {
// 		systemChat "Object is critically damaged!";
// 		EAS_TOWER_A_DEAD = true;
// 	};
// }];

// EAS_towerA_1 addEventHandler ["Dammaged", {
// 	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
// 	hint "Tower Damaged";
// 	    // Check if critically damaged
// 	if (damage _unit > 0.8) then {
// 		systemChat "Object is critically damaged!";
// 		EAS_TOWER_A1_DEAD = true;
// 	};
// }];

waitUntil {
	// Check if both towers are dead
	if !(alive EAS_towerA && alive EAS_towerA_1) then {
		systemChat "Both towers are dead!";
		true
	} else {
		false
	};
};

["EAS_destroyCommsTowerA", true] call BIS_fnc_missionTasks;