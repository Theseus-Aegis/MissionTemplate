#include "..\script_component.hpp"

/*
 * Author: Tyrone
 * Adds ACE action for fn_switch.sqf
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * [My_Switch] call FUNC(switchAction);
*/

params ["_object"];

private _switchAction = [
    QGVAR(switchAction),
    "Flick Switch",
    "",
    {
        params ["_player", "_target", "_args"];
        _args params ["_object"];
        private _sourcePhase = _object animationSourcePhase "SwitchPosition";
        if (_sourcePhase == -1) then {
            _object animateSource ["SwitchPosition", 1, 0.5];
        } else {
            _object animateSource ["SwitchPosition", -1, 0.5];
        };
    },
    {true},
    {},
    _object,
    "controlling_handle"
] call ACEFUNC(interact_menu,createAction);

[_object, 0, [], _switchAction] call ACEFUNC(interact_menu,addActionToObject);
