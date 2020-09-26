class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class functions {
            file = "functions";
            //recompile = 1; // Debug - Requires allowFunctionsRecompile = 1; in description.ext
            // Reference README.md for usage instructions
            class baseSpectator;
            class briefing;
            class collectIntel;
            class collectIntelPreInit { preInit = 1; };
            class collectIntelPostInit { postInit = 1; };
            class godMode;
        };
    };
};
