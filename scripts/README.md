# TAC Scripts

Various mission scripts made for Theseus missions.


### Usage

- Copy the desired function/script from the `Scripts` folder to your missions `functions` folder.
- Add the function/script to `CfgFunctions.hpp`.
- Follow the instructions found inside the specific script for how to use it (eg. where to call it from).

#### Example

Example using the teleport script:
- Copy `fn_teleport.sqf` to `my_mission.Map/functions/`
- Add `class teleport;` to `CfgFunctions.hpp`
- Following the instructions in the script, add `[tpObj, tpPos, "Teleport"] call FUNC(teleport);` to `initPlayerLocal.sqf`

---

### Development

- Add a function by adding it to `functions` folder with name `fn_myFunction.sqf` and add class `class myFunction;` in `CfgFunctions.hpp`
- Remove unneeded functions from `functions` folder and their respective classes from `CfgFunctions.hpp` (eg. `class myFunction;`)

#### Debug

Following steps will allow you to recompile the functions in-game without reloading (or even restarting) the mission.

- Add `allowFunctionsRecompile = 1;` to `description.ext`
- Uncomment `recompile = 1;` in `CfgFunctions.hpp`
