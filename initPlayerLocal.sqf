#include "script_component.hpp"

setCurrentChannel 1;  // Sets default start channel to "Side"

params ["_player"];

[_player, specScreen] call FUNC(baseSpectator);
[_player] call FUNC(briefing);
