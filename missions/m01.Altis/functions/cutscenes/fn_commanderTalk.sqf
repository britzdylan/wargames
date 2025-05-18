private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");
_introDuration = _introDuration + 24;
// [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]] spawn EAS_fnc_adjustVolume;
// [SCREEN_ID, "start", 2, 0, 0, _introDuration] spawn EAS_fnc_cinemaMode;
EAS_copilot switchMove "Acts_hubTalk_turnRight1";
sleep 2;
// EAS_copilot setRandomLip true;
EAS_copilot say3D "EAS_ep001_convo_briefing";
[
	["Chief", "Jo, we just got raised to alert one!", 0],
	["Chief", "Command is going to fill us in airborne.", 3],
	["Chief", "But we are flying a strike mission over Altis, into the main Airport.", 5.5],
	["Chief", "SIGINT has sat images - they think they know where Stavrou is.", 10.6],
	["Chief", "Reports have been coming in of enemy bogeys in the airspace!", 15.2],
	["Chief", "They're not responding to our interrogation signals.", 19.4],
	["Chief", "So get your game face on, this is the real deal today.", 22.4]
] spawn BIS_fnc_EXP_camp_playSubtitles;
sleep _introDuration;
// EAS_copilot setRandomLip false;
EAS_copilot switchMove "Acts_Explaining_EW_Loop02";
player allowDamage true;
[[5, 1], [5, 1], [5, 1], [5, 1], [5, 1]] spawn EAS_fnc_adjustVolume;