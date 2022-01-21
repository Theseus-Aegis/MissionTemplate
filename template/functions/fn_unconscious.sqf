#include "..\script_component.hpp"
/*
 * Author: Tyrone
 * Switches ACRE spoken language on unconsciousness
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(unconscious);
 */

params ["_player"];

if (!hasInterface) exitWith {};

// Set languages
["en", "English"] call acre_api_fnc_babelAddLanguageType;
["un", "Unconscious"] call acre_api_fnc_babelAddLanguageType;

// Set spoken
["en"] call acre_api_fnc_babelSetSpokenLanguages;

// Switch language on unconscious toggle
["ace_unconscious", {
    params ["_unit", "_state"];
    if (_unit != ACE_player) exitWith {}; // Required because of global event
    if (_state) then {
        ["un"] call acre_api_fnc_babelSetSpokenLanguages;
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };
}] call CBA_fnc_addEventHandler;

// Handle dying while unconscious
_player addEventHandler ["Respawn", {
    ["en"] call acre_api_fnc_babelSetSpokenLanguages;
}];
