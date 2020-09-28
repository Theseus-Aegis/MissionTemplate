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

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;

// ACRE2 God Mode
private _admins = ["76561198048995566", "76561198085500182"];
if ((getPlayerUID _player) in _admins) then {
    [true, true] call acre_api_fnc_godModeConfigureAccess;
    [_admins, 0] call acre_api_fnc_godModeModifyGroup;
    ["Admins", 0] call acre_api_fnc_godModeNameGroup;
};
