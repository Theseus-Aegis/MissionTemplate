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
    #include "admin\initServer.sqf"

    [{
        [QGVAR(MissionName), ["MISSION NAME", "MAP NAME"]] call CBA_fnc_globalEvent;
    }, [], 3600] call CBA_fnc_waitAndExecute;

    // START USER CODE

    // END USER CODE
}] call CBA_fnc_directCall;
