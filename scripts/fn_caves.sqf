#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles night-time cycle in caves, removes Map & MicroDAGR if player has one.
 * Will check an array of markers instead of running multiple per frame handlers on players.
 * The time of day and custom ACRE signal can be edited in the defines.
 *
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Markers <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, ["Marker_1"]] call FUNC(caves);
 * [_player, ["Marker_1", "Marker_2"]] call FUNC(caves);
 */

params ["_player", "_markers"];

#define DATE_TIME 23
#define CUSTOM_SIGNAL [0.05, -70]

private _nightTime = date;
_nightTime set [3, DATE_TIME];

// Check Gear Event
[QGVAR(CaveGearCheck), {
    params ["_player"];
    // Check if player has GPS
    private _gpsCheck = "ACE_microDAGR" in ([_player] call CBA_fnc_uniqueUnitItems);
    if (_gpsCheck) then {
        _player setVariable [QGVAR(hasGPS), true];
    } else {
        _player setVariable [QGVAR(hasGPS), false];
    };

    // Check if player has Watch
    private _watchCheck = "ItemWatch" in ([_player] call CBA_fnc_uniqueUnitItems);
    if (_watchCheck) then {
        _player setVariable [QGVAR(hasWatch), true];
    } else {
        _player setVariable [QGVAR(hasWatch), false];
    };
}] call CBA_fnc_addEventHandler;

[{
    params ["_args", "_handle"];
    _args params ["_player", "_markers", "_nightTime", ["_radioSet", false], ["_itemChecks", false]];

    private _inArea = _markers findIf {_player inArea _x};
    private _hasGPS = _player getVariable QGVAR(hasGPS);
    private _hasWatch = _player getVariable QGVAR(hasWatch);

    if (_inArea >= 1) then {
        setDate _nightTime;

        // Wreck Radios
        if (!_radioSet) then {
            [{CUSTOM_SIGNAL}] call acre_api_fnc_setCustomSignalFunc;
            _args set [3, true];
        };

        // Remove Items
        if (!_itemChecks) then {
            [QGVAR(CaveGearCheck), [_player]] call CBA_fnc_localEvent;
            if (_hasGPS) then {
                _player removeItem "ACE_microDAGR";
            };
            if (_hasWatch) then {
                _player unlinkItem "ItemWatch";
            };
            _args set [4, true];
        };
    };

    if (_inArea == -1) then {
        // Single/MP Testing
        if (is3DENPreview) then {
            private _testingDate = date;
            _testingDate set [3, 10];
        };

        // Reset Radios
        if (_radioSet) then {
            _args set [3, false];
            [{}] call acre_api_fnc_setCustomSignalFunc;
        };

        // Re-add removed items
        if (_itemChecks) then {
            if (_hasGPS) then {
                _player addItem "ACE_microDAGR";
            };
            if (_hasWatch) then {
                _player linkItem "ItemWatch";
            };
            _args set [4, false];
        };
    };
}, 1, [_player, _markers, _nightTime]] call CBA_fnc_addPerFrameHandler;
