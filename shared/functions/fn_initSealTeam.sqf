_sealTeam = [blu_walker, blu_everett, blu_givens, blu_mckay, blu_lopez, blu_patterson];

[_sealTeam] spawn EAS_fnc_setIdentities;

{
	_x setSkill 1;
	[_x, "Ghosts_RF"] call BIS_fnc_setUnitInsignia;

	switch (vehicleVarName _x) do {
		case "blu_walker": {
			_x setRank "SERGEANT";
		};
		case "blu_everett": {
			_x setRank "SERGEANT";
		};
		case "blu_givens": {
			_x setRank "SERGEANT";
		};
		case "blu_mckay": {
			_x setRank "CORPORAL";
		};
		case "blu_lopez": {
			_x setRank "CORPORAL";
		};
		case "blu_patterson": {
			_x setRank "LIEUTENANT";
		};
		default {};
	};
} forEach _sealTeam;