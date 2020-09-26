#include "script_component.hpp"
/*
 * Author: Theseus Incorporated
 * Runs local to player on initialization.
 * Executed locally when player joins mission (includes both mission start and JIP).
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
[_player] call FUNC(godMode);

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;
