// Do not Edit this file.

#define PREFIX TAC
#define COMPONENT Scripts

// Version
#define MAJOR 4
#define MINOR 3
#define PATCHLVL 0

// Debug
#define DEBUG_SYNCHRONOUS

#include "script_macros_mission.hpp"

// Userconfig
// __has_include requires -filePatching (which also prevents clients to load their local userconfig as they can't join with file patching)
// __has_include is not supported by HEMTT preprocessing so we do it in the template
#if __has_include("\userconfig\tac\auth.hpp")
    #include "\userconfig\tac\auth.hpp" // Contents available in Tools repository
#endif
#ifndef SERVER_COMMAND_PASSWORD
    #define SERVER_COMMAND_PASSWORD ""
#endif

// Enable Debug Console and similar tools for given admins
// Primarily used in description.ext (debug console) which gets resolved locally on clients where
// userconfig is not available, so must have it hardcoded to take effect
#define DEBUG_ADMINS \
    "76561198048995566", /* Jonpas */ \
    "76561198085500182", /* Mike */ \
    "76561198040879834", /* JoramD */ \
    "76561197993041837"  /* Phil */
