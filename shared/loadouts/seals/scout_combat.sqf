params ["_unit"];
comment "Exported from Arsenal by britz";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_SPAR_01_snd_F";
_unit addPrimaryWeaponItem "muzzle_snds_m_snd_F";
_unit addPrimaryWeaponItem "acc_pointer_IR_sand_lxWS";
_unit addPrimaryWeaponItem "ef_optic_mbs_sand";
_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag_Sand";
_unit addWeapon "hgun_Glock19_RF";
_unit addHandgunItem "17Rnd_9x19_Mag_RF";

comment "Add containers";
_unit forceAddUniform "U_B_CTRG_Soldier_3_Arid_F";
_unit addVest "V_PlateCarrier1_blk";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 8 do {
	_unit addItemToVest "30Rnd_556x45_Stanag_Sand";
};
for "_i" from 1 to 2 do {
	_unit addItemToVest "17Rnd_9x19_red_Mag_RF";
};
_unit addItemToVest "Chemlight_blue";
_unit addItemToVest "Chemlight_green";
_unit addItemToVest "B_IR_Grenade";
_unit addItemToVest "MiniGrenade";
for "_i" from 1 to 2 do {
	_unit addItemToVest "SmokeShellBlue";
};
for "_i" from 1 to 2 do {
	_unit addItemToVest "SmokeShellGreen";
};
_unit addHeadgear "H_HelmetB_light_black";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "TiGoggles_tan_RF";

comment "Set identity";
[_unit, "WhiteHead_10", "male04eng"] call BIS_fnc_setIdentity;