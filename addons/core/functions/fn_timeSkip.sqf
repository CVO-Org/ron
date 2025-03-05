#include "../script_component.hpp"

/*
* Author: Zorn
* Function to handle the TimeSkipping
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_requester"];


date call BIS_fnc_sunriseSunsetTime params ["_sunrise", "_sunset"];

private _curr = dayTime;

private _timeToSkip = if (_curr > _sunrise ) then { _sunrise + 24 - _curr } else { _sunrise - _curr };


// check for  of RON being interrrupted
private _interrupted = [_requester] call FUNC(interrupt_chance);
private _hint = "";

if (_interrupted) then {
    /* code that happens when they get intterrupted */
    [_requester] call FUNC(interruption);

    _hint = "The watchpost thinks he heard something and woke everyone up...";

    skipTime (_timeToSkip * linearConversion [0,1,random 1, 0.20, 0.70]);

    missionNamespace setVariable [QPVAR(suppress_gotInterrupted), true, true];
    [ { missionNamespace setVariable [QPVAR(suppress_gotInterrupted), false, true]; } , [], 60*5] call CBA_fnc_waitAndExecute;

} else {
    /*code that happens when they dont get interrupted */
    
    _hint = "It is morning and the sun will rise soon...";

    skipTime (_timeToSkip - 0.75);

    missionNamespace setVariable [QPVAR(suppress_didRONRecently), true, true];
    [ { missionNamespace setVariable [QPVAR(suppress_didRONRecently), false, true]; } , [], 60*60] call CBA_fnc_waitAndExecute;

};

[ CBA_fnc_globalEvent , [QPVAR(EH_hint), [_hint]], 25 ] call CBA_fnc_waitAndExecute;

forceWeatherChange;