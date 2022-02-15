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

    // Mission start notification
    [getMissionConfigValue ["onLoadName", ""], getText (configFile >> "CfgWorlds" >> worldName >> "description")] call _setMissionName;

    // START USER CODE

    // END USER CODE
}] call CBA_fnc_directCall;
