#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to Check the condition of the ACE Action
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

params ["_player"];
leader _player isEqualTo _player && { [] call FUNC(isNight) }
