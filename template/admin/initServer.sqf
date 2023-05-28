// Do not Edit this file.

// Broadcast staff userconfig to clients
MGVAR(admins) = [ADMINS];
publicVariable QMGVAR(admins);
MGVAR(debug_admins) = [DEBUG_ADMINS];
publicVariable QMGVAR(debug_admins);

// Mathematical Heresy
systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 14; // 1400z always
private _timeUntilStart = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
_timeUntilStart = _timeUntilStart max 0;
INFO_1("Time Until Start: %1",_timeUntilStart);

// AAR
[_timeUntilStart] call MFUNC(aar);

// APC Skill
[] call MFUNC(apcSkill);

// Mission Name call on mission start
[{
    [QGVAR(missionName), []] call CBA_fnc_globalEvent;
}, [], _timeUntilStart + 60] call CBA_fnc_waitAndExecute;
