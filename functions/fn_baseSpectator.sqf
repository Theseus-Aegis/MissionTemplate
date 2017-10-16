/*
 * Author: Jonpas
 * Adds dynamic spectator availability through CBA Chat Commands and ACE3 Interaction Menu.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Spectator Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, spectatorObject] call TAC_Scripts_fnc_baseSpectator
 */
#include "script_component.hpp"

params ["_player", "_object"];

// Event for closing spectator from other machines
[QGVAR(baseSpectatorProhibit), {
    [false] call ACEFUNC(spectator,setSpectator);
}, _player] call CBA_fnc_addEventHandlerArgs;

// Player open spectator on specified object
private _actionOpen = [
    QGVAR(baseSpectatorOpen),
    "Open Spectator",
    "\a3\3den\data\cfg3den\camera\cameratexture_ca.paa",
    {[true, false] call ACEFUNC(spectator,setSpectator)}, // Forced by default (second parameter), non-forced allows user to exit
    {(_this select 2) getVariable [QGVAR(baseSpectatorAllowed), false]},
    {},
    _object
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _actionOpen] call ACEFUNC(interact_menu,addActionToObject);

// Admin chat command to toggle spectator availability
["tac-spectator", {
    params ["_object"];
    if (_object getVariable [QGVAR(baseSpectatorAllowed), false]) then {
        [QGVAR(baseSpectatorProhibit), nil, call CBA_fnc_players] call CBA_fnc_targetEvent;
        _object setVariable [QGVAR(baseSpectatorAllowed), false, true];
        ["ace_common_systemChatGlobal", "[TAC] Spectator Prohibited"] call CBA_fnc_globalEvent;
    } else {
        _object setVariable [QGVAR(baseSpectatorAllowed), true, true];
        ["ace_common_systemChatGlobal", "[TAC] Spectator Allowed"] call CBA_fnc_globalEvent;
    };
}, "admin", _object] call CBA_fnc_registerChatCommand;
