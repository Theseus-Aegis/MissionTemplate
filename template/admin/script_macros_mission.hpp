// Do not Edit this file.

// CBA modifies RECOMPILE, but we want simple #ifdef for allowFunctionsRecompile in description.ext
#ifdef RECOMPILE
    #define ALLOW_RECOMPILE
#endif

#include "\x\cba\addons\main\script_macros_mission.hpp"
#include "\x\tac\addons\mission\script_macros_mission.hpp"

// User code wrappers
#define START_USER_CODE     [{
#define END_USER_CODE       }] call CBA_fnc_directCall;
#define END_USER_CODE_ARGS  }, _this] call CBA_fnc_directCall;
#define START_SIDE_BRIEF(briefSide) if (side _player == briefSide) then {
#define END_SIDE_BRIEF              };

// Functions (shortened PATHTO_FNC with functions in subfolder)
#define DFUNC(func) class func {\
    file = QUOTE(functions\DOUBLES(fnc,func).sqf);\
    RECOMPILE;\
}

// ACE3
#define ACE_PREFIX ace

#define ACEGVAR(module,var) TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var) QUOTE(ACEGVAR(module,var))

#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ACE_PREFIX,var1),fnc,var2)
#define QACEFUNC(var1,var2) QUOTE(ACEFUNC(var1,var2))

#define PATHTOACEF(var1,var2) PATHTOF_SYS(\z\ace\addons,var1,var2)
#define QPATHTOACEF(var1,var2) QUOTE(PATHTOACEF(var1,var2))

// TAC Mods
#define TAC_PREFIX tac

#define TACGVAR(module,var) TRIPLES(TAC_PREFIX,module,var)
#define QTACGVAR(module,var) QUOTE(TACGVAR(module,var))

#define TACFUNC(var1,var2) TRIPLES(DOUBLES(TAC_PREFIX,var1),fnc,var2)
#define QTACFUNC(var1,var2) QUOTE(TACFUNC(var1,var2))

#define PATHTOTACF(var1,var2) PATHTOF_SYS(\x\tac\addons,var1,var2)
#define QPATHTOTACF(var1,var2) QUOTE(PATHTOTACF(var1,var2))

// TAC Mods Mission component
#define MGVAR(var) TRIPLES(TAC_PREFIX,mission,var)
#define QMGVAR(var) QUOTE(MGVAR(var))

#define MFUNC(var) TRIPLES(DOUBLES(TAC_PREFIX,mission),fnc,var)
#define QMFUNC(var) QUOTE(MFUNC(var))

// Useful macros from ACE3
// https://github.com/acemod/ACE3/blob/c241f2e2a20e4a3c4ca22dd0d81a7b5fa4457c8e/addons/main/script_macros.hpp

// weapon types
#define TYPE_WEAPON_PRIMARY 1
#define TYPE_WEAPON_HANDGUN 2
#define TYPE_WEAPON_SECONDARY 4
// magazine types
#define TYPE_MAGAZINE_HANDGUN_AND_GL 16 // mainly
#define TYPE_MAGAZINE_PRIMARY_AND_THROW 256
#define TYPE_MAGAZINE_SECONDARY_AND_PUT 512 // mainly
#define TYPE_MAGAZINE_MISSILE 768
// more types
#define TYPE_BINOCULAR_AND_NVG 4096
#define TYPE_WEAPON_VEHICLE 65536
#define TYPE_ITEM 131072
// item types
#define TYPE_DEFAULT 0
#define TYPE_MUZZLE 101
#define TYPE_OPTICS 201
#define TYPE_FLASHLIGHT 301
#define TYPE_BIPOD 302
#define TYPE_FIRST_AID_KIT 401
#define TYPE_FINS 501 // not implemented
#define TYPE_BREATHING_BOMB 601 // not implemented
#define TYPE_NVG 602
#define TYPE_GOGGLE 603
#define TYPE_SCUBA 604 // not implemented
#define TYPE_HEADGEAR 605
#define TYPE_FACTOR 607
#define TYPE_RADIO 611
#define TYPE_HMD 616
#define TYPE_BINOCULAR 617
#define TYPE_MEDIKIT 619
#define TYPE_TOOLKIT 620
#define TYPE_UAV_TERMINAL 621
#define TYPE_VEST 701
#define TYPE_UNIFORM 801
#define TYPE_BACKPACK 901

#define GRAVITY 9.8066

#define SD_TO_MIN_MAX(d) ((d) * 3.371) // Standard deviation -> min / max of random [min, mid, max]

// Angular unit conversion
#define MRAD_TO_MOA(d) ((d) * 3.43774677) // Conversion factor: 54 / (5 * PI)
#define MOA_TO_MRAD(d) ((d) * 0.29088821) // Conversion factor: (5 * PI) / 54
#define DEG_TO_MOA(d) ((d) * 60) // Conversion factor: 60
#define MOA_TO_DEG(d) ((d) / 60) // Conversion factor: 1 / 60
#define DEG_TO_MRAD(d) ((d) * 17.45329252) // Conversion factor: (50 * PI) / 9
#define MRAD_TO_DEG(d) ((d) / 17.45329252) // Conversion factor: 9 / (50 * PI)
#define MOA_TO_RAD(d) ((d) * 0.00029088) // Conversion factor: PI / 10800

#define SUBSKILLS ["aimingAccuracy", "aimingShake", "aimingSpeed", "spotDistance", "spotTime", "courage", "reloadSpeed", "commanding", "general"]
