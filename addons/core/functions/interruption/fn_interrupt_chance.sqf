#include "../../script_component.hpp"

/*
* Author: Skippie, Zorn
* Function to define, if the ron gets interrupted
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

/*
* Skippie: So, my idea is basically this - get the closest enemy group distance (_distance_ClostestGroup), 
* their interruption chance (_chance_closestGroup) will be something like 0.6 * (ron_interruption_enemy_inner_radius /_distance_ClostestGroup)
* other groups chance will be based on their distance (_distance_x) (each additional group chance will be less and less valuable)
* their chance of interruption (_chance_x, where x is the groups' index in the sorted array of distances) 
* something like (0.2 / x) * (ron_interruption_enemy_inner_radius / _distance_x)
* We could also factor in the groups' size, the more units in the group the more chances they have to interrupt you
* something like 2 units and less in a group get no bonus, 8 and more get the maximum bonus of 10
* so the formula for the chance of interruption of closest enemy group would look something like this
* _chance_closestGroup = (0.6 * (ron_interruption_enemy_inner_radius /_distance_ClostestGroup)) + linearConversion [2, 8, _numberOfUnits, 0, 0.1, true];
* and the formula for other groups (calculated for each group, could be handled in the 'for' loop) would 

* the final chance of interruption (_chance_final) would be a sum of the _chance_closestGroup and every _chance_x element)( e_chance_cx= ((0.2 / x) * ((ron_interruption_enemy_inner_radius / _distance_x)+ linearConversion [2, 8, _numberOfUnits, 0, 0.1, true];)
* 
*/


if !(SET(interruption_enabled)) exitWith {false};

if (!isNil QPVAR(api_interruption_overwrite) && { PVAR(api_interruption_overwrite) isEqualType true }) exitWith { PVAR(api_interruption_overwrite) };

params ["_requester"];

private _pos = getPos _requester;


// get unique groups
private _grps = [];
[_pos, east, SET(interruption_enemy_outer_radius)] call FUNC(nearbyUnits) apply { _grps pushBackUnique group _x };

// Array of groups, their size, their distance, sorted by distance
_grps = [
    _grps apply { [_x, count units  _x, _pos distance2D leader _x]},
    [],
    { _x # 2 },
    "ASCEND"
] call BIS_fnc_sortBy;

private _maxDistance = SET(interruption_enemy_inner_radius);
private _totalChance = 0;

{
    private _individual_chance = switch (_forEachIndex) do {
        case 0: {
            (0.6 * ( (_maxDistance / _x#2) min 1) ) + linearConversion [2, 8, _x#1, 0, 0.1, true];
        };

        default {
            (0.2 / _forEachIndex) * ( ( ( _maxDistance / _x#2 ) min 1 ) + linearConversion [2, 8,  _x#1, 0, 0.1, true] ) ;
        };
    };
    
    _totalChance = _totalChance + _individual_chance;

} forEach _grps;

private _realChance = linearConversion [0, 1, _totalChance, SET(interruption_chance_min) min SET(interruption_chance_max), SET(interruption_chance_min) max SET(interruption_chance_max), true]; // 0.75 min _totalChance

random 1 < _realChance