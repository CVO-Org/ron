
/*
here, you put in your CBA Settings so they are available in the editor!

https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#create-a-custom-setting-for-mission-or-mod

MACROS Used:
SETLSTRING(test) -> [LSTRING(set_test), LSTRING(set_test_desc)] -> STR_prefix_component_set_test // STR_prefix_component_set_test_desc


SET(test) -> ADDON_set_test
QSET(test) -> "ADDON_set_test"
*/

[
    QSET(condition_didRonRecently),             //    _setting     - Unique setting name. Matches resulting variable name <STRING>
    "CHECKBOX",                                 //    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    SETLSTRING(condition_didRonRecently),
                                                //    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    [LSTRING(set_cat_main), LSTRING(set_cat_31Condition)],                //    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    true,                                       //    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    1,                                          //    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    {},                                         //    _script      - Script to execute when setting is changed. (optional) <CODE>
    false                                       //    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


[
    QSET(interruption_location_types),          //    _setting     - Unique setting name. Matches resulting variable name <STRING>
    "EDITBOX",                                  //    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    SETLSTRING(interruption_location_types),
                                                //    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    [LSTRING(set_cat_main), LSTRING(set_cat_32Condition)],                //    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    "NameLocal, NameVillage",                   //    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    1,                                          //    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    {
        PVAR(interruption_location_types) = _this splitString ", ";
    },                                          //    _script      - Script to execute when setting is changed. (optional) <CODE>
    false                                       //    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


[
    QSET(interruption_location_distance),        //    _setting     - Unique setting name. Matches resulting variable name <STRING>
    "SLIDER",                                //    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    SETLSTRING(interruption_location_distance),
                                            //    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    [LSTRING(set_cat_main), LSTRING(set_cat_32Condition)],                //    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    [100, 1000, 300, 0],                    //    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    1,                                        //    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    {},                                        //    _script      - Script to execute when setting is changed. (optional) <CODE>
    false                                    //    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


[
    QSET(suppress_supressed_cooldown),        //    _setting     - Unique setting name. Matches resulting variable name <STRING>
    "SLIDER",                                //    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    SETLSTRING(suppress_supressed_cooldown),
                                            //    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    [LSTRING(set_cat_main), LSTRING(set_cat_32Condition)],                //    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    [60, 600, 180, 0],                        //    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    1,                                        //    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    {},                                        //    _script      - Script to execute when setting is changed. (optional) <CODE>
    false                                    //    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


[
    QSET(interruption_enemy_inner_radius),        //    _setting     - Unique setting name. Matches resulting variable name <STRING>
    "SLIDER",                                //    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    SETLSTRING(interruption_enemy_inner_radius),
                                            //    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    [LSTRING(set_cat_main), LSTRING(set_cat_32Condition)],                //    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    [100, 500, 150, 0],                        //    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
    1,                                        //    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    {},                                        //    _script      - Script to execute when setting is changed. (optional) <CODE>
    false                                    //    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;
