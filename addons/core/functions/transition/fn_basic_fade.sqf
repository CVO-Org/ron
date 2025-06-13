#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to handle the basic, vanilla blackscreen.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ["TOBLACK", 10] call ron_core_fnc_basic_fade
*
* Public: No
*/

params [
    [ "_mode",     "", [""] ],
    [ "_duration", 5,  [0]  ]
];

switch (toUpper _mode) do {

    case "TOBLACK":   { [QPVAR(bi_blackscreen), true, _duration] call BIS_fnc_blackOut; };
    case "FROMBLACK": { [QPVAR(bi_blackscreen), true, _duration] call BIS_fnc_blackIn;  };

    default { };
};
