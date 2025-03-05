#include "../script_component.hpp"

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

[ { disableUserInput true; } , [], 0.01] call CBA_fnc_waitAndExecute;

[ QPVAR(EH_ron_run), [_requester] ] call CBA_fnc_serverEvent;