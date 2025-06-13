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
* ['something', player] call ron_core_fnc_functionname
*
* Public: No
*/

params ["_requester"];

[ QGVAR(EH_ron_run), [_requester] ] call CBA_fnc_serverEvent;