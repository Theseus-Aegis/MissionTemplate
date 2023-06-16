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

START_USER_CODE
#include "admin\initPlayerLocal.sqf" // provides [_player, _didJIP]
// START USER CODE



// END USER CODE
END_USER_CODE
