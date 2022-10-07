#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles night-time cycle in caves, removes Map & MicroDAGR if player has one.
 * Testing in single player or local multiplayer will not reset the date back to original, This is handled by syncing to the server date.
 * Will check an array of markers instead of running multiple per frame handlers on players.
 *
 * Call from initPlayerLocal
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
#define GEARCHECK_WAIT_TIME 3900
#define CUSTOM_SIGNAL [0.05, -70]

 private _nightTime = date;
 _nightTime set [3, DATE_TIME];


// SetVariable does 0 for unchecked, 1 for true and 2 for false.
_player setVariable [QGVAR(hasGPS), 0];
_player setVariable [QGVAR(hasWatch), 0];

// Wait 1 hour 5 minutes for gear check.
[{
    params ["_player"];
    // Check if player has GPS
    if ((_player getVariable QGVAR(hasGPS)) == 0) then {
        private _gpsCheck = "ACE_microDAGR" in ([_player] call CBA_fnc_uniqueUnitItems);
        if (_gpsCheck) then {
            _player setVariable [QGVAR(hasGPS), 1];
        } else {
            _player setVariable [QGVAR(hasGPS), 2];
        };
    };

    // Check if player has Watch
    if ((_player getVariable QGVAR(hasWatch)) == 0) then {
        private _watchCheck = "ItemWatch" in ([_player] call CBA_fnc_uniqueUnitItems);
        if (_watchCheck) then {
            _player setVariable [QGVAR(hasWatch), 1];
        } else {
            _player setVariable [QGVAR(hasWatch), 2];
        };
    };
}, [_player], GEARCHECK_WAIT_TIME] call CBA_fnc_waitAndExecute;

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
            if (_hasGPS == 1) then {
                _player removeItem "ACE_microDAGR";
            };
            if (_hasWatch == 1) then {
                _player unlinkItem "ItemWatch";
            };
            _args set [4, true];
        };
    };

    if (_inArea == -1) then {
        // Reset Radios
        if (_radioSet) then {
            _args set [3, false];
            [{}] call acre_api_fnc_setCustomSignalFunc;
        };
        // Re-add removed items
        if (_itemChecks) then {
            if (_hasGPS == 1) then {
                _player addItem "ACE_microDAGR";
            };
            if (_hasWatch == 1) then {
                _player linkItem "ItemWatch";
            };
            _args set [4, false];
        };
    };
}, 1, [_player, _markers, _nightTime]] call CBA_fnc_addPerFrameHandler;
