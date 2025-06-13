#include "../../script_component.hpp"

/*
* Author: Zorn
* Returns the desired target time.
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

date call BIS_fnc_sunriseSunsetTime params ["_sunrise", "_sunset"];
private _curr = dayTime; 


private _targetTime = switch (SET(timeFrame_Mode)) do {
    case "NIGHT":  { _sunrise };
    case "DAY":    { _sunset  };
    case "CUSTOM": { missionNamespace getVariable [QPVAR(API_custom_targetTime), random 24]; };
    default { nil };
};

if (isNil "_targetTime") exitWith { ERROR_1("TargetTime could not be established - mode unkown: %1",SET(timeFrame_Mode)); random 24 };

_targetTime = 0 max _targetTime min 24;

if (_targetTime < _curr ) then { _targetTime + 24 - _curr } else { _targetTime - _curr } // return
