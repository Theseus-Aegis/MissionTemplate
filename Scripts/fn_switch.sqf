#include "..\script_component.hpp"

/*
 * Author: Tyrone
 * Functionality for toggling switches, When "OFF" switch is red and power levels are 0, when "ON" switch is Green and power levels are either 1 or player defined.
 *
 * Requires fn_switchAction.sqf
 *
 * Can be checked by using getVariable on the object for switch state.
 * My_Switch getVariable ["TAC_Switched", false];
 *
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Switch <OBJECT>
 * 1: Left Voltage On <NUMBER> (default: 1)
 * 2: Right Voltage On <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Switch] call FUNC(switch);
 * [My_Switch, 0.5, 0.7] call FUNC(switch);
 */

params ["_object", ["_powerOne", 1], ["_powerTwo", 1]];

[{
    params ["_args", "_handle"];
    _args params ["_object", "_powerOne", "_powerTwo", ["_switchLastState", -1]];

    // Check all animation sources on objects to see if switched or not. (1: ON / -1: OFF)
    private _switch = _object animationSourcePhase "SwitchPosition";

    // Update last state
    _args set [3, _switch];

    if (_switch != _switchLastState) then {
        if (_switch == 1) then {
            _object animateSource ["Power_1", _powerOne, 0.25];
            _object animateSource ["Power_2", _powerTwo, 0.25];
            _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,1,0,0.05,ca)"];
            _object setVariable ["TAC_Switched", true, true];
        };
        if (_switch == -1) then {
            _object animateSource ["Power_1", 0, 0.25];
            _object animateSource ["Power_2", 0, 0.25];
            _object setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,0,0,0.05,ca)"];
            _object setVariable ["TAC_Switched", false, true];
        };
    };
}, 1, [_object, _powerOne, _powerTwo]] call CBA_fnc_addPerFrameHandler;
