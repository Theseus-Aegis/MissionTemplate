#include "script_component.hpp"
/*
 * Author: Theseus Incorporated
 * Executes only on server at mission start
 * Executes before initPlayerLocal
 *
 * Arguments:
 * None
 *
 * Return Value
 * None
 *
 * Example:
 * None
 */
[{
    #include "\x\tac\addons\mission\template\initServer.hpp"

    // START USER CODE

    // END USER CODE
}] call CBA_fnc_directCall;
