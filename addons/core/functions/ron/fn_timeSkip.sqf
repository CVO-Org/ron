#include "../../script_component.hpp"

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


private _timeToSkip = call FUNC(getTimeToSkip);

// check for Interruption?
private _interrupted = [_requester] call FUNC(interrupt_chance);
private _hint = "";

if (_interrupted) then {
    /* code that happens when they get intterrupted */
    [_requester] call FUNC(interruption);

    _hint = "The watchpost heard something and alearts everybody...";

    skipTime (_timeToSkip * linearConversion [0,1,random 1, 0.20, 0.70]);

    missionNamespace setVariable [QPVAR(suppress_gotInterrupted), true, true];
    [ { missionNamespace setVariable [QPVAR(suppress_gotInterrupted), false, true]; } , [], 60*5] call CBA_fnc_waitAndExecute;

} else {
    /* code that happens when they dont get interrupted */
    
    _hint = "Its time to get ready...";

    skipTime (_timeToSkip - 0.75);

    missionNamespace setVariable [QPVAR(suppress_didRONRecently), true, true];
    [ { missionNamespace setVariable [QPVAR(suppress_didRONRecently), false, true]; } , [], 60*60] call CBA_fnc_waitAndExecute;

};

[ CBA_fnc_globalEvent , [QPVAR(EH_hint), [_hint]], 25 ] call CBA_fnc_waitAndExecute;

// If overcast is above a certain value, it will reduce the current overcast over the next 15 minutes
// and only then it will take readjust the overcast to the previous value
if (overcast > 0.5 || {overcastForecast > 0.5}) then {
    [QPVAR(EH_remote), [[], { 15*60 setOvercast 0.25 }] ] call CBA_fnc_serverEvent;
    [ CBA_fnc_serverEvent , [QPVAR(EH_remote), [[], { nextWeatherChange setOvercast random 0.5 }] ], 15*60] call CBA_fnc_waitAndExecute;
};

nil
