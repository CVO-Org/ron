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

/*
_parameters - <ANY> OPTIONAL parameters, will be passed to  code to run, exit code and condition
_condition  - <CODE THAT RETURNS BOOLEAN> - OPTIONAL conditions during which PFEH will run default {true}
_codeToRun  - <CODE> code to Run stated between {}
_exitCode   - <CODE> OPTIONAL exit code between {} code that will be executed upon ending PFEH default is {}
_delay      - <NUMBER> (optional) delay between each execution in seconds, PFEH executes at most once per frame
*/

params [
    ["_display", displayNull, [displayNull] ]
];

if (isNull _display) then { _display = uiNamespace getVariable [QPVAR(RscDigitalClock), displayNull] };

private _condition = { !isNull _this };
private _codeToRun = {  
    _this displayCtrl 1 ctrlSetText ([dayTime] call BIS_fnc_timeToString);  };
private _exitCode = { /* exit code */ };
private _delay = 0;

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        _parameters call _exitCode;
    };
}, _delay, [_codeToRun, _display, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;
