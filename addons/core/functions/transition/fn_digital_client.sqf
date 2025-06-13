#include "../../script_component.hpp"

/*
* Author: Zorn
* Function for remote control of the Digital Watch overlay
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

params [
    [ "_layerName", "",     [""]    ],
    [ "_mode",      true,   [true]  ],
    [ "_duration",  5,      [5]     ]
];

switch (_mode) do {
    case false: { _layerName cutFadeOut _duration; };
    case true:  { _layerName cutRsc ["ron_RscDigitalClock", "PLAIN", _duration]; };
};
 