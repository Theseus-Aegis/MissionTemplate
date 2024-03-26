// Do not Edit this file.

// Broadcast staff userconfig to clients
MGVAR(admins) = [ADMINS];
publicVariable QMGVAR(admins);
MGVAR(debug_admins) = [DEBUG_ADMINS];
publicVariable QMGVAR(debug_admins);

// Calculate time until start (0 if debug mode enabled)
systemTimeUTC params ["", "", "", "_hour", "_minute"];
private _startTime = 14; // 1400z always
GVAR(timeUntilStart) = ((_startTime * 60) - (_hour * 60 + _minute)) * 60; // start time - current time = time until start time
GVAR(timeUntilStart) = GVAR(timeUntilStart) max 0;

#ifdef DEBUG_MODE_FULL
GVAR(timeUntilStart) = 0;
#endif

publicVariable QGVAR(timeUntilStart);
INFO_1("Time Until Start: %1",GVAR(timeUntilStart));

// AAR
[GVAR(timeUntilStart)] call MFUNC(aar);

// Mission Name call on mission start
[{
    [QGVAR(missionName), []] call CBA_fnc_globalEvent;
}, [], GVAR(timeUntilStart) + 60] call CBA_fnc_waitAndExecute;
