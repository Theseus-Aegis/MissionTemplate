#include "script_component.hpp"

setCurrentChannel 1;

params ["_player"];

[_player, specScreen] call FUNC(baseSpectator); // Replace 'objNull' with spectator access object
[_player] call FUNC(briefing);
