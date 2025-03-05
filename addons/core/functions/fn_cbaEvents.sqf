#include "../script_component.hpp"

/*
* Author: Zorn
* Function to establish CBA Events
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

[ QPVAR(EH_watch_display), FUNC(watch_display) ] call CBA_fnc_addEventHandler;
[ QPVAR(EH_watch_fade), FUNC(watch_fade) ] call CBA_fnc_addEventHandler;

[ QPVAR(EH_ron_run), FUNC(ron_run) ] call CBA_fnc_addEventHandler;

[ QPVAR(EH_hint), FUNC(hint) ] call CBA_fnc_addEventHandler;

