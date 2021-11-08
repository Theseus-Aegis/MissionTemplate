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

    systemTimeUTC params ["_hour", "_minute", "_second"];
    private _timeUntilStart = (14 * 60 * 60) - (_hour * 60 * 60 + _minute * 60 + _second); // start time (1400z) - current time = time until start time
    [{
        [QGVAR(missionName), ["MISSION NAME", "MAP NAME"]] call CBA_fnc_globalEvent;
    }, [], _timeUntilStart] call CBA_fnc_waitAndExecute;

    // START USER CODE

    // END USER CODE
}] call CBA_fnc_directCall;
