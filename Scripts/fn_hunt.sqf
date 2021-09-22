#include "..\script_component.hpp"
/*
 * Author: Tyrone
 * Has an enemy group hunt a player group.
 * If units have waypoints they will return to them after a successful hunt.
 * If no hunted group is given it will select nearest player group within 1km and target those.
 *
 * Call from Trigger with (isServer) check.
 *
 * Arguments
 * 0: Hunter Group <GROUP>
 * 1: Waypoint Refresh <NUMBER> (Optional - Default: 5)
 * 2: Hunted Group <GROUP> (Optional - Default grpNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [Enemy_Group] call TAC_Scripts_fnc_hunt;
 * [Enemy_Group, 10] call TAC_Scripts_fnc_hunt;
 * [Enemy_Group, nil, Player_Group] call TAC_Scripts_fnc_hunt;
 */

params ["_hunters", ["_refresh", 5], ["_hunted", grpNull]];

// Headless Blacklist
_hunters setVariable ["acex_headless_blacklist", true];

// Disable Fleeing
{
    _x allowFleeing 0;
} forEach (units _hunters);

// PFH for movement
[{
    params ["_args", "_handle"];
    _args params ["_hunters", "_refresh", "_hunted"];

    // Select closest player group
    if (isNull _hunted) then {
        private _hunterLeader = leader _hunters;
        private _nearest = nearestObjects [_hunterLeader, ["CAManBase"], 1000, true];
        _nearest = _nearest select {isPlayer _x};
        _nearest = _nearest param [0, objNull];
        _hunted = group _nearest;
        _args set [2, _hunted];
    };
    if (!isNull _hunted) then {
        // Get Group Leaders
        private _huntedLeader = leader _hunted;

        // Move to estimated hunted leader position
        private _huntedPos = _huntedLeader getPos [random 100, random 360];
        _hunters move _huntedPos;
    };

    // Check for alive units
    private _huntersDead = {alive _x} count units _hunters == 0;
    private _huntedDead = {alive _x} count units _hunted == 0;

    // Remove PFH.
    if (_huntersDead || _huntedDead && !isNull _hunted) then {
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, _refresh, [_hunters, _refresh, _hunted]] call CBA_fnc_addPerFrameHandler;
