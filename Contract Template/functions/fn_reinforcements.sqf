#include "..\script_component.hpp"
/*
 * Author: Jonpas, Tyrone
 * Sets visibility of units, simulation and AI behaviour of a group along with any vehicles manned by the group.
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
 * [Test_Group_1, true] call FUNC(reinforcements);
 * [Test_Group_1, false] call TAC_Scripts_fnc_reinforcements;
 */

params ["_group", "_state"];

if (hasInterface && !isServer) exitWith {};

{
    {
        if (local _x) then {
            if (_state) then {
                _x disableAI "ALL";
            } else {
                _x enableAI "ALL";
            };
        };
        if (isServer) then {
            _x enableSimulationGlobal !_state;
            _x hideObjectGlobal _state;

            private _vehicle = vehicle _x;
            if (_vehicle != _x && {simulationEnabled _vehicle == _state}) then {
                _vehicle enableSimulationGlobal !_state;
                _vehicle hideObjectGlobal _state;
            };
        };
    } forEach (units _x);
} forEach [_group];
