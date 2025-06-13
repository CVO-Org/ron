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
* ['something', player] call ron_core_fnc_functionname
*
* Public: No
*/

params ["_player"];
leader _player isEqualTo _player && { [] call FUNC(checkTimeFrame) }
