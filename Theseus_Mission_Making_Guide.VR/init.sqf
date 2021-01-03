#include "script_component.hpp"
/*
 * Author: Theseus Incorporated
 * Runs globally on mission start
 * Executed globally before briefing screen (does not run again for JIP players unlike editor init field)
 * Executes before initPlayerLocal and initPlayerServer
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
    #include "admin\init.sqf"

}] call CBA_fnc_directCall;
