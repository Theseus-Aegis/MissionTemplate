// Do not Edit this file.

// Mathematical Heresy
systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _timeUntilStart = ((14 * 60) - (_hour * 60 + _minute)) * 60; // start time (1400z) - current time = time until start time

private _setMissionName = {
    [{
        [QGVAR(missionName), _this] call CBA_fnc_globalEvent;
    }, _this, _timeUntilStart] call CBA_fnc_waitAndExecute;
};

// Log given traits to RPT 70 minutes after mission start if apollo is enabled.
if (TACGVAR(apollo,enabled)) then {
    [{
        private _playerTraits = [];
        {
            _playerTraits pushBack [_x, _y];
        } forEach TACGVAR(supplies,playerTraits);
        INFO_1("Player Traits: %1",_playerTraits); // For now just logging to RPT, future uses TBD.
    }, [], _timeUntilStart + 10*60] call CBA_fnc_waitAndExecute;
};

// Unit Counter Tool - Target Watch: TAC_Scripts_unitCounter
[{
    GVAR(unitCounter) = format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5", west countSide allUnits, east countSide allUnits, resistance countside allUnits, civilian countSide allUnits, count playableUnits];
}, 10, []] call CBA_fnc_addPerFrameHandler;
