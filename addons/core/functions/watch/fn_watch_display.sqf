#include "../../script_component.hpp"

/*
* Author: Zorn
* Function for CBA EH to enable/disable the sog:pf Watch Overlay.
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

params [ ["_enable", false, [false] ] ];


private _sogLoaded = isClass (configFile >> "CfgPatches" >> "missions_f_vietnam");

if (_sogLoaded && { SET(showWatch) }) then {

    switch (_enable) do {
        case true:  {
            createDialog "RscDisplaySOGWatch";
            private _background = uiNamespace getVariable ["RscDisplaySOGWatch_background", controlNull];
            _background ctrlSetFade 1;
            _background ctrlCommit 0;

            if (SET(disableUserInput)) then { disableUserInput true; };
        };
        case false: {
            closeDialog 1;
            while { userInputDisabled } do { disableUserInput false; };
        };
    };

};

