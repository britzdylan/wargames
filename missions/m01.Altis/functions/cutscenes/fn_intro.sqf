[[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]] spawn EAS_fnc_adjustVolume;
private _introDuration = getNumber (missionConfigFile >> "cfgConstants" >> "INTRO_DURATION");
_introDuration = _introDuration + 24;
player setPosASL [9109.87, 29585.4, getPosASL EAS_player select 2];
player allowDamage false;
// ["player", true] call EAS_fnc_freezeAi;

[[3, 1], [0, 1], [3, 0.2], [0, 0], [3, 0.1]] call EAS_fnc_adjustVolume;
sleep 1;

[SCREEN_ID, "start", 1, 1, 0, _introDuration] spawn EAS_fnc_cinemaMode; // always call last

// ["all", true] call EAS_fnc_freezeAi; // unFreeze all AI
// play intro audio
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
EAS_copilot playMoveNow "Acts_hubTalk_Loop20";
[] spawn {
	player playMoveNow "HubSpectator_walkU";// 3.5s
	sleep 1;
	player switchMove "";
};

sleep _introDuration;
EAS_copilot switchMove "Acts_hubTalk_turnRight1";
player allowDamage true;
[[1, 1], [5, 1], [5, 1], [5, 1], [5, 1]] spawn EAS_fnc_adjustVolume;