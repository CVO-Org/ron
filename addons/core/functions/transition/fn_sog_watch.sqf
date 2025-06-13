#include "../../script_component.hpp"

/*
* Author: Zorn
* function to black in/out watch screen
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['watch_display', true] call ron_core_fnc_sog_watch;
*
* Public: No
*/


params [ "_mode", "_args"];

switch (_mode) do {
    case "watch_display": {
        _args params [ ["_enable", false, [false] ] ];

        switch (_enable) do {
            case true:  {
                createDialog "RscDisplaySOGWatch";
                private _background = uiNamespace getVariable ["RscDisplaySOGWatch_background", controlNull];
                _background ctrlSetFade 1;
                _background ctrlCommit 0;

            };
            case false: {
                closeDialog 1;
            };
        };
    };
    case "watch_fade": {
        _args params [ "_transition", ["_target", "OVERLAY", [""]], ["_duration", 5, [0]] ];

        private _value = switch (_transition) do {
            case "TOBLACK": { 0 };
            case "FROMBLACK": { 1 };
            default { 1 };
        };

        private _ctrl = switch (_target) do {
            case "OVERLAY": { uiNamespace getVariable ["RscDisplaySOGWatch_overlay", controlNull]; };
            case "BACKGROUND": { uiNamespace getVariable ["RscDisplaySOGWatch_background", controlNull]; };
        };

        _ctrl ctrlSetFade _value;
        _ctrl ctrlCommit _duration;

    };
};

