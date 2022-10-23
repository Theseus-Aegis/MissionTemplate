// TAC Settings
force tac_apollo_enabled = false;               // Set to 'false' to disable persistence for missions where we aren't using our own gear.

// ACE Settings
force ace_respawn_savePreDeathGear = false;   // Save and respawn with pre-set gear upon death. (NCO ONLY)
force ace_weather_windSimulation = false;     // Wind based on the maps geographical location. Enabling this will override the settings you've set in EDEN.
force ace_mk6mortar_useAmmoHandling = true;   // Set to 'false' to allow usage of Mortar & D30 strike functions.
force ace_spectator_restrictModes = 1;        // Lock spectator into First/Third person only. (Default: 0)

//SOG SPECIFIC SETTINGS
// ACE Medical
force ace_medical_deathChance = 0.05; // 5% (default: 100%)
force ace_medical_spontaneousWakeUpChance = 0.5; // 50% (default: 5%)
force ace_medical_treatment_advancedBandages = 1; // Enabled & Cannot Reopen (default: 1 - Enabled)
force force ace_medical_treatment_medicIV = 0; // Allows non-medics to transfuse fluids (default: 1)

// Ace Fatigue
force ace_advanced_fatigue_recoveryFactor = 1.75; // (default: 1)
