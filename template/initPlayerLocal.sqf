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

[{
    params ["_player", "_didJIP"];

    #include "\x\tac\addons\mission\template\initPlayerLocal.hpp"

    // START USER CODE

    // END USER CODE
}, _this] call CBA_fnc_directCall;
