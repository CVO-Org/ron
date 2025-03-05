#include "../script_component.hpp"

/*
* Author: Zorn
* Function to initialize the suppression handler for players
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

if !(isServer) exitWith {};

// Define GVAR on Mission Start
missionNamespace setVariable [QPVAR(suppress_lastSuppressed), -1 * SET(suppress_lastSuppressed_delta)];


// Adds the Eventhandler to every playerObject
addMissionEventHandler [
    "OnUserSelectedPlayer",
    {
        params ["_networkId", "_playerObject", "_attempts"];

        if !(_playerObject getVariable [QPVAR(suppressHandler), false]) then {

            _playerObject addEventHandler [
                "Suppressed",
                {
                    // params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];
                    missionNamespace setVariable [QPVAR(suppress_lastSuppressed), CBA_missionTime];
                }
            ];
            _playerObject setVariable [QPVAR(suppressHandler), true];
        };
    }
];


// Broadcast updated QPVAR(suppress_inContact) state only when the state changes
[{
    private _delta = missionNamespace getVariable [QSET(suppress_lastSuppressed_delta), 300];
    private _newState = (PVAR(suppress_lastSuppressed) + _delta) > CBA_missionTime;
    private _previousState = missionNamespace getVariable [QPVAR(suppress_inContact), false];
    if (_previousState isNotEqualTo _newState) then { missionNamespace setVariable [QPVAR(suppress_inContact), _newState, true] };

}, 5, []] call CBA_fnc_addPerFrameHandler;

