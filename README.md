# Mission Template

TAC Arma 3 Mission Template

# TAC Scripts

Various staging for proper framework, proof of concept and other scripts for plug into missions.

### Usage

- Copy `CfgFunctions.hpp` and `functions` folder to your mission root (next to `description.ext`)
- Add `#include "CfgFunctions.hpp"` to `description.ext`
- Remove unneeded functions from `functions` folder and their respective classes from `CfgFunctions.hpp` (eg. `class someFunction;`)

#### Debugging

- Add `allowFunctionsRecompile = 1;` to `description.ext`
- Uncomment `recompile = 1;` in `CfgFunctions.hpp`
