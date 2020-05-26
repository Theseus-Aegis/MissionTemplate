#include "script_component.hpp"
/*
 * Author: Theseus Incorporated
 * Initialization of scripts local to player
 * Executed locally when player joins mission (includes both mission start and JIP)
 * Executed after initServer and before initPlayerServer and init.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Did JIP <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 */

params ["_player", "_didJIP"];

[_player, specScreen] call FUNC(baseSpectator);
[_player] call FUNC(briefing);

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;
