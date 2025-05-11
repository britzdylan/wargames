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
_unit addWeapon "srifle_EBR_F";
_unit addPrimaryWeaponItem "muzzle_snds_B_arid_F";
_unit addPrimaryWeaponItem "acc_pointer_IR_snake_lxWS";
_unit addPrimaryWeaponItem "optic_DMS_snake_lxWS";
_unit addPrimaryWeaponItem "20Rnd_762x51_Mag";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "hgun_Glock19_RF";
_unit addHandgunItem "17Rnd_9x19_Mag_RF";

comment "Add containers";
_unit forceAddUniform "U_B_CTRG_Soldier_3_Arid_F";
_unit addVest "V_PlateCarrier1_blk";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {
	_unit addItemToVest "17Rnd_9x19_red_Mag_RF";
};
_unit addItemToVest "Chemlight_blue";
_unit addItemToVest "Chemlight_green";
_unit addItemToVest "B_IR_Grenade";
for "_i" from 1 to 2 do {
	_unit addItemToVest "MiniGrenade";
};
for "_i" from 1 to 6 do {
	_unit addItemToVest "20Rnd_762x51_Mag";
};
_unit addHeadgear "H_HelmetB_light_black";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "TiGoggles_tan_RF";