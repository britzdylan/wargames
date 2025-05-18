if (isNil "EAS_MISSION_STARTED") exitWith {};
if (EAS_CURRENT_FLOW != 1) exitWith {};

// setup
waitUntil {
	!isNull driver EAS_veh_playerJet && driver EAS_veh_playerJet == player
};
sleep 1;
[SCREEN_ID, "start", 5, 5, 0, 20] spawn EAS_fnc_cinemaMode;
deleteVehicle EAS_man_deckCrew_0;
hint "Player in jet";
sleep 10;
EAS_man_wingman enableAI "ALL";

EAS_veh_playerJet engineOn true;
EAS_veh_wingmanJet engineOn true;

// other pilot get in
waitUntil {
	isEngineOn EAS_veh_playerJet;
};
sleep 3;

// radio sequence
[
	["CT", "Raptor 4-6, your second in line", 0],
	["You", "Raptor 4-6, roger", 3]
] spawn BIS_fnc_EXP_camp_playSubtitles;

