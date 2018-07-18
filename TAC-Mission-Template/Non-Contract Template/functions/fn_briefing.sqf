/*
 * Author: Kresky, Jonpas
 * Adds briefing based on side.
 * Call from initPlayerLocal.sqf.
 * Copy to other side briefings if you want to add briefings to those sides.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(briefing);
 *
 * New Line:
 * <br/>
 *
 * Text Colour (Hex colour Code)
 * <font color='#FF0000'>TEXT HERE</font color>
 *
 * Clickable Marker Link:
 * <marker name = 'MARKER_NAME'>MARKER_TEXT</marker>
 *
 * Image:
 * <img image='FOLDER\IMAGE.jpg' width='200' height='100'/>
 */
#include "..\script_component.hpp"

params ["_player"];

switch (side _player) do {
    // BLUFOR briefing
    case west: {
        _player createDiaryRecord ["Diary", ["Execution", "
            <br/>Some guidelines on how to execute the mission goes here.
        "]];

        _player createDiaryRecord ["Diary", ["Objectives", "
            <br/>Mission Objectives goes here.
            <br/>
            <br/><font color='#E3D310'>PRIMARY OBJECTIVES:</font color>
            <br/>Your Primary Objective(s)
            <br/>
            <br/><font color='#E3D310'>SECONDARY OBJECTIVES:</font color>
            <br/>Your Secondary Objective(s)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/>Mission Situation goes here.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Details on Friendly Forces.
            <br/>
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Details on Enemy Forces.
        "]];
    };

    // OPFOR briefing
    case east: {

    };

    // RESISTANCE/INDEPENDENT briefing
    case resistance: {

    };

    // CIVILIAN briefing
    case civilian: {

    };
};
