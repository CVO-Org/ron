#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to maintain support for legacy missions API.
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

// runs on every machine - the blacklist is read on the client (fn_canRON), the overwrite on the server (fn_interrupt_chance)

private _oldMap = missionNamespace getVariable ["vn_ron_blacklist_playerDistance", nil];
private _newMap = missionNamespace getVariable ["ron_api_blacklist_playerDistance", nil];

switch (true) do {
    case (!isNil "_oldMap" && { (!isNil "_newMap") }): { _newMap merge [_oldMap, false] };
    case (!isNil "_oldMap" && { ( isNil "_newMap") }): { missionNamespace setVariable ["ron_api_blacklist_playerDistance", _oldMap]; };
};


private _oldOverwrite = missionNamespace getVariable ["vn_ron_interruption_overwrite", nil];
private _newOverwrite = missionNamespace getVariable ["ron_api_interruption_overwrite", nil];

// when both are defined, the new overwrite takes precedence
if (!isNil "_oldOverwrite" && { isNil "_newOverwrite" }) then { missionNamespace setVariable ["ron_api_interruption_overwrite", _oldOverwrite]; };
