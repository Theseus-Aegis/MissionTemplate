#include "..\script_component.hpp"
/*
 * Author: Tyrone
 * Adds chat command to save AAR replay for logged in admin.
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

[QGVAR(saveAAR), {
    [] call ocap_fnc_exportData;
}] call CBA_fnc_addEventHandler;

[QGVAR(captureAAR), {
    [] call ocap_fnc_init;
}] call CBA_fnc_addEventHandler;

["tac-capture", {
	[QGVAR(captureAAR), []] call CBA_fnc_serverEvent;
	"AAR Recording." call CBA_fnc_notify;
}, "admin"] call CBA_fnc_registerChatCommand;

["tac-save", {
    [QGVAR(saveAAR), []] call CBA_fnc_serverEvent;
    "AAR Saved." call CBA_fnc_notify;
}, "admin"] call CBA_fnc_registerChatCommand;
