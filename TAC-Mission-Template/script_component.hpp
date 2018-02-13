#define PREFIX TAC
#define COMPONENT Scripts

// Version
#define MAJOR 1
#define MINOR 2
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
