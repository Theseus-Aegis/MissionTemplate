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

params ["_player", "_object"];

// Event for closing spectator from other machines
["tac_baseSpectatorProhibit", {
    [false] call ace_spectator_fnc_setSpectator;
}, _player] call CBA_fnc_addEventHandlerArgs;

// Player open spectator on specified object
private _actionOpen = [
    "tac_baseSpectatorOpen",
    "Open Spectator",
    "\a3\3den\data\cfg3den\camera\cameratexture_ca.paa",
    {[true, false] call ace_spectator_fnc_setSpectator}, // Forced by default (second parameter), non-forced allows user to exit
    {(_this select 2) getVariable ["tac_baseSpectatorAllowed", false]},
    {},
    _object
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _actionOpen] call ace_interact_menu_fnc_addActionToObject;

// Admin chat command to toggle spectator availability
tac_baseSpectatorObject = _object;
["tac-spectator", {
    if (tac_baseSpectatorObject getVariable ["tac_baseSpectatorAllowed", false]) then {
        ["tac_baseSpectatorProhibit", nil, call CBA_fnc_players] call CBA_fnc_targetEvent;
        tac_baseSpectatorObject setVariable ["tac_baseSpectatorAllowed", false, true];
        ["ace_common_systemChatGlobal", "[TAC] Spectator Prohibited"] call CBA_fnc_globalEvent;
    } else {
        tac_baseSpectatorObject setVariable ["tac_baseSpectatorAllowed", true, true];
        ["ace_common_systemChatGlobal", "[TAC] Spectator Allowed"] call CBA_fnc_globalEvent;
    };
}] call CBA_fnc_registerChatCommand;
