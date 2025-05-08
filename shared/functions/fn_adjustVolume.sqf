params [
	["_sound", [0, 1]],
	["_speech", [0, 1]],
	["_music", [0, 1]],
	["_radio", [0, 1]],
	["_environment", [0, 1]]
];
hint str _sound;
(_sound select 0) fadeSound (_sound select 1);
(_speech select 0) fadeSpeech (_speech select 1);
(_music select 0) fadeMusic (_music select 1);
(_radio select 0) fadeRadio (_radio select 1);
(_environment select 0) fadeEnvironment (_environment select 1);

// [[0, 1], [0, 0], [1, 3], [0, 0], [0, 0]] spawn EAS_fnc_adjustVolume;