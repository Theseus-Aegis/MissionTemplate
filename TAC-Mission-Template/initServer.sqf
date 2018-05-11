{
    if !((_x getVariable ["acex_headless_blacklist", false]) isEqualTo true) then {
        _x setVariable ["acex_headless_blacklist", false];
    }
} forEach allUnits;
