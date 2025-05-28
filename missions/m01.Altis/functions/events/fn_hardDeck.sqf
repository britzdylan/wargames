_speeches = [
	"2-2, hard deck! Maintain altitude above 3000 meters!",
	"2-2, hard deck! Keep your altitude above 3000 meters!",
	"2-2, hard deck! Altitude above 3000 meters!",
	"2-2, hard deck! Stay above 3000 meters!",
	"2-2, hard deck! Altitude above 3000 meters, understood?",
	"2-2, hard deck! Keep your altitude above 3000 meters, understood?"
];

while { alive player && EAS_skyIsClear == false } do {
	sleep 10;
	_playerAlt = getPosASL player select 2;
	if (_playerAlt < 2999) then {
		_str = selectRandom _speeches;
		        _delay = round random 1 * 10; // random delay between 0 and 10 seconds
		[
			["Air Boss", _str, _delay]
		] spawn BIS_fnc_EXP_camp_playSubtitles;
	};
};