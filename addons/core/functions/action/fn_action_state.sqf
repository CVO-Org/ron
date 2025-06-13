#include "../../script_component.hpp"

/*
* Author: Zorn
* Statement Function of the ACE Action
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

params ["_player"];
if ([getPos _player] call FUNC(canRON)) then { [_player] call FUNC(ron_request) };
