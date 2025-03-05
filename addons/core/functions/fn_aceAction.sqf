#include "../script_component.hpp"

/*
* Author: Zorn
* Function to initialize the RON ACE SELF ACTION on every individual player.
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

private _params = [];
private _state = {
    params ["", "_player", ""];
    if ([getPos _player] call FUNC(condition)) then { [_player] call FUNC(ron_request) };
};

private _cond = {
    params ["", "_player", ""];
    leader _player isEqualTo _player && { [] call FUNC(isNight) }
};

private _aceAction = [
    QPVAR(action)                         // * 0: Action name <STRING>
    ,"Prepare RON Site"                     //  * 1: Name of the action shown in the menu <STRING>
    ,PATH_TO_ADDON(logo.paa)                 //  * 2: Icon <STRING> "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"
    ,_state                                 //  * 3: Statement <CODE>
    ,_cond                                  //  * 4: Condition <CODE>
//    ,{}                                   //  * 5: Insert children code <CODE> (Optional)
//    ,_params                              //  * 6: Action parameters <ANY> (Optional)
//    ,[0,0,0]                              //  * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
//    ,20                                   //  * 8: Distance <NUMBER> (Optional)
//    ,[false,false,false,false,false]      //  * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
//    ,{}                                   //  * 10: Modifier function <CODE> (Optional)
] call ace_interact_menu_fnc_createAction;

[
    player                    		    // * 0: Object the action should be assigned to <OBJECT>
    ,1                         		    // * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
    ,["ACE_SelfActions"]             	// * 2: Parent path of the new action <ARRAY> (Example: ["ACE_SelfActions", "ACE_Equipment"])
    ,_aceAction    	         			// * 3: Action <ARRAY>    
] call ace_interact_menu_fnc_addActionToObject;