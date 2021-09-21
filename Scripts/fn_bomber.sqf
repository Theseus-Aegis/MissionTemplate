#include "..\script_component.hpp"
/*
 * Author: Tyrone, Jonpas
 * Sets up a unit as a suicide bomber, they will wait until a player comes within the Activation distance and sprint at them to detonate.
 * Will use either a Satchel charge or a Demolition charge.
 *
 * Call from initServer.sqf
 *
 * Arguments:
 * 0: Suicide Bomber <OBJECT>
 * 1: Radius <NUMBER> (default: 10)
 * 2: Activation Distance <NUMBER> (default: 100)
 * 3: Screaming Distance <NUMBER> (default: 100) (Should match activation distance)
 *
 * Return Value:
 * None
 *
 * Example:
 * [bomber] call FUNC(bomber);
 * [bomber, 15, 50, 50] call FUNC(bomber);
 */

params ["_unit", ["_radius", 10], ["_activateDistance", 100], ["_screamingDistance", 100]];

_unit addVest "UMI_Bomb_Vest_Camo";
_unit setVariable ["acex_headless_blacklist", true];

{
    _unit disableAI _x
} forEach ["COVER", "AUTOCOMBAT", "RADIOPROTOCOL", "FSM", "SUPPRESSION"];

private _time = CBA_missionTime;

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_radius", "_activateDistance", "_screamingDistance", "_time"];

    private _nearest = nearestObjects [_unit, ["CAManBase"], _activateDistance, true];
    _nearest = _nearest select {isPlayer _x};
    _nearest = _nearest select 0;

    if (CBA_missionTime >= _time + 5) then {
        _unit doMove (position _nearest);
        _unit setSpeedMode "FULL";
        _time = CBA_missiontime;
    };

    private _distance = _unit distance _nearest;
    private _unitPos = getPosATL _unit;

    if (_distance <= _screamingDistance || !alive _unit) then {
        // AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        if (alive _unit) then {
            [_unit, "tacr_kamikaze"] remoteExec ["say3D"];
        };

        if (_distance <= _radius) then {
            private _randomExplosive = selectRandom ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted"];
            doStop _unit;

            [{
                params ["_unitPos", "_randomExplosive", "_unit"];
                private _explosive = _randomExplosive createVehicle _unitPos;
                deleteVehicle _unit;
                _explosive setDamage 1;
            }, [_unitPos, _randomExplosive, _unit], 1] call CBA_fnc_waitAndExecute;
        };
    };

    if (!alive _unit) then {
        _handle call CBA_fnc_removePerFrameHandler;
    };

}, 1, [_unit, _radius, _activateDistance, _screamingDistance, _time]] call CBA_fnc_addPerFrameHandler;
