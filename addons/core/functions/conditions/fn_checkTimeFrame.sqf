#include "../../script_component.hpp"

/*
* Author: Zorn
* First Condition - Checks this condition to see if the Action will be available at all.
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

// API
// If the global variable "ron_API_block" is defined, the RON action will not be available. The value of the global variable does not matter.
// example: missionNamespace setVariable["ron_API_block", true, true]; // To block
// example: missionNamespace setVariable["ron_API_block", nil, true]; // To un-block

isNil QPVAR(API_block)

&&

{
    date call BIS_fnc_sunriseSunsetTime params ["_sunrise", "_sunset"];
    private _curr = dayTime; 

    switch (SET(timeFrame_Mode)) do {
        case "NIGHT":  { _sunset  < _curr  || { _curr < (_sunrise - 1) } };
        case "DAY":    { _sunrise < _curr  && { _curr < (_sunset  - 1) } };
        case "CUSTOM": { true };
        default { false };
    }
}
