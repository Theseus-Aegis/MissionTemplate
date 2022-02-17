// Do not Edit this file.

#define MISSION_TYPES ["Contract", "Non-Contract", "Training", "Special", "PvP", "Gimmick"]

// Get weekday for start times
FUNC(weekDay) = { // Replace with CBA_fnc_weekDay when released
    params ["_date"];

    // Keep only year, month, day if longer date format is given
    _date = [_date select 0, _date select 1, _date select 2, 0, 0];

    private _yearBefore = ((_date select 0) - 1) max 0;
    private _leapYears = floor (_yearBefore / 4);
    private _normalYears = _yearBefore - _leapYears;
    private _days = _normalYears + (_leapYears * (366 / 365)) + dateToNumber _date;

    (round (_days / (1 / 365))) mod 7  // return
};

// Mathematical Heresy
systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _weekDay = [systemTimeUTC] call FUNC(weekDay);
private _startTime = [15, 14] select (_weekDay == 5); // 1400z on Saturday, 1500z otherwise
private _timeUntilStart = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
_timeUntilStart = _timeUntilStart max 0;
INFO_1("Time Until Start: %1",_timeUntilStart);

// Verify mission type is correct
private _missionType = getMissionConfigValue ["tac_type", -1];
if (_missionType == -1 || {_missionType >= count MISSION_TYPES}) exitWith {
    ERROR_WITH_TITLE_2("Invalid mission type %1!","Expected 0-%2",_missionType,count _missionTypes - 1);
};

// AAR
[_timeUntilStart] call FUNC(aar);

// Mission Name call on mission start
[{
    [QGVAR(missionName), []] call CBA_fnc_globalEvent;
}, [], _timeUntilStart + 60] call CBA_fnc_waitAndExecute;

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

// Unit Counter Tool - Target Watch: `call TAC_Scripts_fnc_monitorUnits`
FUNC(monitorUnits) = {
    format ["West: %1|East: %2|Indep: %3|Civ: %4|Player: %5", west countSide allUnits, east countSide allUnits, resistance countside allUnits, civilian countSide allUnits, count playableUnits]
};
