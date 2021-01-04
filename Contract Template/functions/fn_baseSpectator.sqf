#include "..\script_component.hpp"
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
 * [player, spectatorObject] call FUNC(baseSpectator);
 */

#define NOTIFY_RANGE 50

params ["_player", "_object"];

// Verify object exists (getVariable work-around as we get object, which likes to return <any>)
if (isNull (missionNamespace getVariable [str _object, objNull])) exitWith {
    ERROR_WITH_TITLE("Spectator screen not found!", "Expected 'specScreen' object");
};

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
["tac-spec", {
    //USES_VARIABLES ["_thisArgs"]

    private _nearbyPlayers = _thisArgs nearObjects ["CAManBase", NOTIFY_RANGE];
    _nearbyPlayers pushBackUnique ACE_player;

    if (_thisArgs getVariable [QGVAR(baseSpectatorAllowed), false]) then {
        [QGVAR(baseSpectatorProhibit), nil, call CBA_fnc_players] call CBA_fnc_targetEvent;
        _thisArgs setVariable [QGVAR(baseSpectatorAllowed), false, true];
        ["ace_common_systemChatGlobal", "[TAC] Spectator Prohibited", _nearbyPlayers] call CBA_fnc_targetEvent;
    } else {
        _thisArgs setVariable [QGVAR(baseSpectatorAllowed), true, true];
        ["ace_common_systemChatGlobal", "[TAC] Spectator Allowed", _nearbyPlayers] call CBA_fnc_targetEvent;
    };
}, "admin", _object] call CBA_fnc_registerChatCommand;
