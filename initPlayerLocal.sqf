#include "script_component.hpp"

setCurrentChannel 1;

// Events - Always keep!
if (hasInterface) then {
    [QGVAR(createDiaryRecordGlobal), {
        params ["_player", "_diaryArray"];
        _player createDiaryRecord _diaryArray;
    }] call CBA_fnc_addEventHandler;
};

// Game logic
params ["_player"];

[_player, specScreen] call FUNC(baseSpectator); // Replace 'objNull' with spectator access object
[_player] call FUNC(briefing);
