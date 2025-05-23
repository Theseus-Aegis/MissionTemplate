#include "..\script_component.hpp"
/*
 * Author: Emythiel, Jonpas
 * Adds briefing.
 * Call from initPlayerLocal.sqf.
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
 * Text Colour (Hex colour Code):
 * <font color='#FF0000'>TEXT HERE</font color>
 *
 * Clickable Marker Link:
 * <marker name = 'MARKER_NAME'>MARKER_TEXT</marker>
 *
 * Image:
 * <img image='FOLDER\IMAGE.jpg' width='200' height='100'/>
 *
 * Side-specific (copy for multiple sides):
 * START_SIDE_BRIEF(west) // west, east, resistance or civilian
 * // briefing entries here
 * END_SIDE_BRIEF
 */

params ["_player"];

//START_SIDE_BRIEF(west) // SIDE-SPECIFIC BRIEFING

_player createDiaryRecord ["Diary", ["Intelligence", "
    <br/>- Enemy Capabilities: eg. Near Peer
    <br/>- Enemy Vehicle Composition: eg. Heavy Armoured Support Capabilities
    <br/>- EOD Required: eg. Not Required
    <br/>- Est. Enemy Force: eg. 2x Platoon Sized Elements (32-50)
    <br/>- Est. Time Frame: eg. 1 Hour
    <br/>- Locked Doors: Yes/No
    <br/>
    <br/>Any additional intelligence goes here
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
    <br/>Local Time: In-game time (+1 hour) eg. 15:00
    <br/>Local Weather: Very brief overview of in-game weather, eg. Clear Skies
    <br/>Employer(s): Employer name here as on website
    <br/>Campaign: Campaign name here as on website, if any, otherwise delete line
    <br/>
    <br/><font color='#E3D310'>Technical Details</font color>
    <br/>Any mission specific parameters go here
"]];

//END_SIDE_BRIEF // SIDE-SPECIFIC BRIEFING
