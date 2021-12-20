#define PREFIX TAC
#define COMPONENT Scripts

// Version
#define MAJOR 3
#define MINOR 5
#define PATCHLVL 0

// Map
#define MAP VR

#define DEBUG_SYNCHRONOUS
//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

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

// Statics
#define ADMINS [ \
    "76561198048995566", /* Jonpas */ \
    "76561198033169512", /* Kresky */ \
    "76561197985332763", /* rg */ \
    "76561198060588521", /* NevilleR */ \
    "76561197975361559", /* grueneteufel */ \
    "76561198085500182", /* Tyrone */ \
    "76561198024182729", /* Laird */ \
    "76561198324654204", /* gilleedoo */ \
    "76561198040879834"  /* JoramD */ \
]
