#include "..\script_component.hpp"
/*
 * Author: Tyrone
 * Registers chat commands for use.
 * call from init.sqf
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(chatCommands);
 */

// AAR Capture and Save
["tac-capture", {
    [QGVAR(captureAAR), []] call CBA_fnc_serverEvent;
    "AAR Recording." call CBA_fnc_notify;
}, "admin"] call CBA_fnc_registerChatCommand;

["tac-save", {
    [QGVAR(saveAAR), []] call CBA_fnc_serverEvent;
    "AAR Saved." call CBA_fnc_notify;
}, "admin"] call CBA_fnc_registerChatCommand;
