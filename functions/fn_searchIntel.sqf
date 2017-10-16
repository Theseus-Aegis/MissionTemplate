/*
 * Author: Kresky, Jonpas
 * Adds the ability to search an object for intel or "collect" objects as intel items. Intel will be added to the ingame briefing tab.
 * Call from object init.
 *
 * Arguments:
 * 0: Interaction object <OBJECT>
 * 1: ACE Interact text <STRING>
 * 2: Hint message <STRING>
 * 3: Diary/briefing entry tab name <STRING>
 * 4: Description/text the intel contains <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "Search", "Found a document", "Enemy Documents", "Document describing enemy movement plans"] call TAC_Scripts_fnc_searchIntel
 */
#include "script_component.hpp"

params ["_controller", "_interactText", "_hintText", "_intelEntry", "_intelDescription"];

private _actionSearch = [
    format ["TAC_Scripts_searchIntel_%1", _controller],
    _interactText,
    "",
    {
        (_this select 2) params ["_hintText", "_intelEntry", "_intelDescription"];
        [_hintText] call ace_common_fnc_displayTextStructured;
        [QGVAR(createDiaryRecordGlobal), [_player, ["Diary", [_intelEntry, _intelDescription]]]] call CBA_fnc_globalEventJIP;
        deleteVehicle this;
    },
    {true},
    {},
    [_hintText, _intelEntry, _intelDescription]
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _actionSearch] call ACE_Interact_Menu_fnc_addActionToObject;
