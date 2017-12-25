#include "script_component.hpp"

params ["_player"];

[_player, specScreen] call FUNC(baseSpectator);
[_player] call FUNC(briefing);
