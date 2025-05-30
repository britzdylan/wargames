params ["_target", "_unit"];

blufor reportRemoteTarget [_target, 3600];
_target confirmSensorTarget [west, true];
_unit fireAtTarget [_target, "weapon_vls_01"];