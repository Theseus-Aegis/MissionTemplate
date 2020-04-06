/*
 * Author: Alganthe, TyroneMF
 * Specified masks protect from a contamination zone while providing HUD/Sound effects.
 * Requires a marker covering an area named "Contamination" for damage to take effect.
 *
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player] call FUNC(respiratorEffects);
 */
#include "..\script_component.hpp"

params ["_player"];

GVAR(maskCounter) =  CBA_missionTime;
GVAR(lastSoundRan) = CBA_missionTime;
GVAR(oldGlasses) = "";
[{
    private _masks = [
        "avon_ct12", // AVON FM12 Mod Respirators
        "avon_ct12_strapless",
        "avon_fm12",
        "avon_fm12_strapless",
        "avon_SF12",
        "avon_SF12_strapless",
        "G_AirPurifyingRespirator_01_F", // Contact DLC respirators
        "G_AirPurifyingRespirator_02_black_F",
        "G_AirPurifyingRespirator_02_olive_F",
        "G_AirPurifyingRespirator_02_sand_F",
        "G_RegulatorMask_F"
    ];

    private _goggles = goggles ACE_player;

    if (_goggles in _masks) then {
        // Breathing effect, adjust to fit sound length.
        if (GVAR(lastSoundRan) + 3 < CBA_missionTime) then {
            GVAR(lastSoundRan) = CBA_missionTime;
            playSound "tacr_gasmask_breath";
        };
        // Add Mask
        if (GVAR(oldGlasses) != _goggles) then {
            playSound "tacr_gasmask_on";
            "tacr_gasmask_overlay" cutRsc ["tacr_gasmask", "PLAIN", 1, false];
        };
    } else {
        // Mask Removal
        if (GVAR(oldGlasses) in _masks) then {
            playSound "tacr_gasmask_off";
            "tacr_gasmask_overlay" cutFadeOut 0;
        };
        // Damage
        if (ACE_player inArea "Contamination" && {GVAR(maskCounter) + 10 < CBA_missionTime}) then {
            GVAR(maskCounter) = CBA_missionTime;
            // Adjust damage / remove body parts to fit your needs.
            private _bodypart = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
            [ACE_player, 0.15, _bodyPart, "stab"] call ACEFUNC(medical,addDamageToUnit);
        };
    };

    GVAR(oldGlasses) = _goggles;
} , 1, []] call CBA_fnc_addPerFrameHandler;
