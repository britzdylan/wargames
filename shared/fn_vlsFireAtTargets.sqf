waitUntil {
	EAS_blu_viper_2_1 inArea EAS_area_launchVls;
};

{
	waitUntil {
		EAS_blu_vls weaponReloadingTime [gunner EAS_blu_vls, "weapon_vls_01"] == 0;
	};
	[_x, EAS_blu_vls] call EAS_fnc_vlsFire;
	EAS_blu_vls setWeaponReloadingTime [gunner EAS_blu_vls, "weapon_vls_01", 0];
	sleep 4;
}
forEach
[
	EAS_target_0,
	EAS_target_1,
	EAS_target_2,
	EAS_target_3,
	EAS_target_4
];