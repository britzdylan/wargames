while { alive player && EAS_skyIsClear == false } do {
	sleep 10;
	_playerAlt = getPosASL player select 2;
	if (_playerAlt < 2999) then {
		playSound "EAS_altitude";
	};
};