#include "..\script_component.hpp"
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

params ["_player"];

switch (side _player) do {
    // BLUFOR briefing
    case west: {
        _player createDiaryRecord ["Diary", ["Intelligence", "
            <br/>You can flesh out the intel we have on enemy compositions and equipment here
            <br/>As well as other things that fits the intel section
        "]];

        _player createDiaryRecord ["Diary", ["Equipment", "
            <br/><font color='#0ECE68'>GROUND:</font color>
            <br/>- N/A
            <br/>
            <br/><font color='#0ECE68'>AIR:</font color>
            <br/>- N/A
            <br/>
            <br/><font color='#0ECE68'>SPECIAL:</font color>
            <br/>- N/A
        "]];

        _player createDiaryRecord ["Diary", ["Objectives", "
            <br/>The overall description of the objective for Theseus to complete
            <br/>
            <br/><font color='#E3D310'>PRIMARY OBJECTIVES:</font color>
            <br/>- A quick summary of the primary objectives to be completed for mission success
            <br/>
            <br/><font color='#E3D310'>SECONDARY OBJECTIVES:</font color>
            <br/>- A quick summary of the secondary objectives that can be completed
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/>The overall situation of the mission scenario goes here
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>- Theseus Inc.
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font color>
            <br/>- Remove this section if there's no independent forces
            <br/>
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>- Enemy combatants
        "]];

        _player createDiaryRecord ["Diary", ["General", "
            <br/>Location: Map name here as on website
            <br/>Local Time: 15:00
            <br/>Local Weather: Clear Skies
            <br/>Employer(s): Employer name here as on website
            <br/>Campaign: Campaign name here as on website, if any, otherwise delete line
            <br/>
            <br/><font color='#E3D310'>Technical Details</font color>
            <br/>Any mission specific parameters go here
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
