# Mission Template

Theseus Mission Template.

# TAC Scripts

Various staging for proper framework, proof of concept and other scripts for plug into missions.

### Usage

- Add a function by adding it to `functions` folder with name `fn_myFunction.sqf` and add class `class myFunction;` in `CfgFunctions.hpp`
- Remove unneeded functions from `functions` folder and their respective classes from `CfgFunctions.hpp` (eg. `class myFunction;`)

#### Debugging

- Add `allowFunctionsRecompile = 1;` to `description.ext`
- Uncomment `recompile = 1;` in `CfgFunctions.hpp`
