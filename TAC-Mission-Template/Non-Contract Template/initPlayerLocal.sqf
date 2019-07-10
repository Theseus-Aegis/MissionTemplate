#include "script_component.hpp"

params ["_player"];

[_player] call FUNC(briefing);

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;
