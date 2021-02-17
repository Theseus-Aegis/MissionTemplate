#include "..\script_component.hpp"
/*
 * Author: Jonpas, Tyrone
 * Sets visibility of units, simulation and AI behaviour of a group.
 * Call from init.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Disable <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Test_Group_1, true] call TAC_scripts_fnc_reinforcements;
 * [Test_Group_1, false] call FUNC(reinforcements);
 */


params ["_group", "_state"];

{
    {
        if (_state) then {
            _x disableAI "ALL";
        } else {
            _x enableAI "ALL";
        };
        if (isServer) then {
            _x enableSimulationGlobal !_state;
            _x hideObjectGlobal _state;
        };
    } forEach Units _x;
} forEach [_Group];

