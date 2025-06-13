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
* ['something', player] call ron_core_fnc_functionname
*
* Public: No
*/

// 0. 0: Function Call
// 1. @2:       Show Watch
// 1. 2-15:     Accelerate Time
// 1. 15-29:    Transition to Black
// 2. @30:      TimeSkip action
// 3. 31-45:    Transition from Black
// 3. 45-58:     Deccelerate Time
// 3. @60:      Hide Watch

params ["_requester"];


private _previousTimeAcc = timeMultiplier;

// ## Time Acceleration and Time Skip
// 1. Accelerate Time: Start@2: Duration:10
[ FUNC(gradientTimeAcc), [120, 14], 2 ] call CBA_fnc_waitAndExecute;
// 2. TimeSkip itself
[ FUNC(timeSkip), [_requester], 30 ] call CBA_fnc_waitAndExecute;
// 3. Decellerate 
[ FUNC(gradientTimeAcc), [_previousTimeAcc, 13], 45 ] call CBA_fnc_waitAndExecute;


// Fade Audio
[CBA_fnc_globalEvent, [ QGVAR(EH_fadeEnvironment),["FADEOUT", 7]], 22] call CBA_fnc_waitAndExecute;
[CBA_fnc_globalEvent, [ QGVAR(EH_fadeEnvironment),["FADEIN", 7]], 31] call CBA_fnc_waitAndExecute;


// ## Transitions
private _showWatch = missionNamespace getVariable [QSET(showWatch), false];

// until better default solution:
_showWatch = _showWatch && { isClass (configFile >> "CfgPatches" >> "missions_f_vietnam") };

private _mode = switch (true) do {
    case (_showWatch ): { "WATCH" };
    default { "NONE" };
};

switch (_mode) do {
    case "WATCH": {
        // Open the Watch
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_display", [true]                          ] ],  2] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    ["TOBLACK",   "BACKGROUND", 10] ] ],  5] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    ["TOBLACK",   "OVERLAY",    14] ] ], 15] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    ["FROMBLACK", "OVERLAY",    14] ] ], 31] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    ["FROMBLACK", "BACKGROUND", 10] ] ], 45] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_display", [true]                          ] ], 60] call CBA_fnc_waitAndExecute;
    };
    case "NONE": {
        [CBA_fnc_globalEvent, [ QGVAR(EH_basic_fade), [ "TOBLACK",   14 ] ], 15] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_basic_fade), [ "FROMBLACK", 14 ] ], 31] call CBA_fnc_waitAndExecute;
    };
};
