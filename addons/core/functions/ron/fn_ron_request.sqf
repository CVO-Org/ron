#include "../../script_component.hpp"

/*
* Author: Zorn
* Starts the Main Function
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

[ QPVAR(EH_ron_run), [_requester] ] call CBA_fnc_serverEvent;