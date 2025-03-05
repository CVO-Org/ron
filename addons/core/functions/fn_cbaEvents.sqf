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



// CBA Context Menu Action

[
    "#All",
    "WATCH",
    LLSTRING(request_ron),
    nil,
    nil,
    {true},
    {
        params ["_unit", "_container", "_item", "_slot", "_params"];
        systemChat str [name _unit, typeOf _container, _item, _slot, _params];
        true
    },
    false,
    [0,1,2]
] call CBA_fnc_addItemContextMenuOption;