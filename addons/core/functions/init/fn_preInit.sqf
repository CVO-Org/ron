#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to establish CBA Events and CBA Context Menu
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

[ QGVAR(EH_ron_run), FUNC(ron_run) ] call CBA_fnc_addEventHandler;

[ QGVAR(EH_watch), FUNC(watch_client) ] call CBA_fnc_addEventHandler;
[ QGVAR(EH_digital), FUNC(digital_client) ] call CBA_fnc_addEventHandler;

[ QGVAR(EH_basic_fade), FUNC(basic_fade) ] call CBA_fnc_addEventHandler;

[ QGVAR(EH_hint), FUNC(hint) ] call CBA_fnc_addEventHandler;

[ QGVAR(EH_remote), { (_this#0) call (_this#1) }] call CBA_fnc_addEventHandler;

[QGVAR(EH_fadeEnvironment), {
    params ["_mode", "_duration"];
    private _value = switch (_mode) do {
        case "FADEOUT": { 0 };
        case "FADEIN":  { 1 };
        default { 1 };
    };
    _value fadeEnvironment _duration;
}] call CBA_fnc_addEventHandler;

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
