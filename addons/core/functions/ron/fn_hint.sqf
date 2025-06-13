#include "../../script_component.hpp"

/*
* Author: Zorn
* global hint function for cba Events
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

if !(hasInterface) exitWith {};

params ["_text"];

systemChat _text;
