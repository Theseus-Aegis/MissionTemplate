/*
 * Author: Kresky, Jonpas
 * Initializes requirements for intel collection script.
 * Called automatically in postInit.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * ["postInit", didJIP] call FUNC(collectIntelPostInit);
 */
#include "..\script_component.hpp"

// Exit if not player client
if (!hasInterface) exitWith {};

// Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;
