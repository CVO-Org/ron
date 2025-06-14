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
// 0. Accelerate Time: 0 for dramatic effect
setTimeMultiplier 1;
// 1. Accelerate Time: Start@2: Duration:10
[ FUNC(gradientTimeAcc), [120, 10], 6 ] call CBA_fnc_waitAndExecute;
// 2. TimeSkip itself
[ FUNC(timeSkip), [_requester], 30 ] call CBA_fnc_waitAndExecute;
// 3. Decellerate to 1 for Dramatic effect
[ FUNC(gradientTimeAcc), [1, 10], 40 ] call CBA_fnc_waitAndExecute;
// 4. Reset time to previous time Acceleration
[ { setTimeMultiplier _this }, _previousTimeAcc, 61] call CBA_fnc_waitAndExecute;

// Fade Audio
[CBA_fnc_globalEvent, [ QGVAR(EH_fadeEnvironment),["FADEOUT", 7]], 22] call CBA_fnc_waitAndExecute;
[CBA_fnc_globalEvent, [ QGVAR(EH_fadeEnvironment),[ "FADEIN", 7]], 31] call CBA_fnc_waitAndExecute;


// ## Transitions
private _mode = missionNamespace getVariable [QSET(displayMode), "DIGITAL"];
// Temp: Default to "DIGITAL" when SOG not loaded.
if (_mode == "WATCH" && { !isClass (configFile >> "CfgPatches" >> "missions_f_vietnam") }) then { _mode = "DIGITAL" };

switch (_mode) do {
    case "DIGITAL": {
        [CBA_fnc_globalEvent, [ QGVAR(EH_digital), [ "Ron_RscDigitalClock_layer", true, 2 ] ], 0.1] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_basic_fade), [   "TOBLACK", 14 ] ], 15] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_basic_fade), [ "FROMBLACK", 14 ] ], 31] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_digital), [ "Ron_RscDigitalClock_layer", false, 2 ] ], 58] call CBA_fnc_waitAndExecute;
    };
    case "WATCH": {
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_display", [true]                          ] ],  2] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    [  "TOBLACK", "BACKGROUND", 10] ] ],  5] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    [  "TOBLACK",    "OVERLAY", 14] ] ], 15] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    ["FROMBLACK",    "OVERLAY", 14] ] ], 31] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_fade",    ["FROMBLACK", "BACKGROUND", 10] ] ], 45] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_watch), [ "watch_display", [true]                          ] ], 60] call CBA_fnc_waitAndExecute;
    };
    case "NONE": {
        [CBA_fnc_globalEvent, [ QGVAR(EH_basic_fade), [ "TOBLACK",   14 ] ], 15] call CBA_fnc_waitAndExecute;
        [CBA_fnc_globalEvent, [ QGVAR(EH_basic_fade), [ "FROMBLACK", 14 ] ], 31] call CBA_fnc_waitAndExecute;
    };
};
