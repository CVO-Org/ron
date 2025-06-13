#include "../../script_component.hpp"

/*
* Author: Zorn
* Main Watch Function on the client.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call ron_core_fnc_watch_client;
*
* Public: No
*/

if !(hasInterface) exitWith {};

params [ "_mode", "_args"];

private _sogLoaded = isClass (configFile >> "CfgPatches" >> "missions_f_vietnam");

private _code = switch (true) do {
    case (_sogLoaded): { FUNC(sog_watch) };
    default { {} };
};

[_mode, _args] call _code;

