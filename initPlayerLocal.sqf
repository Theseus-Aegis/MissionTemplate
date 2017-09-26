setCurrentChannel 1;

params ["_player"];

[_player, specScreen] call TAC_Scripts_fnc_baseSpectator; // Replace 'objNull' with spectator access object
[_player] call TAC_Scripts_fnc_briefing;
