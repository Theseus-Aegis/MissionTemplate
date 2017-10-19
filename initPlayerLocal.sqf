setCurrentChannel 1;  // Sets default start channel to "Side"

params ["_player"];

[_player, specScreen] call TAC_Scripts_fnc_baseSpectator;
[_player] call TAC_Scripts_fnc_briefing;
