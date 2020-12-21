#include "..\script_component.hpp"
/*
 * Author: Muta, TyroneMF
 * Switches Lights on or off in a defined radius.
 * Call from init.sqf or Trigger.
 *
 * Arguments:
 * 0: Marker <STRING>
 * 1: Radius <NUMBER>
 * 2: On <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["LightsOut", 500, true] call FUNC(toggleLights);
 * ["LightsOut2", 250, false] call TAC_Scripts_fnc_toggleLights;
 */

params ["_marker", "_radius", "_on"];

private _targetTypes = [
    "Lamps_Base_F",
    "PowerLines_base_F",
    "Land_LampDecor_F",
    "Land_LampHalogen_F",
    "Land_LampHarbour_F",
    "Land_LampShabby_F",
    "Land_NavigLight",
    "Land_runway_edgelight",
    "Land_PowerPoleWooden_L_F",
    "Land_FuelStation_01_roof_malevil_F",
    "Land_fs_roof_F",
    "Land_Lighthouse_03_base_F",
    "Land_LightHouse_F",
    "Land_Airport_Tower_F"
];

private _state = ["OFF", "ON"] select _on;
private _markerPos = getMarkerPos _marker;

{
    private _lights = _markerPos nearObjects [_x, _radius];

    {
        _x switchLight _state;
    } forEach _lights;
} forEach _targetTypes;
