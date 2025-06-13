#include "../../script_component.hpp"

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

[ QPVAR(EH_remote), { (_this#0) call (_this#1) }] call CBA_fnc_addEventHandler;



// CBA Context Menu Action

[
    "#All",
    "WATCH",
    LLSTRING(ron_request),
    nil,
    PATH_TO_ADDON(logo.paa),
    [
        {
            params ["_unit", "_container", "_item", "_slot", "_params"];
            leader _unit isEqualTo _unit && { [] call FUNC(checkTimeFrame) }
        },
        {
            params ["_unit", "_container", "_item", "_slot", "_params"];
            leader _unit isEqualTo _unit && { [] call FUNC(checkTimeFrame) }
        }
    ],
    {
        params ["_unit", "_container", "_item", "_slot", "_params"];
        if ([getPos _unit] call FUNC(canRON)) then {
            [_unit] call FUNC(ron_request);
            (findDisplay 602) closeDisplay 2;
        };

    },
    false,
    []
] call CBA_fnc_addItemContextMenuOption;
