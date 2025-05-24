private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");
_introDuration = _introDuration + 24;
sleep 2;

// EAS_copilot say3D "EAS_ep001_convo_briefing";
[
	["Chief", "We just got raised to alert one!", 3]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep 3;