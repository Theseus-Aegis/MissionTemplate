#include "..\script_component.hpp"
/*
 * Author: Tyrone, Jonpas
 * Sets up Auto-AAR (type and time based) and Manual-AAR (event for chat command) functionalities.
 * Call from initServer.sqf.
 *
 * Arguments:
 * 0: Time until start (in seconds) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [3600] call FUNC(aar);
 */

params [["_timeUntilStart", 0]];

// Functions
FUNC(canStartAAR) = {
    isNil "ocap_capture" || {!ocap_capture}
};
FUNC(canStopAAR) = {
    !isNil "ocap_capture" && {ocap_capture}
};
FUNC(startAAR) = {
    [] call ocap_fnc_init;
    [ACEQGVAR(common,systemChatGlobal), "AAR Started"] call CBA_fnc_globalEvent;
};
FUNC(stopAAR) = {
    private _missionType = getMissionConfigValue ["tac_type", -1];
    [sideAmbientLife, "", MISSION_TYPES select _missionType] call ocap_fnc_exportData; // side must be given
    INFO_2("AAR stopped with type %1 '%'",_missionType,_missionTypeString);
    [ACEQGVAR(common,systemChatGlobal), "AAR Stopped"] call CBA_fnc_globalEvent;
};

// Auto-AAR (only non-Gimmick)
if (_missionType in AUTOAAR_TYPES) then {
    INFO_1("Auto-AAR waiting for start [type: %1]",_missionType);
    [{
        [{
            params ["_args"];
            _args params ["_autoStarted"];

            private _playerCount = count (call CBA_fnc_players);

            if (call FUNC(canStartAAR) && {_playerCount >= AUTOAAR_PLAYER_COUNT}) exitWith {
                call FUNC(startAAR);
                _args set [0, true];
                INFO_1("Auto-AAR started [players: %1]",_playerCount);
            };

            // Only end AAR if it was started with Auto-AAR (don't stop a Manual-AAR automatically)
            if (_autoStarted && {call FUNC(canStopAAR)} && {_playerCount < AUTOAAR_PLAYER_COUNT}) exitWith {
                call FUNC(stopAAR);
                _args set [0, false];
                INFO_1("Auto-AAR stopped [players: %1]",_playerCount);
            };
        }, 60, [_autoStarted]] call CBA_fnc_addPerFrameHandler;
    }, [], _timeUntilStart] call CBA_fnc_waitAndExecute;
};

// Manual-AAR
[QGVAR(manualAAR), {
    if (call FUNC(canStartAAR)) exitWith {
        call FUNC(startAAR);
        INFO("Manual-AAR started");
    };
    if (call FUNC(canStopAAR)) exitWith {
        call FUNC(stopAAR);
        INFO("Manual-AAR stopped");
    };
}] call CBA_fnc_addEventHandler;

// Handle mission ending
addMissionEventHandler ["MPEnded", {
    if (call FUNC(canStopAAR)) then {
        call FUNC(stopAAR);
    };
}];
