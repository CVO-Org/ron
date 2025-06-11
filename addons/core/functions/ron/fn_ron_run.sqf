#include "../../script_component.hpp"

/*
* Author: Zorn
* [Description]
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



private _delay = 0;

Private _accTime_prev = timeMultiplier;


// Open the Watch
_delay = _delay + 2;
[CBA_fnc_globalEvent, [ QPVAR(EH_watch_display), [true] ], _delay] call CBA_fnc_waitAndExecute;

// Accelerate Time
_delay = _delay + 2;
[ FUNC(gradientTimeAcc), [120, 10], _delay ] call CBA_fnc_waitAndExecute;

// Fade Background
_delay = _delay + 20;
[CBA_fnc_globalEvent, [ QPVAR(EH_watch_fade), ["TOBLACK", "BACKGROUND"] ], _delay] call CBA_fnc_waitAndExecute;
// Fade To Black
_delay = _delay + 3;
[ CBA_fnc_globalEvent, [ QPVAR(EH_watch_fade), ["TOBLACK"] ], _delay ] call CBA_fnc_waitAndExecute;


// Skip Time
_delay = _delay + 4;
[ FUNC(timeSkip), [_requester], _delay ] call CBA_fnc_waitAndExecute;


// Fade From Black
_delay = _delay + 0.1;
[ CBA_fnc_globalEvent, [ QPVAR(EH_watch_fade), ["FROMBLACK"] ], _delay ] call CBA_fnc_waitAndExecute;

// Fade Background
_delay = _delay + 3;
[CBA_fnc_globalEvent, [ QPVAR(EH_watch_fade), ["FROMBLACK", "BACKGROUND"] ], _delay] call CBA_fnc_waitAndExecute;

// decelerate Time
_delay = _delay + 1;
[ FUNC(gradientTimeAcc), [_accTime_prev, 15], _delay ] call CBA_fnc_waitAndExecute;

// Remove the Watch
_delay = _delay + 19;
[ CBA_fnc_globalEvent, [ QPVAR(EH_watch_display), [false] ], _delay ] call CBA_fnc_waitAndExecute;
