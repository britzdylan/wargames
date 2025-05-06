comment "Exported from Arsenal by britz";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "arifle_MXC_Black_F";
this addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";

comment "Add containers";
this forceAddUniform "EF_U_B_CrewCoveralls_Navy";
this addVest "V_Chestrig_blk";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {
	this addItemToUniform "30Rnd_65x39_caseless_black_mag";
};
this addHeadgear "EF_H_Cap_Navy";
this addGoggles "G_Headset_lxWS";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "ItemGPS";