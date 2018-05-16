# TAC Scripts

Various of mission scripts made for Theseus missions.

### Usage

- Copy the desired function/script from the `Scripts` folder to your missions `functions` folder.
- Add the function/script to `CfgFunctions.hpp`.
- Follow the instructions found inside the specific script for how to use it (eg. where to call it from).

### Example on how to use

Example using the teleport script:
- Copy `fn_teleport.sqf` to `my_mission.Altis/functions/`
- Add `class teleport;` to `CfgFunctions.hpp`
- Following the instructions in the script, add `[tpObj, tpPos, "Teleport"] call FUNC(teleport);` to `initPlayerLocal.sqf`
