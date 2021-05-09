#include "..\script_component.hpp"
/*
 * Author: Jonpas, Tyrone
 * Sets visibility of units, simulation and AI behaviour of a group along with any vehicles manned by the group.
 * Call from init.sqf
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Disable <BOOL>
 * 2: Distance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Test_Group_1, true] call FUNC(reinforcements);
 * [Test_Group_1, false] call TAC_Scripts_fnc_reinforcements;
 * [Test_Group_1, false, 50] call TAC_Scripts_fnc_reinforcements;
 */

params ["_group", "_state", ["_distance", 0]];

if (hasInterface && !isServer) exitWith {};

private _groupLeader = leader _group;
private _playerList = [] call CBA_fnc_players;
private _anyClose = _playerList select {_groupLeader distance _x < _distance};

if (_anyClose isEqualTo [] || CBA_MissionTime == 0) then {
    {
        {
            if (local _x) then {
                if (_state) then {
                    _x disableAI "ALL";
                } else {
                    _x enableAI "ALL";
                };
            };
            if (isServer) then {
                _x enableSimulationGlobal !_state;
                _x hideObjectGlobal _state;

                private _vehicle = vehicle _x;
                if (_vehicle != _x && {simulationEnabled _vehicle == _state}) then {
                    _vehicle enableSimulationGlobal !_state;
                    _vehicle hideObjectGlobal _state;
                };
            };
        } forEach (units _x);
    } forEach [_group];
} else {
    if (is3DENMultiplayer) then {
        private _groupName = groupID _group;
        private _groupSide = side _group;
        hint format ["[Reinforcements] Too close to group: %1, on: %2", _groupName, _groupSide];
    };
};
