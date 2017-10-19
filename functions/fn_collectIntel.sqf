/*
 * Author: Kresky, Jonpas
 * Adds the ability to "pick up" objects, and add an intel entry in the briefing tab.
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Object name (The object you want to "pick up") <OBJECT>
 * 1: ACE Interact text <STRING>
 * 2: Hint message <STRING>
 * 3: Diary/briefing entry tab name <STRING>
 * 4: Description/text the intel contains <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [doc01, "Collect Document", "Document picked up", "Intel", "Document describing enemy movement plans"] call FUNC(collectIntel);
 */
#include "..\script_component.hpp"

params ["_controller", "_interactText", "_hintText", "_intelEntry", "_intelDescription"];

private _actionCollectIntel = [
    format [QGVAR(collectIntel_%1), _controller],
    _interactText,
    "",
    {
       (_this select 2) params ["_hintText", "_intelEntry", "_intelDescription"];
       [_hintText] call ACEFUNC(common,displayTextStructured);
       [_player, ["Diary", [_intelEntry, _intelDescription]]] remoteExecCall ["createDiaryRecord", 0, true];
       deleteVehicle this;
   },
   {true},
   {},
   [_hintText, _intelEntry, _intelDescription]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _actionCollectIntel] call ACEFUNC(interact_menu,addActionToObject);
