#include "script_component.hpp"

force ace_weather_windSimulation = false; // Wind based on the maps geographical location. Enabling this will override the settings you've set in EDEN
force ace_mk6mortar_useAmmoHandling = true; // Set to 'false' to allow usage of the mortarStrike function
force ace_spectator_restrictModes = 1; // Lock spectator into First/Third person only (default: 0)

// Contract
#if MISSION_SETTINGS == 0
force tac_apollo_enabled = true;
#endif

// Non-Contract
#if MISSION_SETTINGS == 1
force ace_respawn_savePreDeathGear = true; // Save and respawn with pre-set gear upon death
#endif

// SOG
#if MISSION_SETTINGS == 2
force ace_advanced_fatigue_recoveryFactor = 1.75; // (default: 1)
force ace_medical_deathChance = 0.05; // 5% (default: 100%)
force ace_medical_spontaneousWakeUpChance = 0.5; // 50% (default: 5%)
force ace_medical_treatment_advancedBandages = 1; // Enabled & Cannot Reopen (default: 1 - Enabled)
force ace_medical_treatment_medicIV = 0; // Allows non-medics to transfuse fluids (default: 1)
force ace_respawn_savePreDeathGear = true; // Save and respawn with pre-set gear upon death
#endif
